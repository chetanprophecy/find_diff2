@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|570|rel_count|1019|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_CATALOG|@3|9|EFK|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/event/file_event_registration.xfr";
include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DB_XFR/distribute.publish_list.xfr";|8|9|RK|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_FILE_INFO|#Logical Target          Local MFS URL          Local Serial URL        Remote MFS URL          Remote Serial URL          DML Directory                //This parameter must be set in interim pset|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_FILE_INFO_VEC|$[get_publish_info_vec(TARGET_FILE_INFO)]|3|9|RK|@{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(TARGET_NAME) ]|3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_LOWER, "[.].*", "") ]|3|9|RK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ string_split( TARGET_LOWER, ".") [1]]|3|9|RK|@{0|}}
{30001002|XXparameter|IDS_SOURCE_NAME|$[string_split(TARGET_NAME, ".")[1]]|3|9|FK|@{0|}}
{30001002|XXparameter|DO_PROCESS_ILM_EVENTS|0|3|9|FK|@{0|}}
{30001002|XXparameter|ILM_NAME||3|9|FK|@{0|}}
{30001002|XXparameter|VARIATION||3|9|FK|@{0|}}
{30001002|XXparameter|REGISTRATION_DETAILS_VEC|$[ get_registration_details_for_flat_file(TARGET_SYSTEM, TARGET_ENTITY, DO_PROCESS_ILM_EVENTS) ]|3|9|RK|@{0|}}
{30001002|XXparameter|REGISTRATION_DETAILS|$[
if(length_of(REGISTRATION_DETAILS_VEC) == 0) (file_event_registration_type)allocate_with_defaults()
else if(length_of(REGISTRATION_DETAILS_VEC) == 1) REGISTRATION_DETAILS_VEC[0]
else if(DO_PROCESS_ILM_EVENTS == "0" && length_of(REGISTRATION_DETAILS_VEC) > 1) (for(let regs in REGISTRATION_DETAILS_VEC) : if(string_split(regs.source_name, ".")[1] == IDS_SOURCE_NAME) regs)[0]
else if(DO_PROCESS_ILM_EVENTS == "1" && length_of(REGISTRATION_DETAILS_VEC) > 1) force_error("ERROR: One target cannot be linked to muliple ILMs!")
else REGISTRATION_DETAILS_VEC[0]
]|3|9|K|@{0|}}
{30001002|XXparameter|FINAL_IDS_SOURCE_NAME|$[REGISTRATION_DETAILS.source_name]|3|9|RK|@{0|}}
{30001002|XXparameter|IDS_DATA_FILE_START_DATE||3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATA_FILE_END_DATE||3|9|FK|@{0|}}
{30001002|XXparameter|COMBINE_PSET_PARAMETER_INFO|$[
begin
let combine_pset = 
if(DO_PROCESS_ILM_EVENTS == "0" and IDS_SOURCE_NAME == string_split(TARGET_NAME, ".")[1])
  (AI_PSET + "/combine.file." + TARGET_SYSTEM + "/combine.file." + TARGET_NAME + ".pset")
else if(DO_PROCESS_ILM_EVENTS == "0" and IDS_SOURCE_NAME != string_split(TARGET_NAME, ".")[1])
  (AI_PSET + "/combine.file." + TARGET_SYSTEM + "/combine.file." + TARGET_NAME + "." + string_split(FINAL_IDS_SOURCE_NAME, ".")[1] + ".pset")
else 
  (if(VARIATION == "") AI_PSET + "/combine.file." + TARGET_SYSTEM + "/combine.file." + TARGET_NAME + "." + ILM_NAME + ".pset"
  else AI_PSET + "/combine.file." + TARGET_SYSTEM + "/combine.file." + TARGET_NAME + "." + ILM_NAME + "." + VARIATION + ".pset");

result :: pset_info(read_file(combine_pset)).parameters;
end
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DATASET_TYPE|$[begin
let parameter_info_type prm_info = allocate_with_defaults();
let target_dataset_type_index = -1;
prm_info.name = "TARGET_DATASET_TYPE";
target_dataset_type_index = vector_search(COMBINE_PSET_PARAMETER_INFO, prm_info, \{name\});
result :: if(target_dataset_type_index == -1) "Delta" else COMBINE_PSET_PARAMETER_INFO[target_dataset_type_index].value;
end
]|3|9|RK|@{2|Delta|Full|}}
{30001002|XXparameter|TARGET_IS_COMPRESSED|$[REGISTRATION_DETAILS.target_is_compressed]|13|9|RFK|@{0|}}
{30001002|XXparameter|PUBLISH_SERVER_TYPE|$[REGISTRATION_DETAILS.publish_server_type]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_LAYOUT|$[REGISTRATION_DETAILS.target_layout]|3|9|RK|@{0|}}
{30001002|XXparameter|CREATE_CSV|False|13|9|RFK|This parameter enables or disables the create csv subgraph.|{0|}}
{30001002|XXparameter|DO_WRITE_MULTIPLE_CSVS|False|13|9|FK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE_TYPE|$[ if(DO_WRITE_MULTIPLE_CSVS==1) "multi_csv_files" else if(CREATE_CSV==1) "csv_file" else if(TARGET_LAYOUT=="serial") "flat_file" else "mfs_file"]|3|9|RFK|@{5|mfs_file|flat_file|csv_file|multi_csv_files|xls_file|}}
{30001002|XXparameter|TARGET_FILE_NAME|$[if(OUTPUT_FILE_TYPE == "xls_file") TARGET_LOWER + ".xlsx" else if(OUTPUT_FILE_TYPE member [vector "csv_file", "multi_csv_files"]) TARGET_LOWER + ".csv" else if(TARGET_IS_COMPRESSED) TARGET_LOWER + ".dat.gz" else TARGET_LOWER + ".dat"]|3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_INFO|$[get_publish_info(TARGET_FILE_INFO_VEC, TARGET_NAME, TARGET_FILE_NAME, PUBLISH_SERVER_TYPE, TARGET_LAYOUT, (OUTPUT_FILE_TYPE=="multi_csv_files"? 1 : 0))]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_FILE|$[TARGET_INFO.target_file]|18|9|RK|@{0|}}
{30001002|XXparameter|TARGET_URL|$[TARGET_INFO.target_url]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML|$[TARGET_INFO.target_dml]|18|9|RFK|@{0|}}
{30001002|XXparameter|DO_CNTL|False|13|9|RFK|@{0|}}
{30001002|XXparameter|CNTL_XFR|out::reformat(in)=
begin
out. * :: in.*;
end;|8|9|FK|@{0|}}
{30001002|XXparameter|TARGET_CNTL_DML_FILE|$PUB_DXF_DML/distribute.control_file.dml|18|9|K|@{0|}}
{30001002|XXparameter|TARGET_CNTL_PRIVATE_DML_FILE|$PUB_DXF_DML/distribute.control_file.dml|3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_CNTL_FILE|$[TARGET_INFO.target_cntrl_file]|18|9|FK|@{0|}}
{30001002|XXparameter|LR_FILE_NAME|AB_PARAMETER_ENV|18|10|RKd|A vector of shred file names that match both the ILM pattern and the "logical" target table name.|{0|}}
{30001002|XXparameter|LR_FILE_DML|$[join_types("record\\n string(1) event_indicator; //Flag that would differentiate the records. I-Insert \| U-Update \| D- Delete\\n end" , read_file(TARGET_DML)) ]|7|9|RK|@{0|}}
{30001002|XXparameter|IDS_NATURAL_KEY|$[get_ids_table_nk(FINAL_IDS_SOURCE_NAME)]|19|9|K|@{0|}}
{30001002|XXparameter|DO_PARTITION|$[TARGET_LAYOUT == "mfs"]|13|9|RK|@{0|}}
{30001002|XXparameter|PARTITIONING_SCHEME|$[if(DO_PARTITION) "PBKS" else "GTHR"]|15|9|FK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NPNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PARTITIONING_KEY|$IDS_NATURAL_KEY|19|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SORT_KEY|$PARTITIONING_KEY|19|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|ETL_APP_ID|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|EVENT_CONSUMPTION_FILE_PATH|$\{AI_SERIAL\}/cnsm_log/file/cnsm_log.$\{TARGET_SYSTEM\}.$\{TARGET_ENTITY\}.dat|18|9|RK|@{0|}}
{30001002|XXparameter|CSV_FIELD_DELIMITER|','|15|9|FK|This parameter decides whether the CSV created will have field separator as comma or pipe|{2|','|'\|'|}}
{30001002|XXparameter|MULTI_CSV_MAP_TO_TARGET_XFR|$[
begin
  let string("") rfmt_xfr = "";
  let dml_field_info_item_vec tr_fields = [vector];
  if(OUTPUT_FILE_TYPE=="multi_csv_files") begin
    rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);
    tr_fields = record_info_item(read_file(TARGET_DML), "name");
    rfmt_xfr = add_local(rfmt_xfr, "data", "string('\\\\x01')[int]", '[vector]');
    for(let field in tr_fields)
      rfmt_xfr = add_statement(rfmt_xfr, "data = vector_append(data, if(string_index((string(''))in." + field + ", " + CSV_FIELD_DELIMITER + ")) '\\"' + in." + field + " + '\\"' else in." + field + ");");
    
    rfmt_xfr = add_rule(rfmt_xfr, "out.data", "data");
    rfmt_xfr = add_rule(rfmt_xfr, "out.file_name", TARGET_FILE_NAME);
  end
  result :: rfmt_xfr;
end
]|8|9|FK|Reformat transform|{0|}}
{30001002|XXparameter|LR_FILE_NAME:eme|$AI_MFS/$TARGET_SYSTEM.file/$TARGET_ENTITY.\{RUN_ID\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|LR_FILE_NAME:sandbox|$[
 begin
  let file_dir = AI_MFS + "/" + TARGET_SYSTEM + ".file";
  let string("") v_run_id= if( RUN_ID == "0" ) "??????????????" else  RUN_ID ;
// There would a unique RUN_ID for the Distribute Engine if not it takes the latest timestamp 
  let pattern =  TARGET_ENTITY + "." + v_run_id + ".dat.gz";  // Load ready file should have RUN_ID in the file pattern. By default it would be 

  let file_name_vec = directory_listing(file_dir,pattern);
  let latest_file_vec = vector_sort(file_name_vec, \{descending\}) ;  // CHecking for the latest LR file for the IDS Table 
  //let string("") file_nm ;
  if ( length_of(file_name_vec) == 0 )
   force_error("No load ready files found" +
     ": Target Table: " + TARGET_ENTITY +
     ", Pattern:\\n" + file_dir + "/" + pattern);
				
   result ::  if( RUN_ID != "0" ) 
                file_dir + "/" + pattern
                  else 			   
                file_dir + "/" + latest_file_vec[0] ;

  //result :: string_join(file_vec,"\\n");

end 
]|3|9||@{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|ETL_APP_ID:eme|APP_ORCA_RXCLAIM|3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID:sandbox|$(whoami)|3|9||@{0|}}
{30001002|XXparameter|CSV_HEADER||3|9|FK|@{0|}}
{30001002|XXparameter|LINE_DML|record
  string("\\n") data;
end|3|9|RK|@{0|}}
{30001002|XXparameter|DO_HEADER|False|13|9|FK|@{0|}}
{30001002|XXparameter|DO_TRAILER|False|13|9|FK|@{0|}}
{30001002|XXparameter|HEADER_DML|record
  string("\|") file_name;
  string("\\n") data_date;
end|3|9|FK|@{0|}}
{30001002|XXparameter|HEADER_XFR|@3|9|FK|@{0|}}
{30001002|XXparameter|TRAILER_DML|record
  decimal("\\n") record_count;
end|3|9|FK|@{0|}}
{30001002|XXparameter|TRAILER_XFR||3|9|FK|@{0|}}
{30001002|XXparameter|FILE_QUOTE_FLAG|False|13|9|FK|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|CREATE_HEADER_OUTPUT_WITHOUT_INPUT|Never|15|1|FKl|When to generate header even without any input rows set to 'At Component Shutdown' and define output_without_input transform in HEADER_XFR|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
{30001002|XXparameter|CREATE_TRAILER_OUTPUT_WITHOUT_INPUT|Never|15|1|FKl|When you want to generate trailer even without any input rows set to 'At Component Shutdown' and define output_without_input transform in TRAILER_XFR|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
{30001002|XXparameter|XLS_SHEET_NAME|Sheet1|3|9|FK|@{0|}}
{30001002|XXparameter|XLS_WRITE_MODE|new-workbook|15|2|FK$|Whether to completely overwrite or append to an existing workbook|{1|new-workbook|}}
{30001002|XXparameter|DO_XLS_MAPPING|False|13|9|FK|@{0|}}
{30001002|XXparameter|XLS_MAPPING_XFR_BRE||3|3|FKc|@{0|}}
{30001002|XXparameter|XLS_MAPPING_XFR_MANUAL|$[add_rules(make_transform("reformat",[vector make_arg("in")], [vector make_arg("out")]), [vector make_rule("out.filename","'" + TARGET_FILE_NAME + "'",1d),make_rule("out.sheet","'" + XLS_SHEET_NAME + "'",1d), make_rule("out.*","in.*")]);]|3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|OUTBOUND_FILTER_LKP_NAME|$[string_concat(AI_SERIAL_LOOKUP, "/", "filter_expression.",TARGET_ENTITY,".outbound.dat")]|3|9|EFK|@{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|$[begin

let string("") lookup_contents = if(file_information(OUTBOUND_FILTER_LKP_NAME).found) read_file(OUTBOUND_FILTER_LKP_NAME) else ""; 
result :: lookup_contents;

end]|3|9|K|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|distribute.publish.file|Gunit Kaur|Created 11/10/2016 7:11:04 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1547000|806000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'distribute.publish.file' Execution Status Report


Job "distribute.publish.file" Execution started at Tuesday, June 26, 2018 05:42:48
Job completed successfully at Tuesday, June 26, 2018 05:43:03

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:14
Run performed by user spulikon
Total data moved through all flows: 53 records (4084 bytes)
Total CPU time (all processes): 7 seconds
Average CPU utilization across all nodes: 0.00 percent
||
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apvrd44256 - HT2 Dev Server||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|128|140|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@PUBLISH TO LOCAL/REMOTE FILE SYSTEM|263000|16000|0|0|0|0|14399|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|128|240|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@TARGET_NAME: $TARGET_NAME  |316000|170000|333000|83000|111000|48000|14403|}}
{2010242002|XXGface|8|0|15|0|{@{}@Calibri|128|140|1|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Global outbound data
suppression|413000|253000|0|0|0|0|14552|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14526|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.040214478969573975|{0|}14510|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|0.0|{0|}14521|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@0|.5|.5|{0|}14553|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.6238937973976135|{0|}14544|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14554|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|0.0|{0|}14519|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}14527|19|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.9677419066429138|{0|}14541|2065|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}14532|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}14537|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}14534|17|}}
{2010600005|XXGgraph|23|0|45|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_CNTL]|3|9|F||{0|}}
{30001002|XXparameter|CNTL_XFR||8|8|FO=|Reformat transform|{0|}}
}}@0|@375956|507500|0|0|0|0|14432|Create Control File|Gunit Kaur|Created 2/6/2017 9:04:22 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|841000|227000|3|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}12989|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}12992|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}12993|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}12987|17|}}
{2010501005|XXGpvertex|28|0|55|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|642000|100000|0|0|0|0|12988|Dummy Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|29|0|57|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|30|0|60|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|31|0|63|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|32|0|65|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|33|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|34|0|71|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TARGET_CNTL_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$TARGET_CNTL_PRIVATE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|Layout|$TARGET_CNTL_FILE|3|2|$|@{0|}}
}}@0|@752913|88047|671000|285000|56000|50000|12985|Optional: Ctrl||@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|35|0|73|0|{@{}@661000|304000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|36|0|76|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|37|0|78|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|38|0|83|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|63000|98000|0|0|0|0|12978|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|39|0|85|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|40|0|88|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|41|0|90|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|42|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|43|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|44|0|98|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|/* This function is optional. */
/*Select input record*/
type temporary_type = record
decimal("") insert_rec_count = 0;
decimal("") update_rec_count = 0;
decimal("") delete_rec_count = 0;
end;


out::input_select(in)=
begin
out :: in.event_type == "Summarized Count";
end;

temp :: initialize(in) = 
begin
temp.insert_rec_count :: 0;
temp.update_rec_count :: 0;
temp.delete_rec_count :: 0;
end

/*Do computation*/
temp::rollup(temp, in)=
begin
  let string("")[int] event_text = string_split(in.event_text, "\|");
  temp.insert_rec_count :: temp.insert_rec_count + (decimal(""))string_split(event_text[0], "=")[1];
  temp.update_rec_count :: temp.update_rec_count + (decimal(""))string_split(event_text[1], "=")[1];
  temp.delete_rec_count :: temp.delete_rec_count + (decimal(""))string_split(event_text[2], "=")[1];
end;

out :: finalize(temp, in) = 
begin
  out.ids_source_name :: $"FINAL_IDS_SOURCE_NAME";
  out.target_dataset_type :: $"TARGET_DATASET_TYPE";
  out.insert_count :: if($"TARGET_DATASET_TYPE" == "Delta") temp.insert_rec_count else allocate_with_nulls();
  out.update_count :: if($"TARGET_DATASET_TYPE" == "Delta") temp.update_rec_count else allocate_with_nulls();
  out.delete_count :: if($"TARGET_DATASET_TYPE" == "Delta") temp.delete_rec_count else allocate_with_nulls();
  out.create_timestamp :: now1();
  out.total_count :: if($"TARGET_DATASET_TYPE" == "Full") (temp.insert_rec_count + temp.update_rec_count + temp.delete_rec_count) else allocate_with_nulls();
  out.etl_app_user_id :: $"ETL_APP_ID";
end|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$TARGET_CNTL_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|194000|50000|0|0|0|0|12991|RLP: Create Control File|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|45|0|100|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|46|0|103|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|47|0|105|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|48|0|107|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|109|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|50|0|112|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|51|0|114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|52|0|117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|53|0|120|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|54|0|123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|55|0|126|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|56|0|129|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
let insert_rec_count = 0;
let update_rec_count = 0;
let delete_rec_count = 0;

out::reformat(in)=
begin
insert_rec_count = if(in.event_indicator == "I") insert_rec_count + 1 else insert_rec_count;
update_rec_count = if(in.event_indicator == "U") update_rec_count + 1 else update_rec_count;
delete_rec_count = if(in.event_indicator == "D") delete_rec_count + 1 else delete_rec_count;
out.* :: in.*;
end;

/* This function is optional. */
/*Function to create final log record.*/
log_event::final_log_output()=
begin
log_event.event_type :: "Summarized Count";
log_event.event_text :: "Insert Count=" + (string(""))(decimal(""))insert_rec_count
                        + "\|Update Count=" + (string(""))(decimal(""))update_rec_count
                        + "\|Delete Count=" + (string(""))(decimal(""))delete_rec_count;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$TARGET_DML|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|166000|287000|0|0|0|0|14528|RFMT: Drop event indicator and generate final log output|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|57|0|131|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|58|0|134|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|59|0|136|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|60|0|138|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|61|0|141|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|62|0|144|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|63|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|64|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|65|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|66|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|67|0|159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|68|0|162|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LR_FILE_NAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LR_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$LR_FILE_DML|3|9||@{0|}}
}}@0|@29000|323000|0|0|0|0|14498|IFIL: Load Ready File|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|69|0|164|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|70|0|167|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|71|0|169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|72|0|178|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|400000|60000|0|0|0|0|12994|RFMT: Additional Trasform|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|73|0|180|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|74|0|183|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|75|0|185|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|76|0|187|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|77|0|189|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|78|0|192|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|79|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|80|0|198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|81|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|82|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|84|0|215|0|{@{}@0|0|0|0|in0|.5818713450292398|@@@13840|0|}}
{2010600005|XXGgraph|85|0|220|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="csv_file"]|3|9|F||{0|}}
{30001002|XXparameter|FILE_QUOTE_FLAG||13|8|FK=|Quote character is encoded by repeating (rather than escaping)|{0|}}
}}@0|@1161000|51500|0|0|0|0|14520|Create a CSV file||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1194000|406000|7|}}
{2010210004|XXGflow|86|0|222|0|{@{}@384|.5|.5|{0|}14145|17|}}
{2010210004|XXGflow|87|0|224|0|{@{}@384|.5|.5|{0|}14146|17|}}
{2010210004|XXGflow|88|0|226|0|{@{}@384|.5|.5|{0|}14127|17|}}
{2010210004|XXGflow|89|0|228|0|{@{}@384|.5|.5|{0|}14143|17|}}
{2010501005|XXGpvertex|90|0|230|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.data::"$\{CSV_HEADER\}";
end;|3|3|c|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[CSV_HEADER != ""]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|366000|104500|0|0|0|0|14128|CDAT : Create header|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|91|0|232|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|92|0|235|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|93|0|237|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|94|0|239|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|95|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|96|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|97|0|247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|98|0|250|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TARGET_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$TARGET_FILE|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@1021000|305000|0|0|0|0|14144|OFIL: Target CSV File|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|99|0|252|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|100|0|255|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|101|0|257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|102|0|260|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Write_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|record
        string("\\n") data;
end|3|1|l|@{0|}}
{30001002|XXparameter|field_separator|$CSV_FIELD_DELIMITER|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Separated Values|316000|279500|0|0|0|0|14147|WSV : Convert to CSV|Ab Initio Software|Built-in 2.15.2.r25:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|103|0|262|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|104|0|265|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|105|0|268|0|{Writes comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Separated_Values|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character (defaults to 'none')|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields|False|13|1|FKl|Do not field-delimit empty fields at the end of a record.|{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.display_name|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.keyword|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record|False|13|1|FKl|Generate a header record using the input dml record field names. If the input dml is not a record, 'data' is used as the single column name.|{0|}}
{30001002|XXparameter|provide_header_record.display_name|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record.keyword|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom|False|13|1|FKl|If the charset is unicode or utf8, generate a byte order marker. No effect otherwise.|{0|}}
{30001002|XXparameter|provide_bom.display_name|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom.keyword|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting|When needed|15|1|FKl|Specification of when to quote fields.|{4|When needed|Always|Never|Always including empty|}}
{30001002|XXparameter|field_quoting.display_name|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.keyword|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|trim_fields|None|15|1|FKl|Specification of whether or not to trim whitespace from a field, and if so how.|{4|None|Left|Right|Both|}}
{30001002|XXparameter|trim_fields.display_name|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.keyword|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|106|0|270|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|107|0|273|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|108|0|280|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Concatenate|611000|314500|0|0|0|0|14078|CONC : 1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|109|0|282|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|110|0|285|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|111|0|289|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|112|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|113|0|294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|114|0|301|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|146000|319500|0|0|0|0|14134|RPLC : 1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|115|0|303|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|116|0|306|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|117|0|308|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|118|0|310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|119|0|313|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|120|0|320|0|{@{}@0|0|0|0|in0|.3725|@@@13840|0|}}
{2010600005|XXGgraph|121|0|325|0|{Subgraph created from graph "distribute.publish.file"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE member [vector "flat_file", "mfs_file"]]|3|9|F||{0|}}
}}@0|@1384000|383000|0|0|0|0|14543|Create a serial/Multi file|Gunit Kaur|Created 6/12/2018 4:54:14 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|421000|542000|3|}}
{2010503005|XXGfvertex|122|0|327|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TARGET_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$TARGET_FILE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[
TARGET_IS_COMPRESSED]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@154000|400000|0|0|0|0|14084|OFIL: Compressed Target|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|123|0|329|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|124|0|331|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|125|0|333|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|126|0|336|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Redefine_Format.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|$[ if(DO_HEADER or DO_TRAILER) LINE_DML
   else expand_type(read_type(TARGET_DML))
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Redefine Format|430000|194000|0|0|0|0|14240|Redefine Format Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|127|0|338|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|128|0|340|0|{@{}@384|.5|.5|{0|}14239|1041|}}
{2010202004|XXGiport|129|0|342|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010210004|XXGflow|130|0|344|0|{@{}@384|.5|.5|{0|}14238|17|}}
{2010501005|XXGpvertex|131|0|346|0|{Copies data records from its input to its output without changing the values.  Use Redefine Format to change a record format or rename fields.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|copy|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=byte_copy(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Redefine Format|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|132|0|348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|133|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|134|0|354|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$TARGET_URL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE member [vector "flat_file", "mfs_file"]]|3|9||@{0|}}
}}@0|Replicate|1058000|487000|0|0|0|0|14540|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|135|0|356|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|136|0|360|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|137|0|363|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|138|0|365|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|139|0|368|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|140|0|374|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TARGET_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$TARGET_FILE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not TARGET_IS_COMPRESSED]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@149000|119000|0|0|0|0|14088|OFIL: Uncompressed Target|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|141|0|376|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|142|0|378|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|143|0|380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|144|0|384|0|{@{}@0|0|0|0|in0|.824468085106383|@@@13840|0|}}
{2010202004|XXGiport|145|0|388|0|{@{}@0|0|0|0|in1|.2322695035460993|@@@13840|0|}}
{2010600005|XXGgraph|146|0|392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|2|Pf$|@{0|}}
{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|$EXPRESSION_LOOKUP_CONTENTS|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@419000|310000|0|0|0|0|14555|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|1|}}
{2010600005|XXGgraph|147|0|394|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
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
{2010203004|XXGoport|148|0|396|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|149|0|399|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|150|0|402|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|151|0|405|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|152|0|408|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|153|0|410|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010600005|XXGgraph|154|0|417|0|{Subgraph created from graph "distribute.publish.file"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[(DO_HEADER or DO_TRAILER) && OUTPUT_FILE_TYPE member [vector "flat_file", "mfs_file"]]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|Create_Header_output_without_input||15|8|FK=|When to invoke the output_without_input transform function to produce an output record not corresponding to an input record.|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
{30001002|XXparameter|Create_Trailer_output_without_input||15|8|FK=|When to invoke the output_without_input transform function to produce an output record not corresponding to an input record.|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
}}@0|@818500|448000|0|0|0|0|14536|Header and Trailer|Gunit Kaur|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|770000|554000|3|}}
{2010240003|XXGlegend|155|0|419|0|{@{}@The output dml of the second redefine format (main data flow) is set differently
depending upon whether a header and/or trailer is required. This is done to
avoid using single line dml where not required.
|60000|454000|0|0|0|0|14241|}}
{2010242002|XXGface|156|0|421|0|{@{}@Arial|32768|110|0|}}
{2010240003|XXGlegend|157|0|423|0|{@{}@DO_HEADER: $DO_HEADER  |206000|133000|333000|83000|111000|48000|14221|}}
{2010242002|XXGface|158|0|425|0|{@{}@Calibri|128|140|0|}}
{2010240003|XXGlegend|159|0|427|0|{@{}@DO_TRAILER: $DO_TRAILER  |211000|398000|333000|83000|111000|48000|14220|}}
{2010242002|XXGface|160|0|429|0|{@{}@Calibri|128|140|0|}}
{2010210004|XXGflow|161|0|431|0|{@{}@384|.5|.5|{0|}14261|17|}}
{2010210004|XXGflow|162|0|433|0|{@{}@384|.5|.5|{0|}14260|17|}}
{2010210004|XXGflow|163|0|435|0|{@{}@384|.5|.5|{0|}14229|1041|}}
{2010210004|XXGflow|164|0|437|0|{@{}@384|.5|.5|{0|}14223|1041|}}
{2010210004|XXGflow|165|0|439|0|{@{}@384|.5|.5|{0|}14256|17|}}
{2010210004|XXGflow|166|0|443|0|{@{}@384|.5|.5|{0|}14255|17|}}
{2010501005|XXGpvertex|167|0|445|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Concatenate|656000|195000|0|0|0|0|14217|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|168|0|447|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|169|0|449|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|170|0|454|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|171|0|456|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|172|0|459|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|173|0|465|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|$HEADER_DML|3|9||@{0|}}
{30001002|XXparameter|transform|$HEADER_XFR|3|9||@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$DO_HEADER|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|output_without_input||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|209000|30000|0|0|0|0|14262|Create Header|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|174|0|467|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|175|0|470|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|176|0|472|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|177|0|474|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|178|0|476|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|179|0|479|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|180|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|181|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|182|0|487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|183|0|490|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|184|0|493|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|185|0|500|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|$TRAILER_DML|3|9||@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|$TRAILER_XFR|3|9||@{0|}}
{30001002|XXparameter|condition|$DO_TRAILER|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|output_without_input||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|211000|292000|0|0|0|0|14257|Create Trailer|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|186|0|502|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|187|0|505|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|188|0|507|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|189|0|509|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|190|0|511|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|191|0|514|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|192|0|516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|193|0|519|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|194|0|522|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|195|0|525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|196|0|528|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|197|0|536|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Redefine_Format.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Redefine Format|426000|60000|0|0|0|0|14224|Redefine Format Header|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|198|0|538|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|199|0|541|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|200|0|544|0|{Copies data records from its input to its output without changing the values.  Use Redefine Format to change a record format or rename fields.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|copy|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=byte_copy(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Redefine Format|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|201|0|546|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|202|0|549|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|203|0|555|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Redefine_Format.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Redefine Format|428000|319000|0|0|0|0|14230|Redefine Format Trailer|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|204|0|557|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|205|0|560|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|206|0|563|0|{Copies data records from its input to its output without changing the values.  Use Redefine Format to change a record format or rename fields.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|copy|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=byte_copy(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Redefine Format|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|207|0|565|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|208|0|568|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|209|0|574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|52000|195000|0|0|0|0|14208|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|210|0|576|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|211|0|581|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|212|0|583|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|213|0|585|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|214|0|588|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|215|0|594|0|{@{}@0|0|0|0|out0|.3669527896995708|@@@14352|0|}}
{2010202004|XXGiport|216|0|598|0|{@{}@0|0|0|0|in0|.37124463519313305|@@@13840|0|}}
{2010600005|XXGgraph|217|0|605|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/optional_partitioning.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|PARTITIONING_SCHEME||3|8|=|@{0|}}
{30001002|XXparameter|PBK_KEY||3|8|=|@{0|}}
{30001002|XXparameter|SRT_KEY||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[not (PUBLISH_SERVER_TYPE == "localhost" and PARTITIONING_SCHEME == "PBKS" and PARTITIONING_KEY == IDS_NATURAL_KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|2|$|@{0|}}
}}@0|@681500|302000|0|0|0|0|14533|Partition And/Or Sort||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1080000|567000|5|}}
{2010210004|XXGflow|218|0|607|0|{@{}@384|.5|.43525180220603943|{0|}12455|20|}}
{2010210004|XXGflow|219|0|609|0|{@{}@384|.5|.5|{0|}12450|17|}}
{2010210004|XXGflow|220|0|611|0|{@{}@384|.5|.5|{0|}12417|17|}}
{2010210004|XXGflow|221|0|613|0|{@{}@384|.5|.5|{0|}12445|17|}}
{2010210004|XXGflow|222|0|615|0|{@{}@384|.5|.5|{0|}12434|532|}}
{2010210004|XXGflow|223|0|617|0|{@{}@384|.5|.5|{0|}12446|17|}}
{2010210004|XXGflow|224|0|619|0|{@{}@384|.5|.5|{0|}12451|17|}}
{2010210004|XXGflow|225|0|621|0|{@{}@384|.5|.5507692098617554|{0|}12456|17|}}
{2010210004|XXGflow|226|0|623|0|{@{}@384|.5|.5|{0|}12404|17|}}
{2010210004|XXGflow|227|0|625|0|{@{}@384|.5|.5|{0|}12422|532|}}
{2010501005|XXGpvertex|228|0|627|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|495000|504000|0|0|0|0|12457|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|229|0|629|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|230|0|632|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|231|0|635|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$TARGET_URL|3|2|$|@{0|}}
}}@0|Replicate|919000|332000|0|0|0|0|14464|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|232|0|637|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|233|0|643|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|234|0|646|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|235|0|648|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|236|0|651|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|237|0|658|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Partition by Key|307000|116000|0|0|0|0|12406|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|238|0|660|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|239|0|663|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|240|0|668|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|521000|231000|0|0|0|0|12419|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|241|0|670|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|242|0|673|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|243|0|678|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|514000|114000|0|0|0|0|12424|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|244|0|680|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|245|0|683|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|246|0|688|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|101000|181000|0|0|0|0|12377|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|247|0|690|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|248|0|696|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|249|0|701|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|494000|395000|0|0|0|0|12447|Rplct : No Prttn No Srt|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|250|0|703|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|251|0|706|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|252|0|711|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|932000|225000|0|0|0|0|12437|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|253|0|713|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|254|0|715|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|255|0|724|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|654000|83000|0|0|0|0|12452|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|256|0|726|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|257|0|729|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|258|0|735|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|259|0|739|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|260|0|743|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PARTITIONING_SCHEME|PBRR|15|9|RFK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NBNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PBK_KEY||3|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SRT_KEY||3|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1478611637|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@353500|150000|0|0|0|0|12392|Partition And/Or Sort||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1080000|567000|7|}}
{2010210004|XXGflow|261|0|745|0|{@{}@384|.5|.43525180220603943|{0|}12425|20|}}
{2010210004|XXGflow|262|0|747|0|{@{}@384|.5|.5|{0|}12423|17|}}
{2010210004|XXGflow|263|0|749|0|{@{}@384|.5|.5|{0|}12417|17|}}
{2010210004|XXGflow|264|0|751|0|{@{}@384|.5|.5|{0|}12428|17|}}
{2010210004|XXGflow|265|0|753|0|{@{}@384|.5|.5|{0|}12418|532|}}
{2010210004|XXGflow|266|0|755|0|{@{}@384|.5|.5|{0|}12429|17|}}
{2010210004|XXGflow|267|0|757|0|{@{}@384|.5|.5|{0|}12394|17|}}
{2010210004|XXGflow|268|0|759|0|{@{}@384|.5|.5507692098617554|{0|}12426|17|}}
{2010210004|XXGflow|269|0|761|0|{@{}@384|.5|.5|{0|}12404|17|}}
{2010210004|XXGflow|270|0|763|0|{@{}@384|.5|.5|{0|}12422|532|}}
{2010501005|XXGpvertex|271|0|765|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[PARTITIONING_SCHEME == "GTHR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Gather|495000|504000|0|0|0|0|12427|Gather|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|272|0|767|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|273|0|770|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|274|0|773|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|275|0|775|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|276|0|778|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|277|0|781|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key|$PBK_KEY|3|9||@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS"]]|3|9||@{0|}}
}}@0|Partition by Key|307000|116000|0|0|0|0|12406|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|278|0|783|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|279|0|786|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|280|0|789|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Key|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|281|0|791|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|282|0|794|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|283|0|797|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|Replicate|101000|181000|0|0|0|0|12377|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|284|0|799|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|285|0|805|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|286|0|807|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|287|0|809|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|288|0|812|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|289|0|815|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "PBRR"]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Partition by Round-robin|521000|231000|0|0|0|0|12419|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|290|0|817|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|291|0|820|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|292|0|823|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|293|0|825|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|294|0|828|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|295|0|832|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS", "SORT"]]|3|9||@{0|}}
}}@0|Replicate|514000|114000|0|0|0|0|12424|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|296|0|834|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|297|0|837|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|298|0|840|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|299|0|842|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|300|0|845|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|301|0|848|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|Replicate|932000|225000|0|0|0|0|12397|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|302|0|850|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|303|0|852|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|304|0|858|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|305|0|860|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|306|0|863|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|307|0|867|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "NPNS"]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Replicate|494000|395000|0|0|0|0|12430|Rplct : No Prttn No Srt|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|308|0|869|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|309|0|872|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|310|0|875|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|311|0|877|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|312|0|880|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|313|0|885|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$SRT_KEY|3|9||@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "SORT", "PBKS"]]|3|9||@{0|}}
}}@0|Sort|654000|83000|0|0|0|0|12388|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|314|0|887|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|315|0|890|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|316|0|893|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|317|0|895|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|318|0|898|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|319|0|901|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|320|0|904|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|321|0|913|0|{Subgraph created from graph "distribute.publish.file"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[TARGET_DATASET_TYPE == "Delta"]|3|9|F||{0|}}
}}@0|@846500|673250|0|0|0|0|14524|Update Consumption Log|Gunit Kaur|Created 2/6/2017 9:04:30 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|419000|176000|3|}}
{2010210004|XXGflow|322|0|915|0|{@{}@384|.5|.5|{0|}12968|17|}}
{2010210004|XXGflow|323|0|917|0|{@{}@384|.5|.5|{0|}12966|17|}}
{2010503005|XXGfvertex|324|0|919|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$EVENT_CONSUMPTION_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@1|@297000|87500|0|0|0|0|12969|Consumption Log|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|325|0|921|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|326|0|924|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|327|0|926|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|328|0|929|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{AI_SERIAL\}/consumption_log/interim_log.$\{TARGET_SYSTEM\}.$\{TARGET_ENTITY\}.dat|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@1|@55000|88000|0|0|0|0|12967|Interim Events Log|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|329|0|931|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|330|0|934|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|331|0|936|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|332|0|939|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Replicate|195000|97500|0|0|0|0|12963|Updating Consumption Entry|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|333|0|941|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|334|0|944|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|335|0|947|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|336|0|949|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|337|0|952|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|338|0|958|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@35000|87000|0|0|0|0|14525|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|725000|389000|3|}}
{2010240003|XXGlegend|339|0|960|0|{@{}@Date|92000|251000|0|0|0|0|1482|}}
{2010242002|XXGface|340|0|962|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|341|0|964|0|{@{}@Author|217000|251000|0|0|0|0|1481|}}
{2010242002|XXGface|342|0|966|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|343|0|968|0|{@{}@Description|417000|251000|0|0|0|0|1480|}}
{2010242002|XXGface|344|0|970|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|345|0|972|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|346|0|974|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|347|0|976|0|{@{}@Initial version|412000|268000|0|0|0|0|1486|}}
{2010242002|XXGface|348|0|978|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|349|0|980|0|{@{}@Nov 10 2016|82000|268000|0|0|0|0|1478|}}
{2010242002|XXGface|350|0|982|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|351|0|984|0|{@{}@1.0|17000|268000|0|0|0|0|1455|}}
{2010242002|XXGface|352|0|986|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|353|0|988|0|{@{}@Gunit Kaur (Exusia)|187000|268000|0|0|0|0|1483|}}
{2010242002|XXGface|354|0|990|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|355|0|992|0|{@{}@Summary:

This graph publishes the load ready file created in combine process on remote/local server.
The attributes of the published file depend on the information in the registration file.|15000|42500|0|0|0|0|1442|}}
{2010242002|XXGface|356|0|994|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|357|0|996|0|{@{}@2.0|17000|288000|0|0|0|0|1487|}}
{2010242002|XXGface|358|0|998|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|359|0|1000|0|{@{}@Dec 16 2016|82000|288000|0|0|0|0|1479|}}
{2010242002|XXGface|360|0|1002|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|361|0|1004|0|{@{}@Gunit Kaur (Exusia)|187000|288000|0|0|0|0|1493|}}
{2010242002|XXGface|362|0|1006|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|363|0|1008|0|{@{}@Read ILM Events|412000|288000|0|0|0|0|1485|}}
{2010242002|XXGface|364|0|1010|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|365|0|1012|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|140000|0|0|0|0|1471|}}
{2010242002|XXGface|366|0|1014|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|367|0|1016|0|{@{}@3.0|17000|308000|0|0|0|0|1495|}}
{2010242002|XXGface|368|0|1018|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|369|0|1020|0|{@{}@Apr 26 2017|82000|308000|0|0|0|0|1491|}}
{2010242002|XXGface|370|0|1022|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|371|0|1024|0|{@{}@Prasad Tondare (Exusia)|187000|308000|0|0|0|0|1492|}}
{2010242002|XXGface|372|0|1026|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|373|0|1028|0|{@{}@CSV File|412000|308000|0|0|0|0|1501|}}
{2010242002|XXGface|374|0|1030|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|375|0|1032|0|{@{}@4.0|17000|333000|0|0|0|0|1496|}}
{2010242002|XXGface|376|0|1034|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|377|0|1036|0|{@{}@June 2018|82000|333000|0|0|0|0|1499|}}
{2010242002|XXGface|378|0|1038|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|379|0|1040|0|{@{}@Exusia|187000|333000|0|0|0|0|1500|}}
{2010242002|XXGface|380|0|1042|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|381|0|1044|0|{@{}@Publishing Single/Multiple Excel's functionality added|412000|333000|0|0|0|0|1502|}}
{2010242002|XXGface|382|0|1046|0|{@{}@Candara|0|100|0|}}
{2010600005|XXGgraph|383|0|1048|0|{Subgraph created from graph "distribute.publish.file"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="xls_file"]|3|9|RFK|@{0|}}
{30001002|XXparameter|XLS_WRITE_MODE||15|8|FK=|Whether to completely overwrite or append to an existing workbook|{2|new-workbook|append-records|}}
}}@0|@1156000|560500|0|0|0|0|14522|Write EXCEL file(s)/Sheet(s)|Gunit Kaur|Created 6/21/2018 4:52:30 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1167000|339000|3|}}
{2010210004|XXGflow|384|0|1050|0|{@{}@384|.5|.5|{0|}14521|17|}}
{2010210004|XXGflow|385|0|1052|0|{@{}@384|.5|.5|{0|}14513|17|}}
{2010210004|XXGflow|386|0|1054|0|{@{}@384|.5|.5|{8|968000|259000|988000|259000|1030000|259000|1051000|259000|}14519|17|}}
{2010210004|XXGflow|387|0|1056|0|{@{}@384|.5|.5|{0|}14522|17|}}
{2010600005|XXGgraph|388|0|1058|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_HEADER]|3|9|F||{0|}}
{30001002|XXparameter|FILE_QUOTE_FLAG|False|13|9|FK|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|1|Fl||{0|}}
}}@0|@551000|111500|0|0|0|0|14523|Attach Header Record|Gunit Kaur|Created 6/22/2018 8:00:30 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1420000|493000|3|}}
{2010210004|XXGflow|389|0|1060|0|{@{}@384|.5|.5|{0|}14631|17|}}
{2010210004|XXGflow|390|0|1062|0|{@{}@384|.5|.5|{0|}14639|1041|}}
{2010210004|XXGflow|391|0|1064|0|{@{}@384|.5|.5|{0|}14635|17|}}
{2010210004|XXGflow|392|0|1066|0|{@{}@384|.5|.5|{0|}14641|17|}}
{2010210004|XXGflow|393|0|1068|0|{@{}@384|.5|.5|{0|}14640|1041|}}
{2010210004|XXGflow|394|0|1070|0|{@{}@384|.5|.5|{0|}14633|17|}}
{2010210004|XXGflow|395|0|1072|0|{@{}@384|.5|.5|{0|}14637|17|}}
{2010501005|XXGpvertex|396|0|1074|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|$[
begin
//append filename, sheet at the start and rest_of_line at the end
result :: join_types(add_fields("record\\nend", [vector make_field("seq_nbr", "string('\\\\t')", "'0'"), make_field("filename", "string('\\\\t')", "''"), make_field("sheet", "string('\\\\t')", "''")]),in_metadata);
end;
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key_method|True|3|1|l|@{0|}}
{30001002|XXparameter|key|\{filename; sheet\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let int count = 0;

type temporary_type =
  record
    decimal("\\x01") seq_nbr;
    string("\\x01") filename;
    string("\\x01") sheet;
  end;

temp :: initialize(in) =
begin
  temp.seq_nbr :: count;
  temp.filename :: '';
  temp.sheet :: '';
end;

out :: scan(temp, in) =
begin
  count = if(temp.filename != in.filename && temp.sheet != in.sheet) count + 1 else count;
  out.seq_nbr ::  count;
  out.filename :: in.filename;
  out.sheet :: in.sheet;
end;

out :: finalize(temp, in) =
begin
  out.* :: in.*;
  out.seq_nbr :: temp.seq_nbr;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Scan|76000|179000|0|0|0|0|14632|Assign Seq nbr for each filename, sheet|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|397|0|1076|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|398|0|1079|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|399|0|1081|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|400|0|1083|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|401|0|1085|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|402|0|1087|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{2010203004|XXGoport|403|0|1089|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|404|0|1092|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|405|0|1095|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|406|0|1098|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|407|0|1101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|408|0|1105|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$[
begin
//append filename, sheet at the start and rest_of_line at the end
result :: join_types(add_fields("record\\nend", [vector make_field("filename", "string('\\\\t')", "''"), make_field("sheet", "string('\\\\t')", "''")]),in_metadata);
end;
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|$[ if(DO_XLS_MAPPING) XLS_MAPPING_XFR_BRE else XLS_MAPPING_XFR_MANUAL ]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|83000|107000|0|0|0|0|14511|EXCEL BRE/Default Mapping|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|409|0|1107|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|410|0|1110|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|411|0|1112|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|412|0|1114|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|413|0|1116|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|414|0|1118|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|415|0|1120|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|416|0|1124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|417|0|1127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|418|0|1130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|419|0|1133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|420|0|1140|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$[
begin
//append filename, sheet at the start and rest_of_line at the end
result :: join_types(add_fields("record\\nend", [vector make_field("filename", "string('\\\\t')", "''"), make_field("sheet", "string('\\\\t')", "''")]),remove_fields(in_metadata, "seq_nbr"));
end;
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|1267000|191000|0|0|0|0|14592|Back to excel format|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|421|0|1142|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|422|0|1144|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|423|0|1146|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|424|0|1148|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|425|0|1150|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|426|0|1153|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|427|0|1155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|428|0|1159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|429|0|1162|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|430|0|1165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|431|0|1168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|432|0|1174|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|major_key|\{filename; sheet\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{seq_nbr descending\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE_QUARTER|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|1078000|190000|0|0|0|0|14634|Bring Header to top|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|433|0|1176|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|434|0|1179|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|435|0|1182|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|436|0|1184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|437|0|1187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|438|0|1193|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|transform0|$[
begin

let dml_field_info_vec dml_vec = record_info(join_types(add_fields("record\\nend", [vector make_field("seq_nbr", "string('\\\\t')", "'0'"), make_field("filename", "string('\\\\t')", "''"), make_field("sheet", "string('\\\\t')", "''")]), read_file(TARGET_DML)));

let string("") rfmt_xfr = make_transform("reformat",[vector make_arg("in")], [vector make_arg("out")]);

for(let int i, i< length_of(dml_vec))
begin
        if(dml_vec[i].name member [vector "seq_nbr"])
                rfmt_xfr=add_rule(rfmt_xfr, "  out." + dml_vec[i].name, "  string_concat(in." + dml_vec[i].name + ", 'a')");
        else if(dml_vec[i].name not member [vector "filename", "sheet"])
                rfmt_xfr=add_rule(rfmt_xfr, "  out." + dml_vec[i].name, "'" + string_upcase(dml_vec[i].name) + "'");
        else
                rfmt_xfr=add_rule(rfmt_xfr, "  out." + dml_vec[i].name, "  in." + dml_vec[i].name);
end

result :: rfmt_xfr;

end
]|3|9||@{0|}}
{30001002|XXparameter|select||3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|652000|40000|0|0|0|0|14638|Generation header for each sheet/file|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|439|0|1195|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|440|0|1198|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|441|0|1200|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|442|0|1202|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|443|0|1204|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|444|0|1207|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|445|0|1209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|446|0|1213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|447|0|1216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|448|0|1219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|449|0|1222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|450|0|1229|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{filename; sheet\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Merge|943000|228000|0|0|0|0|14642|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|451|0|1231|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|452|0|1234|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|453|0|1238|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|454|0|1240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|455|0|1243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|456|0|1249|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{filename; sheet\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|434000|60000|0|0|0|0|14636|Remove Duplicates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|457|0|1251|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|458|0|1254|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|459|0|1256|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|460|0|1258|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|461|0|1260|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|462|0|1262|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|463|0|1265|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|464|0|1267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|465|0|1270|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|466|0|1273|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|467|0|1276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|468|0|1279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|469|0|1282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|470|0|1290|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|326000|230000|0|0|0|0|14570|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|471|0|1292|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|472|0|1296|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|473|0|1299|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|474|0|1301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|475|0|1304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|476|0|1310|0|{@{}@0|0|0|0|out0|.4381338742393509|@@@14352|0|}}
{2010202004|XXGiport|477|0|1314|0|{@{}@0|0|0|0|in0|.6997971602434077|@@@13840|0|}}
{2010501005|XXGpvertex|478|0|1319|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{filename; sheet\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|313000|116000|0|0|0|0|14514|Sort on filename, sheetname|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|479|0|1321|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|480|0|1324|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|481|0|1327|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|482|0|1329|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|483|0|1332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|484|0|1338|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|source_xls|$SOURCE_XLS|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Interchange/Excel/Write_Excel_Flow.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|autoSizeColumn|True|3|1|l|@{0|}}
{30001002|XXparameter|write_mode||3|8|=|@{0|}}
{30001002|XXparameter|JAVA_HOME|$JAVA_HOME|3|2|$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|utf8 record string('\\t') filename = ''; void(big endian integer(4)) xls_content = ''; end|3|1|l|@{0|}}
}}@0|@794000|125000|848000|214000|110000|113000|14520|Write Excel Flow|Ab Initio Software|Built-in 2.13.m8:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|485|0|1340|0|{@{}@957000|254000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|486|0|1343|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|487|0|1345|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|488|0|1347|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|489|0|1349|0|{@{}@838000|254000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|490|0|1352|0|{Writes Multiple Excel Flows based on Universal Adapter|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Excel_Flow|3|1|Hl||{0|}}
{30001002|XXparameter|image__|excel-connector.ksh|3|2|H$||{0|}}
{30001002|XXparameter|numDateFormats|1|1|1|Fl|Number of date formats understood on input.  Strings not matching one of these formats will be written as strings or numbers.|{0|}}
{30001002|XXparameter|numDateFormats.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|write_mode|new-workbook|15|1|FKl|Whether to completely overwrite or append to an existing workbook|{2|new-workbook|append-records|}}
{30001002|XXparameter|write_mode.display_name|write-mode|3|9|P|@{0|}}
{30001002|XXparameter|write_mode.keyword|write-mode|3|9|P|@{0|}}
{30001002|XXparameter|source_xls||18|2|RFK$|Workbook to read; input data appended to worksheets and written to xls contents|{0|}}
{30001002|XXparameter|source_xls.display_name|source-xls|3|9|P|@{0|}}
{30001002|XXparameter|source_xls.keyword|source-xls|3|9|P|@{0|}}
{30001002|XXparameter|source_xls.condition|param write-mode append-records|3|15|P?|@{0|}}
{30001002|XXparameter|utf8|True|13|1|FKl|Use UTF-8 encoding for output (recommended).  Otherwise, encoding will be locale specific.|{0|}}
{30001002|XXparameter|utf8.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|dateFormat0||3|2|FK$|Cells matching
this format will be treated as dates.  The following subset of DML datetime formats is supported:
YYYY, MM, DD, HH24, MI, SS, N[NN].  For example, 'YYYY-MM-DD HH24:MI:SS.NNN'.|{0|}}
{30001002|XXparameter|dateFormat0.index|numDateFormats|3|9|P|@{0|}}
{30001002|XXparameter|dateFormat0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dateFormat0.index_name|dateFormat|3|9|P|@{0|}}
{30001002|XXparameter|leading_quote_special|True|13|1|FKl|If true, leading quote stripped off and rest of value placed in text cell.|{0|}}
{30001002|XXparameter|leading_quote_special.display_name|leading-quote-special|3|9|P|@{0|}}
{30001002|XXparameter|leading_quote_special.keyword|leading-quote-special|3|9|P|@{0|}}
{30001002|XXparameter|leading_quote_special.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|numbersAsStrings|False|13|1|RFKl|Write input that looks like numbers as strings, not as Excel numbers.|{0|}}
{30001002|XXparameter|numbersAsStrings.condition|param leading-quote-special False|3|15|P?|@{0|}}
{30001002|XXparameter|record_delimiter_type|explicit|15|1|Fl|Enter an explicit delimiter or accept any newline. (\\n, \\r\\n or \\r)|{2|explicit|any-newline|}}
{30001002|XXparameter|record_delimiter_type.display_name|record-delimiter-type|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter_type.update_clauses|update_value any-newline|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter|\\0|3|2|FK$|Delimiter of last field or record. Must not occur in the data.|{0|}}
{30001002|XXparameter|record_delimiter.display_name|record-delimiter|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter.keyword|record-delimiter|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter.condition|param record-delimiter-type explicit|3|15|P?|@{0|}}
{30001002|XXparameter|autoSizeColumn|False|13|1|FKl|Adjusts the column width to fit the contents. This can be slow on large sheets|{0|}}
{30001002|XXparameter|autoSizeColumn.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|use_format|False|13|1|FKl|Load format information associated with the cell. Use gendml after chaning this|{0|}}
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
{30001002|XXparameter|writeit|-write|3|2|$||{0|}}
{30001002|XXparameter|print_dml|-print-dml|3|2|$||{0|}}
{30001002|XXparameter|print_dml.display_name|print-dml|3|9|P|@{0|}}
{30001002|XXparameter|cmd_dml|excel-connector.ksh|3|2|$||{0|}}
{30001002|XXparameter|cmd_dml_params|writeit positional print-dml positional utf8 keyword record-delimiter keyword|3|2|$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl|Record Format|{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1308577603|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: in = "utf8 record string('\\\\t') filename = ''; string('\\\\t') sheet; string('\\\\0') line; end"
metadata type: out = "utf8 record string('\\\\t') filename = ''; void(big endian integer(4)) xls_content = ''; end"
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|491|0|1354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|492|0|1357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|493|0|1360|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|494|0|1363|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|495|0|1366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=|Record Format|{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|496|0|1373|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|type output_type=void(big endian integer(4)); /*Metadata for records written to output files*/

filename::get_filename(in)=
begin
  filename :: "$\{TARGET_URL\}/" + in.filename;
end;

write :: reformat(in) =
begin
  write :: in.xls_content;
end;|3|3|c|@{0|}}
{30001002|XXparameter|write_stripped|Strip length prefix or delimiter|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1013000|125000|1062000|214000|114000|113000|14517|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|497|0|1375|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|498|0|1377|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|499|0|1379|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|500|0|1381|0|{@{}@1052000|254000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|501|0|1384|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|write_stripped|Do not strip; retain length prefix or delimiter|15|1|Fl|Controls whether any size prefix or delimiter is removed from records before they are written to the file|{2|Do not strip; retain length prefix or delimiter|Strip length prefix or delimiter|}}
{30001002|XXparameter|write_stripped.display_name|write-stripped|3|9|P|@{0|}}
{30001002|XXparameter|write_stripped.condition|version 2.14.9:|3|15|P?|@{0|}}
{30001002|XXparameter|write_raw_data|value write-stripped Do* 0 value write-stripped Strip* 1 default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|permissions|660|3|2|FK$|unix-style numeric permissions mask for newly created files|{0|}}
{30001002|XXparameter|file_limits|Files (Limited by number of output files)|15|1|Fl|Limits the number of files that can be open simultaneously|{3|None (No limits on resource usage)|Memory (Limited by total memory usage)|Files (Limited by number of output files)|}}
{30001002|XXparameter|file_limits.display_name|file-limits|3|9|P|@{0|}}
{30001002|XXparameter|max_core|13107200|1|2|FK$|Maximum memory usage (for file output buffers) in bytes. This corresponds to 100 open files|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param file-limits Memory*|3|15|P?|@{0|}}
{30001002|XXparameter|max_files|100|1|2|FK$|Maximum number of simultaneously open files|{0|}}
{30001002|XXparameter|max_files.display_name|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.keyword|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.condition|param file-limits Files*|3|15|P?|@{0|}}
{30001002|XXparameter|create_directories|False|13|1|FKl|If True, create any parent directories as necessary|{0|}}
{30001002|XXparameter|create_directories.display_name|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.keyword|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.condition|version 2.15.5.r32:|3|15|P?|@{0|}}
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
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation2_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1304087714|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|502|0|1386|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|503|0|1389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|504|0|1392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|505|0|1395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|506|0|1401|0|{@{}@0|0|0|0|in0|.4948717948717949|@@@13840|0|}}
{2010600005|XXGgraph|507|0|1406|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="multi_csv_files"]|3|9|F||{0|}}
{30001002|XXparameter|FILE_QUOTE_FLAG||13|8|FK=|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|MAP_TO_TARGET_XFR||8|8|FO=|Reformat transform|{0|}}
}}@0|@1156000|186500|0|0|0|0|14511|Write Multiple CSVs|Gunit Kaur|Created 6/5/2017 10:47:39 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1274000|563000|3|}}
{2010210004|XXGflow|508|0|1408|0|{@{}@384|.5|.5|{0|}14233|17|}}
{2010210004|XXGflow|509|0|1410|0|{@{}@384|.5|.5|{0|}14220|17|}}
{2010210004|XXGflow|510|0|1412|0|{@{}@384|.5|.5|{0|}14231|17|}}
{2010210004|XXGflow|511|0|1414|0|{@{}@384|.5|0.0|{0|}14232|17|}}
{2010210004|XXGflow|512|0|1416|0|{@{}@384|.5|.5|{0|}14229|17|}}
{2010210004|XXGflow|513|0|1418|0|{@{}@384|.5|.5|{0|}14222|17|}}
{2010501005|XXGpvertex|514|0|1420|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Concatenate|915000|223000|0|0|0|0|14165|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|515|0|1422|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|516|0|1425|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|517|0|1429|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|518|0|1431|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|519|0|1434|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|520|0|1438|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan_with_Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|$[
begin
  let string("") init_xfr = make_transform("initialize", [vector make_arg("in")], [vector make_arg("temp")]);
  let string("") scan_xfr = make_transform("scan", [vector make_arg("temp"), make_arg("in")], [vector make_arg("temp")]);
  let string("") final_xfr = make_transform("finalize", [vector make_arg("temp"), make_arg("in")], [vector make_arg("out")]);
  let string("") rlp_xfr = make_transform("rollup_finalize", [vector make_arg("temp"), make_arg("in")], [vector make_arg("rollup")]);

  final_xfr = add_rule(final_xfr, "out.data", "string_join(in.data, " + CSV_FIELD_DELIMITER + ")");
  final_xfr = add_rule(final_xfr, "out.*", "in.*");
  
  rlp_xfr = add_rule(rlp_xfr, "rollup.data", "'" + CSV_HEADER + "'");
  rlp_xfr = add_rule(rlp_xfr, "rollup.*", "in.*");
  result :: 'type temporary_type = record end;\\n\\n' + init_xfr + "\\n" + scan_xfr + "\\n" + final_xfr + "\\n" + rlp_xfr;
end
]|3|9||@{0|}}
{30001002|XXparameter|key|\{file_name\}|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\x01") file_name;
  string("\\n") data;
end|3|1|l|@{0|}}
{30001002|XXparameter|rollup_metadata|record
  string("\\x01") file_name;
  string("\\n") data;
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Scan with Rollup|636000|190000|0|0|0|0|14234|Group on file name to generate header for each file|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|521|0|1440|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|522|0|1443|0|{@{}@0|0|0|0|rollup|0.0|@@@2448|0|}}
{2010203004|XXGoport|523|0|1446|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|524|0|1448|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|525|0|1450|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|526|0|1452|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|527|0|1455|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records (1 output record per input record). Rollup output port generates data records that summarize groups of data records (1 rollup record per group). Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, SCAN WITH ROLLUP processes the data in-memory without sorting it.|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate steps in scan|{0|}}
{30001002|XXparameter|variable1|temporary_type temp "record end"|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp::initialize(in)|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp::scan(temp, in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|out::finalize(temp, in)|3|2|H$|Create output scan record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output scan record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation7|rollup::rollup_finalize(temp, in)|3|2|H$|Create rollup record|{0|}}
{30001002|XXparameter|operation8|optional integer(8) out::rollup_select(rollup)|3|2|H$|Select rollup record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output scan record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation8_analysis|integer(8) rollup_select_out::rollup_select(rollup)|3|2|H$||{0|}}
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
{30001002|XXparameter|HelpID|comp_scan_with_rollup|3|2|FH$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select); rollup=filter_xfr(transform.input_select); rollup=filter_xfr(transform.rollup_select); rollup=aggregate(key)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation9|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation10|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation12|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|rollup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,rollup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Scan with Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|528|0|1457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|529|0|1460|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|rollup|0.0|@@@2448|0|}}
{2010203004|XXGoport|530|0|1463|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|531|0|1466|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|532|0|1469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|533|0|1472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|534|0|1476|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|out0_metadata|record
  string("\\x01") file_name;
  string("\\n")[delimiter == "\\x01"]  data;
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|272000|190000|0|0|0|0|14221|RFMT: Calculate file name and accumulate data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|535|0|1478|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|536|0|1481|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|537|0|1483|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|538|0|1485|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|539|0|1487|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|540|0|1490|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|541|0|1492|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|542|0|1496|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|543|0|1499|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|544|0|1502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|545|0|1505|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|546|0|1516|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|141000|244500|0|0|0|0|14195|RPLC : 1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|547|0|1518|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|548|0|1521|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|549|0|1523|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|550|0|1525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|551|0|1528|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|552|0|1534|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{file_name\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|475000|205000|0|0|0|0|14223|SORT on file_name|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|553|0|1536|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|554|0|1539|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|555|0|1542|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|556|0|1544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|557|0|1547|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|558|0|1553|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|type output_type = record
   string("\\n") data;
end;

/*extract filename from input record*/
filename::get_filename(in)=
begin
  filename :: $'TARGET_URL' + "/" + in.file_name;
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Write Multiple Files|1013000|193500|0|0|0|0|14230|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|559|0|1555|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|560|0|1557|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|561|0|1559|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|562|0|1561|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|563|0|1564|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
{30001002|XXparameter|schema_file.display_name|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.keyword|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.condition|param format avro|3|15|P?|@{0|}}
{30001002|XXparameter|write_stripped|Do not strip; retain length prefix or delimiter|15|1|Fl|Controls whether any size prefix or delimiter is removed from records before they are written to the file|{2|Do not strip; retain length prefix or delimiter|Strip length prefix or delimiter|}}
{30001002|XXparameter|write_stripped.display_name|write-stripped|3|9|P|@{0|}}
{30001002|XXparameter|write_stripped.condition|version 2.14.9:|3|15|P?|@{0|}}
{30001002|XXparameter|write_raw_data|value write-stripped Do* 0 value write-stripped Strip* 1 default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|permissions|660|3|2|FK$|unix-style numeric permissions mask for newly created files|{0|}}
{30001002|XXparameter|file_limits|Files (Limited by number of output files)|15|1|Fl|Limits the number of files that can be open simultaneously|{3|None (No limits on resource usage)|Memory (Limited by total memory usage)|Files (Limited by number of output files)|}}
{30001002|XXparameter|file_limits.display_name|file-limits|3|9|P|@{0|}}
{30001002|XXparameter|max_core|13107200|1|2|FK$|Maximum memory usage (for file output buffers) in bytes. This corresponds to 100 open files|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param file-limits Memory*|3|15|P?|@{0|}}
{30001002|XXparameter|max_files|100|1|2|FK$|Maximum number of simultaneously open files|{0|}}
{30001002|XXparameter|max_files.display_name|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.keyword|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.condition|param file-limits Files*|3|15|P?|@{0|}}
{30001002|XXparameter|create_directories|False|13|1|FKl|If True, create any parent directories as necessary|{0|}}
{30001002|XXparameter|create_directories.display_name|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.keyword|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.condition|version 2.15.5.r32:|3|15|P?|@{0|}}
{30001002|XXparameter|atomic|False|13|1|FKl|If True, file is spooled to temporary, and then renamed atomically|{0|}}
{30001002|XXparameter|atomic.condition|param overwrite True version 3.1.3.r16.0:|3|15|P?|@{0|}}
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
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation2_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|564|0|1566|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|565|0|1569|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|566|0|1572|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|567|0|1575|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|568|0|1581|0|{@{}@0|0|0|0|in0|.3725|@@@13840|0|}}
{2010110002|XXGconstant|569|0|1587|0|{@{}@{1|5318128|}}}
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
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_10|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_11|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_12|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_2|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_3|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_4|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_5|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_6|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_7|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_8|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_9|}1|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{Create_Control_File|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_1|}23|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_2|}23|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_3|}23|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_7|}23|27|}
{2010601001|XXGgraph_vertex_vertex|27|0|54|0|{Dummy_Replicate|}23|28|}
{2010212001|XXGvertex_oport_oport|28|0|56|0|{0|out|}28|29|}
{2010213001|XXGoport_dst_flow|29|0|58|0|{0|}29|27|}
{2010211001|XXGvertex_iport_iport|30|0|59|0|{0|in|}28|30|}
{2010214001|XXGiport_src_flow|31|0|61|0|{0|}30|26|}
{2010007001|XXGobject_proto_object|32|0|62|0|{}28|31|}
{2010212001|XXGvertex_oport_oport|33|0|64|0|{0|out|}31|32|}
{2010006001|XXGobject_psameas_object|34|0|66|0|{metadata|out_metadata|1|0|}32|31|}
{2010211001|XXGvertex_iport_iport|35|0|67|0|{0|in|}31|33|}
{2010006001|XXGobject_psameas_object|36|0|69|0|{metadata|in_metadata|1|0|}33|31|}
{2010006001|XXGobject_psameas_object|37|0|70|0|{Layout|Layout|0|0|}28|34|}
{2010211001|XXGvertex_iport_iport|38|0|72|0|{0|write|}34|35|}
{2010214001|XXGiport_src_flow|39|0|74|0|{0|}35|27|}
{2010007001|XXGobject_proto_object|40|0|75|0|{}34|36|}
{2010211001|XXGvertex_iport_iport|41|0|77|0|{0|write|}36|37|}
{2010006001|XXGobject_psameas_object|42|0|79|0|{metadata|write_metadata|1|0|}37|36|}
{2010006001|XXGobject_psameas_object|43|0|80|0|{in_metadata|write_metadata|0|0|}28|34|}
{2010006001|XXGobject_psameas_object|44|0|81|0|{out_metadata|write_metadata|0|0|}28|34|}
{2010601001|XXGgraph_vertex_vertex|45|0|82|0|{Gather|}23|38|}
{2010212001|XXGvertex_oport_oport|46|0|84|0|{0|out|}38|39|}
{2010213001|XXGoport_dst_flow|47|0|86|0|{0|}39|24|}
{2010211001|XXGvertex_iport_iport|48|0|87|0|{0|in|}38|40|}
{2010007001|XXGobject_proto_object|49|0|89|0|{}38|41|}
{2010212001|XXGvertex_oport_oport|50|0|91|0|{0|out|}41|42|}
{2010006001|XXGobject_psameas_object|51|0|93|0|{metadata|out_metadata|1|0|}42|41|}
{2010211001|XXGvertex_iport_iport|52|0|94|0|{0|in|}41|43|}
{2010006001|XXGobject_psameas_object|53|0|96|0|{metadata|in_metadata|1|0|}43|41|}
{2010006001|XXGobject_psameas_object|54|0|97|0|{Layout|Layout|0|0|}38|44|}
{2010212001|XXGvertex_oport_oport|55|0|99|0|{0|out|}44|45|}
{2010213001|XXGoport_dst_flow|56|0|101|0|{0|}45|25|}
{2010212001|XXGvertex_oport_oport|57|0|102|0|{1|reject|}44|46|}
{2010212001|XXGvertex_oport_oport|58|0|104|0|{2|error|}44|47|}
{2010212001|XXGvertex_oport_oport|59|0|106|0|{3|log|}44|48|}
{2010211001|XXGvertex_iport_iport|60|0|108|0|{0|in|}44|49|}
{2010214001|XXGiport_src_flow|61|0|110|0|{0|}49|24|}
{2010007001|XXGobject_proto_object|62|0|111|0|{}44|50|}
{2010212001|XXGvertex_oport_oport|63|0|113|0|{0|out|}50|51|}
{2010006001|XXGobject_psameas_object|64|0|115|0|{metadata|out_metadata|1|0|}51|50|}
{2010212001|XXGvertex_oport_oport|65|0|116|0|{1|reject|}50|52|}
{2010006001|XXGobject_psameas_object|66|0|118|0|{metadata|reject_metadata|1|0|}52|50|}
{2010212001|XXGvertex_oport_oport|67|0|119|0|{2|error|}50|53|}
{2010006001|XXGobject_psameas_object|68|0|121|0|{metadata|error_metadata|1|0|}53|50|}
{2010212001|XXGvertex_oport_oport|69|0|122|0|{3|log|}50|54|}
{2010006001|XXGobject_psameas_object|70|0|124|0|{metadata|log_metadata|1|0|}54|50|}
{2010211001|XXGvertex_iport_iport|71|0|125|0|{0|in|}50|55|}
{2010006001|XXGobject_psameas_object|72|0|127|0|{metadata|in_metadata|1|0|}55|50|}
{2010006001|XXGobject_psameas_object|73|0|128|0|{in_metadata|log_metadata|0|0|}44|56|}
{2010212001|XXGvertex_oport_oport|74|0|130|0|{0|out0|}56|57|}
{2010213001|XXGoport_dst_flow|75|0|132|0|{0|}57|14|}
{2010212001|XXGvertex_oport_oport|76|0|133|0|{1|reject0|}56|58|}
{2010212001|XXGvertex_oport_oport|77|0|135|0|{2|error0|}56|59|}
{2010212001|XXGvertex_oport_oport|78|0|137|0|{3|log|}56|60|}
{2010213001|XXGoport_dst_flow|79|0|139|0|{0|}60|18|}
{2010211001|XXGvertex_iport_iport|80|0|140|0|{0|in|}56|61|}
{2010214001|XXGiport_src_flow|81|0|142|0|{0|}61|11|}
{2010007001|XXGobject_proto_object|82|0|143|0|{}56|62|}
{2010212001|XXGvertex_oport_oport|83|0|145|0|{0|out0|}62|63|}
{2010006001|XXGobject_psameas_object|84|0|147|0|{metadata|out0_metadata|1|0|}63|62|}
{2010006001|XXGobject_psameas_object|85|0|148|0|{transform0|transform0|1|0|}63|62|}
{2010212001|XXGvertex_oport_oport|86|0|149|0|{1|reject0|}62|64|}
{2010006001|XXGobject_psameas_object|87|0|151|0|{metadata|reject0_metadata|1|0|}64|62|}
{2010212001|XXGvertex_oport_oport|88|0|152|0|{2|error0|}62|65|}
{2010006001|XXGobject_psameas_object|89|0|154|0|{metadata|error0_metadata|1|0|}65|62|}
{2010212001|XXGvertex_oport_oport|90|0|155|0|{3|log|}62|66|}
{2010006001|XXGobject_psameas_object|91|0|157|0|{metadata|log_metadata|1|0|}66|62|}
{2010211001|XXGvertex_iport_iport|92|0|158|0|{0|in|}62|67|}
{2010006001|XXGobject_psameas_object|93|0|160|0|{metadata|in_metadata|1|0|}67|62|}
{2010006001|XXGobject_psameas_object|94|0|161|0|{Layout|Layout|0|0|}56|68|}
{2010212001|XXGvertex_oport_oport|95|0|163|0|{0|read|}68|69|}
{2010213001|XXGoport_dst_flow|96|0|165|0|{0|}69|11|}
{2010007001|XXGobject_proto_object|97|0|166|0|{}68|70|}
{2010212001|XXGvertex_oport_oport|98|0|168|0|{0|read|}70|71|}
{2010006001|XXGobject_psameas_object|99|0|170|0|{metadata|read_metadata|1|0|}71|70|}
{2010006001|XXGobject_psameas_object|100|0|171|0|{in_metadata|read_metadata|0|0|}56|68|}
{2010006001|XXGobject_psameas_object|101|0|172|0|{reject0_metadata|read_metadata|0|0|}56|68|}
{2010006001|XXGobject_psameas_object|102|0|173|0|{reject_metadata|log_metadata|0|0|}44|56|}
{2010006001|XXGobject_psameas_object|103|0|174|0|{in_metadata|log_metadata|0|0|}38|56|}
{2010006001|XXGobject_psameas_object|104|0|175|0|{out_metadata|log_metadata|0|0|}38|56|}
{2010601001|XXGgraph_vertex_vertex|105|0|176|0|{Optional_Ctrl|}23|34|}
{2010601001|XXGgraph_vertex_vertex|106|0|177|0|{RFMT_Additional_Trasform|}23|72|}
{2010212001|XXGvertex_oport_oport|107|0|179|0|{0|out0|}72|73|}
{2010213001|XXGoport_dst_flow|108|0|181|0|{0|}73|26|}
{2010212001|XXGvertex_oport_oport|109|0|182|0|{1|reject0|}72|74|}
{2010212001|XXGvertex_oport_oport|110|0|184|0|{2|error0|}72|75|}
{2010212001|XXGvertex_oport_oport|111|0|186|0|{3|log|}72|76|}
{2010211001|XXGvertex_iport_iport|112|0|188|0|{0|in|}72|77|}
{2010214001|XXGiport_src_flow|113|0|190|0|{0|}77|25|}
{2010007001|XXGobject_proto_object|114|0|191|0|{}72|78|}
{2010212001|XXGvertex_oport_oport|115|0|193|0|{0|out0|}78|79|}
{2010006001|XXGobject_psameas_object|116|0|195|0|{metadata|out0_metadata|1|0|}79|78|}
{2010006001|XXGobject_psameas_object|117|0|196|0|{transform0|transform0|1|0|}79|78|}
{2010212001|XXGvertex_oport_oport|118|0|197|0|{1|reject0|}78|80|}
{2010006001|XXGobject_psameas_object|119|0|199|0|{metadata|reject0_metadata|1|0|}80|78|}
{2010212001|XXGvertex_oport_oport|120|0|200|0|{2|error0|}78|81|}
{2010006001|XXGobject_psameas_object|121|0|202|0|{metadata|error0_metadata|1|0|}81|78|}
{2010212001|XXGvertex_oport_oport|122|0|203|0|{3|log|}78|82|}
{2010006001|XXGobject_psameas_object|123|0|205|0|{metadata|log_metadata|1|0|}82|78|}
{2010211001|XXGvertex_iport_iport|124|0|206|0|{0|in|}78|83|}
{2010006001|XXGobject_psameas_object|125|0|208|0|{metadata|in_metadata|1|0|}83|78|}
{2010006001|XXGobject_psameas_object|126|0|209|0|{in_metadata|out_metadata|0|0|}72|44|}
{2010006001|XXGobject_psameas_object|127|0|210|0|{out0_metadata|write_metadata|0|0|}72|34|}
{2010006001|XXGobject_psameas_object|128|0|211|0|{reject0_metadata|out_metadata|0|0|}72|44|}
{2010006001|XXGobject_psameas_object|129|0|212|0|{transform0|CNTL_XFR|1|0|}72|23|}
{2010601001|XXGgraph_vertex_vertex|130|0|213|0|{RLP_Create_Control_File|}23|44|}
{2010211001|XXGvertex_iport_iport|131|0|214|0|{0|in0|}23|84|}
{2010215002|XXGiport_binding_iport|132|0|216|0|{.5|.5|{0|}12995|}84|40|}
{2010214001|XXGiport_src_flow|133|0|217|0|{0|}84|18|}
{2010006001|XXGobject_psameas_object|134|0|218|0|{CNTL_XFR|CNTL_XFR|1|0|}23|1|}
{2010601001|XXGgraph_vertex_vertex|135|0|219|0|{Create_a_CSV_file|}1|85|}
{2010604001|XXGgraph_flow_flow|136|0|221|0|{Flow_1|}85|86|}
{2010604001|XXGgraph_flow_flow|137|0|223|0|{Flow_2|}85|87|}
{2010604001|XXGgraph_flow_flow|138|0|225|0|{Flow_3|}85|88|}
{2010604001|XXGgraph_flow_flow|139|0|227|0|{Flow_4|}85|89|}
{2010601001|XXGgraph_vertex_vertex|140|0|229|0|{CDAT_Create_header|}85|90|}
{2010212001|XXGvertex_oport_oport|141|0|231|0|{0|out|}90|91|}
{2010213001|XXGoport_dst_flow|142|0|233|0|{0|}91|88|}
{2010212001|XXGvertex_oport_oport|143|0|234|0|{1|error|}90|92|}
{2010212001|XXGvertex_oport_oport|144|0|236|0|{2|log|}90|93|}
{2010007001|XXGobject_proto_object|145|0|238|0|{}90|94|}
{2010212001|XXGvertex_oport_oport|146|0|240|0|{0|out|}94|95|}
{2010006001|XXGobject_psameas_object|147|0|242|0|{metadata|out_metadata|1|0|}95|94|}
{2010212001|XXGvertex_oport_oport|148|0|243|0|{1|error|}94|96|}
{2010006001|XXGobject_psameas_object|149|0|245|0|{metadata|error_metadata|1|0|}96|94|}
{2010212001|XXGvertex_oport_oport|150|0|246|0|{2|log|}94|97|}
{2010006001|XXGobject_psameas_object|151|0|248|0|{metadata|log_metadata|1|0|}97|94|}
{2010006001|XXGobject_psameas_object|152|0|249|0|{Layout|Layout|0|0|}90|98|}
{2010211001|XXGvertex_iport_iport|153|0|251|0|{0|write|}98|99|}
{2010214001|XXGiport_src_flow|154|0|253|0|{0|}99|89|}
{2010007001|XXGobject_proto_object|155|0|254|0|{}98|100|}
{2010211001|XXGvertex_iport_iport|156|0|256|0|{0|write|}100|101|}
{2010006001|XXGobject_psameas_object|157|0|258|0|{metadata|write_metadata|1|0|}101|100|}
{2010006001|XXGobject_psameas_object|158|0|259|0|{write_metadata|out_metadata|0|0|}98|102|}
{2010212001|XXGvertex_oport_oport|159|0|261|0|{0|out|}102|103|}
{2010213001|XXGoport_dst_flow|160|0|263|0|{0|}103|87|}
{2010211001|XXGvertex_iport_iport|161|0|264|0|{0|in|}102|104|}
{2010214001|XXGiport_src_flow|162|0|266|0|{0|}104|86|}
{2010007001|XXGobject_proto_object|163|0|267|0|{}102|105|}
{2010212001|XXGvertex_oport_oport|164|0|269|0|{0|out|}105|106|}
{2010006001|XXGobject_psameas_object|165|0|271|0|{metadata|out_metadata|1|0|}106|105|}
{2010211001|XXGvertex_iport_iport|166|0|272|0|{0|in|}105|107|}
{2010006001|XXGobject_psameas_object|167|0|274|0|{metadata|in_metadata|1|0|}107|105|}
{2010006001|XXGobject_psameas_object|168|0|275|0|{Layout|Layout|0|0|}102|98|}
{2010006001|XXGobject_psameas_object|169|0|276|0|{in_metadata|out0_metadata|0|0|}102|56|}
{2010006001|XXGobject_psameas_object|170|0|277|0|{quote_encoded_by_repeat|FILE_QUOTE_FLAG|1|0|}102|85|}
{2010006001|XXGobject_psameas_object|171|0|278|0|{out_metadata|out_metadata|0|0|}90|102|}
{2010601001|XXGgraph_vertex_vertex|172|0|279|0|{CONC_1|}85|108|}
{2010212001|XXGvertex_oport_oport|173|0|281|0|{0|out|}108|109|}
{2010213001|XXGoport_dst_flow|174|0|283|0|{0|}109|89|}
{2010211001|XXGvertex_iport_iport|175|0|284|0|{0|in|}108|110|}
{2010214001|XXGiport_src_flow|176|0|286|0|{0|}110|88|}
{2010214001|XXGiport_src_flow|177|0|287|0|{1|}110|87|}
{2010007001|XXGobject_proto_object|178|0|288|0|{}108|111|}
{2010212001|XXGvertex_oport_oport|179|0|290|0|{0|out|}111|112|}
{2010006001|XXGobject_psameas_object|180|0|292|0|{metadata|out_metadata|1|0|}112|111|}
{2010211001|XXGvertex_iport_iport|181|0|293|0|{0|in|}111|113|}
{2010006001|XXGobject_psameas_object|182|0|295|0|{metadata|in_metadata|1|0|}113|111|}
{2010006001|XXGobject_psameas_object|183|0|296|0|{Layout|Layout|0|0|}108|98|}
{2010006001|XXGobject_psameas_object|184|0|297|0|{in_metadata|out_metadata|0|0|}108|102|}
{2010006001|XXGobject_psameas_object|185|0|298|0|{out_metadata|out_metadata|0|0|}108|102|}
{2010601001|XXGgraph_vertex_vertex|186|0|299|0|{OFIL_Target_CSV_File|}85|98|}
{2010601001|XXGgraph_vertex_vertex|187|0|300|0|{RPLC_1|}85|114|}
{2010212001|XXGvertex_oport_oport|188|0|302|0|{0|out|}114|115|}
{2010213001|XXGoport_dst_flow|189|0|304|0|{0|}115|86|}
{2010211001|XXGvertex_iport_iport|190|0|305|0|{0|in|}114|116|}
{2010007001|XXGobject_proto_object|191|0|307|0|{}114|117|}
{2010212001|XXGvertex_oport_oport|192|0|309|0|{0|out|}117|118|}
{2010006001|XXGobject_psameas_object|193|0|311|0|{metadata|out_metadata|1|0|}118|117|}
{2010211001|XXGvertex_iport_iport|194|0|312|0|{0|in|}117|119|}
{2010006001|XXGobject_psameas_object|195|0|314|0|{metadata|in_metadata|1|0|}119|117|}
{2010006001|XXGobject_psameas_object|196|0|315|0|{Layout|Layout|0|0|}114|98|}
{2010006001|XXGobject_psameas_object|197|0|316|0|{in_metadata|out0_metadata|0|0|}114|56|}
{2010006001|XXGobject_psameas_object|198|0|317|0|{out_metadata|out0_metadata|0|0|}114|56|}
{2010601001|XXGgraph_vertex_vertex|199|0|318|0|{WSV_Convert_to_CSV|}85|102|}
{2010211001|XXGvertex_iport_iport|200|0|319|0|{0|in0|}85|120|}
{2010215002|XXGiport_binding_iport|201|0|321|0|{.5|.5|{0|}14148|}120|116|}
{2010214001|XXGiport_src_flow|202|0|322|0|{0|}120|17|}
{2010006001|XXGobject_psameas_object|203|0|323|0|{FILE_QUOTE_FLAG|FILE_QUOTE_FLAG|1|0|}85|1|}
{2010601001|XXGgraph_vertex_vertex|204|0|324|0|{Create_a_serial_Multi_file|}1|121|}
{2010601001|XXGgraph_vertex_vertex|205|0|326|0|{OFIL_Compressed_Target|}121|122|}
{2010211001|XXGvertex_iport_iport|206|0|328|0|{0|write|}122|123|}
{2010007001|XXGobject_proto_object|207|0|330|0|{}122|124|}
{2010211001|XXGvertex_iport_iport|208|0|332|0|{0|write|}124|125|}
{2010006001|XXGobject_psameas_object|209|0|334|0|{metadata|write_metadata|1|0|}125|124|}
{2010006001|XXGobject_psameas_object|210|0|335|0|{write_metadata|out_metadata|0|0|}122|126|}
{2010212001|XXGvertex_oport_oport|211|0|337|0|{0|out|}126|127|}
{2010213001|XXGoport_dst_flow|212|0|339|0|{0|}127|128|}
{2010211001|XXGvertex_iport_iport|213|0|341|0|{0|in|}126|129|}
{2010214001|XXGiport_src_flow|214|0|343|0|{0|}129|130|}
{2010007001|XXGobject_proto_object|215|0|345|0|{}126|131|}
{2010212001|XXGvertex_oport_oport|216|0|347|0|{0|out|}131|132|}
{2010006001|XXGobject_psameas_object|217|0|349|0|{metadata|out_metadata|1|0|}132|131|}
{2010211001|XXGvertex_iport_iport|218|0|350|0|{0|in|}131|133|}
{2010006001|XXGobject_psameas_object|219|0|352|0|{metadata|in_metadata|1|0|}133|131|}
{2010006001|XXGobject_psameas_object|220|0|353|0|{Layout|Layout|0|0|}126|134|}
{2010212001|XXGvertex_oport_oport|221|0|355|0|{0|out|}134|135|}
{2010213001|XXGoport_dst_flow|222|0|357|0|{0|}135|15|}
{2010213001|XXGoport_dst_flow|223|0|358|0|{1|}135|19|}
{2010211001|XXGvertex_iport_iport|224|0|359|0|{0|in|}134|136|}
{2010214001|XXGiport_src_flow|225|0|361|0|{0|}136|21|}
{2010007001|XXGobject_proto_object|226|0|362|0|{}134|137|}
{2010212001|XXGvertex_oport_oport|227|0|364|0|{0|out|}137|138|}
{2010006001|XXGobject_psameas_object|228|0|366|0|{metadata|out_metadata|1|0|}138|137|}
{2010211001|XXGvertex_iport_iport|229|0|367|0|{0|in|}137|139|}
{2010006001|XXGobject_psameas_object|230|0|369|0|{metadata|in_metadata|1|0|}139|137|}
{2010006001|XXGobject_psameas_object|231|0|370|0|{in_metadata|out_metadata|0|0|}134|126|}
{2010006001|XXGobject_psameas_object|232|0|371|0|{out_metadata|out_metadata|0|0|}134|126|}
{2010006001|XXGobject_psameas_object|233|0|372|0|{in_metadata|out0_metadata|0|0|}126|56|}
{2010601001|XXGgraph_vertex_vertex|234|0|373|0|{OFIL_Uncompressed_Target|}121|140|}
{2010211001|XXGvertex_iport_iport|235|0|375|0|{0|write|}140|141|}
{2010007001|XXGobject_proto_object|236|0|377|0|{}140|142|}
{2010211001|XXGvertex_iport_iport|237|0|379|0|{0|write|}142|143|}
{2010006001|XXGobject_psameas_object|238|0|381|0|{metadata|write_metadata|1|0|}143|142|}
{2010006001|XXGobject_psameas_object|239|0|382|0|{write_metadata|out_metadata|0|0|}140|126|}
{2010211001|XXGvertex_iport_iport|240|0|383|0|{0|in0|}121|144|}
{2010215002|XXGiport_binding_iport|241|0|385|0|{.5|.5|{0|}14089|}144|123|}
{2010214001|XXGiport_src_flow|242|0|386|0|{0|}144|19|}
{2010211001|XXGvertex_iport_iport|243|0|387|0|{1|in1|}121|145|}
{2010215002|XXGiport_binding_iport|244|0|389|0|{.5|.5|{0|}14090|}145|141|}
{2010214001|XXGiport_src_flow|245|0|390|0|{0|}145|15|}
{2010601001|XXGgraph_vertex_vertex|246|0|391|0|{Data_Suppression_Outbound|}1|146|}
{2010401001|XXGvertex_prototype_vertex|247|0|393|0|{}146|147|}
{2010212001|XXGvertex_oport_oport|248|0|395|0|{0|out0|}147|148|}
{2010006001|XXGobject_psameas_object|249|0|397|0|{metadata|out0_metadata|1|0|}148|147|}
{2010212001|XXGvertex_oport_oport|250|0|398|0|{1|deselect|}147|149|}
{2010006001|XXGobject_psameas_object|251|0|400|0|{metadata|deselect_metadata|1|0|}149|147|}
{2010211001|XXGvertex_iport_iport|252|0|401|0|{0|in0|}147|150|}
{2010006001|XXGobject_psameas_object|253|0|403|0|{metadata|in0_metadata|1|0|}150|147|}
{2010212001|XXGvertex_oport_oport|254|0|404|0|{0|out0|}146|151|}
{2010213001|XXGoport_dst_flow|255|0|406|0|{0|}151|16|}
{2010212001|XXGvertex_oport_oport|256|0|407|0|{1|deselect|}146|152|}
{2010211001|XXGvertex_iport_iport|257|0|409|0|{0|in0|}146|153|}
{2010214001|XXGiport_src_flow|258|0|411|0|{0|}153|14|}
{2010006001|XXGobject_psameas_object|259|0|412|0|{Layout|Layout|0|0|}146|68|}
{2010006001|XXGobject_psameas_object|260|0|413|0|{deselect_metadata|out0_metadata|0|0|}146|56|}
{2010006001|XXGobject_psameas_object|261|0|414|0|{in0_metadata|out0_metadata|0|0|}146|56|}
{2010006001|XXGobject_psameas_object|262|0|415|0|{out0_metadata|out0_metadata|0|0|}146|56|}
{2010601001|XXGgraph_vertex_vertex|263|0|416|0|{Header_and_Trailer|}1|154|}
{2010605001|XXGgraph_legend_legend|264|0|418|0|{0|}154|155|}
{2010241001|XXGlegend_face_face|265|0|420|0|{}155|156|}
{2010605001|XXGgraph_legend_legend|266|0|422|0|{1|}154|157|}
{2010241001|XXGlegend_face_face|267|0|424|0|{}157|158|}
{2010605001|XXGgraph_legend_legend|268|0|426|0|{2|}154|159|}
{2010241001|XXGlegend_face_face|269|0|428|0|{}159|160|}
{2010604001|XXGgraph_flow_flow|270|0|430|0|{Flow_1|}154|161|}
{2010604001|XXGgraph_flow_flow|271|0|432|0|{Flow_10|}154|162|}
{2010604001|XXGgraph_flow_flow|272|0|434|0|{Flow_11|}154|163|}
{2010604001|XXGgraph_flow_flow|273|0|436|0|{Flow_12|}154|164|}
{2010604001|XXGgraph_flow_flow|274|0|438|0|{Flow_2|}154|165|}
{2010604001|XXGgraph_flow_flow|275|0|440|0|{Flow_3|}154|130|}
{2010604001|XXGgraph_flow_flow|276|0|441|0|{Flow_8|}154|128|}
{2010604001|XXGgraph_flow_flow|277|0|442|0|{Flow_9|}154|166|}
{2010601001|XXGgraph_vertex_vertex|278|0|444|0|{Concatenate|}154|167|}
{2010212001|XXGvertex_oport_oport|279|0|446|0|{0|out|}167|168|}
{2010211001|XXGvertex_iport_iport|280|0|448|0|{0|in|}167|169|}
{2010214001|XXGiport_src_flow|281|0|450|0|{0|}169|164|}
{2010214001|XXGiport_src_flow|282|0|451|0|{1|}169|128|}
{2010214001|XXGiport_src_flow|283|0|452|0|{2|}169|163|}
{2010007001|XXGobject_proto_object|284|0|453|0|{}167|170|}
{2010212001|XXGvertex_oport_oport|285|0|455|0|{0|out|}170|171|}
{2010006001|XXGobject_psameas_object|286|0|457|0|{metadata|out_metadata|1|0|}171|170|}
{2010211001|XXGvertex_iport_iport|287|0|458|0|{0|in|}170|172|}
{2010006001|XXGobject_psameas_object|288|0|460|0|{metadata|in_metadata|1|0|}172|170|}
{2010006001|XXGobject_psameas_object|289|0|461|0|{Layout|Layout|0|0|}167|134|}
{2010006001|XXGobject_psameas_object|290|0|462|0|{in_metadata|out_metadata|0|0|}167|126|}
{2010006001|XXGobject_psameas_object|291|0|463|0|{out_metadata|out_metadata|0|0|}167|126|}
{2010601001|XXGgraph_vertex_vertex|292|0|464|0|{Create_Header|}154|173|}
{2010212001|XXGvertex_oport_oport|293|0|466|0|{0|out|}173|174|}
{2010213001|XXGoport_dst_flow|294|0|468|0|{0|}174|161|}
{2010212001|XXGvertex_oport_oport|295|0|469|0|{1|reject|}173|175|}
{2010212001|XXGvertex_oport_oport|296|0|471|0|{2|error|}173|176|}
{2010212001|XXGvertex_oport_oport|297|0|473|0|{3|log|}173|177|}
{2010211001|XXGvertex_iport_iport|298|0|475|0|{0|in|}173|178|}
{2010214001|XXGiport_src_flow|299|0|477|0|{0|}178|162|}
{2010007001|XXGobject_proto_object|300|0|478|0|{}173|179|}
{2010212001|XXGvertex_oport_oport|301|0|480|0|{0|out|}179|180|}
{2010006001|XXGobject_psameas_object|302|0|482|0|{metadata|out_metadata|1|0|}180|179|}
{2010212001|XXGvertex_oport_oport|303|0|483|0|{1|reject|}179|181|}
{2010006001|XXGobject_psameas_object|304|0|485|0|{metadata|reject_metadata|1|0|}181|179|}
{2010212001|XXGvertex_oport_oport|305|0|486|0|{2|error|}179|182|}
{2010006001|XXGobject_psameas_object|306|0|488|0|{metadata|error_metadata|1|0|}182|179|}
{2010212001|XXGvertex_oport_oport|307|0|489|0|{3|log|}179|183|}
{2010006001|XXGobject_psameas_object|308|0|491|0|{metadata|log_metadata|1|0|}183|179|}
{2010211001|XXGvertex_iport_iport|309|0|492|0|{0|in|}179|184|}
{2010006001|XXGobject_psameas_object|310|0|494|0|{metadata|in_metadata|1|0|}184|179|}
{2010006001|XXGobject_psameas_object|311|0|495|0|{Layout|Layout|0|0|}173|134|}
{2010006001|XXGobject_psameas_object|312|0|496|0|{in_metadata|out0_metadata|0|0|}173|56|}
{2010006001|XXGobject_psameas_object|313|0|497|0|{output_without_input|Create_Header_output_without_input|1|0|}173|154|}
{2010006001|XXGobject_psameas_object|314|0|498|0|{reject_metadata|out0_metadata|0|0|}173|56|}
{2010601001|XXGgraph_vertex_vertex|315|0|499|0|{Create_Trailer|}154|185|}
{2010212001|XXGvertex_oport_oport|316|0|501|0|{0|out|}185|186|}
{2010213001|XXGoport_dst_flow|317|0|503|0|{0|}186|165|}
{2010212001|XXGvertex_oport_oport|318|0|504|0|{1|reject|}185|187|}
{2010212001|XXGvertex_oport_oport|319|0|506|0|{2|error|}185|188|}
{2010212001|XXGvertex_oport_oport|320|0|508|0|{3|log|}185|189|}
{2010211001|XXGvertex_iport_iport|321|0|510|0|{0|in|}185|190|}
{2010214001|XXGiport_src_flow|322|0|512|0|{0|}190|166|}
{2010007001|XXGobject_proto_object|323|0|513|0|{}185|191|}
{2010212001|XXGvertex_oport_oport|324|0|515|0|{0|out|}191|192|}
{2010006001|XXGobject_psameas_object|325|0|517|0|{metadata|out_metadata|1|0|}192|191|}
{2010212001|XXGvertex_oport_oport|326|0|518|0|{1|reject|}191|193|}
{2010006001|XXGobject_psameas_object|327|0|520|0|{metadata|reject_metadata|1|0|}193|191|}
{2010212001|XXGvertex_oport_oport|328|0|521|0|{2|error|}191|194|}
{2010006001|XXGobject_psameas_object|329|0|523|0|{metadata|error_metadata|1|0|}194|191|}
{2010212001|XXGvertex_oport_oport|330|0|524|0|{3|log|}191|195|}
{2010006001|XXGobject_psameas_object|331|0|526|0|{metadata|log_metadata|1|0|}195|191|}
{2010211001|XXGvertex_iport_iport|332|0|527|0|{0|in|}191|196|}
{2010006001|XXGobject_psameas_object|333|0|529|0|{metadata|in_metadata|1|0|}196|191|}
{2010006001|XXGobject_psameas_object|334|0|530|0|{Layout|Layout|0|0|}185|134|}
{2010006001|XXGobject_psameas_object|335|0|531|0|{in_metadata|out0_metadata|0|0|}185|56|}
{2010006001|XXGobject_psameas_object|336|0|532|0|{output_without_input|Create_Trailer_output_without_input|1|0|}185|154|}
{2010006001|XXGobject_psameas_object|337|0|533|0|{reject_metadata|out0_metadata|0|0|}185|56|}
{2010601001|XXGgraph_vertex_vertex|338|0|534|0|{Redefine_Format_Data|}154|126|}
{2010601001|XXGgraph_vertex_vertex|339|0|535|0|{Redefine_Format_Header|}154|197|}
{2010212001|XXGvertex_oport_oport|340|0|537|0|{0|out|}197|198|}
{2010213001|XXGoport_dst_flow|341|0|539|0|{0|}198|164|}
{2010211001|XXGvertex_iport_iport|342|0|540|0|{0|in|}197|199|}
{2010214001|XXGiport_src_flow|343|0|542|0|{0|}199|161|}
{2010007001|XXGobject_proto_object|344|0|543|0|{}197|200|}
{2010212001|XXGvertex_oport_oport|345|0|545|0|{0|out|}200|201|}
{2010006001|XXGobject_psameas_object|346|0|547|0|{metadata|out_metadata|1|0|}201|200|}
{2010211001|XXGvertex_iport_iport|347|0|548|0|{0|in|}200|202|}
{2010006001|XXGobject_psameas_object|348|0|550|0|{metadata|in_metadata|1|0|}202|200|}
{2010006001|XXGobject_psameas_object|349|0|551|0|{Layout|Layout|0|0|}197|134|}
{2010006001|XXGobject_psameas_object|350|0|552|0|{in_metadata|out_metadata|0|0|}197|173|}
{2010006001|XXGobject_psameas_object|351|0|553|0|{out_metadata|out_metadata|0|0|}197|126|}
{2010601001|XXGgraph_vertex_vertex|352|0|554|0|{Redefine_Format_Trailer|}154|203|}
{2010212001|XXGvertex_oport_oport|353|0|556|0|{0|out|}203|204|}
{2010213001|XXGoport_dst_flow|354|0|558|0|{0|}204|163|}
{2010211001|XXGvertex_iport_iport|355|0|559|0|{0|in|}203|205|}
{2010214001|XXGiport_src_flow|356|0|561|0|{0|}205|165|}
{2010007001|XXGobject_proto_object|357|0|562|0|{}203|206|}
{2010212001|XXGvertex_oport_oport|358|0|564|0|{0|out|}206|207|}
{2010006001|XXGobject_psameas_object|359|0|566|0|{metadata|out_metadata|1|0|}207|206|}
{2010211001|XXGvertex_iport_iport|360|0|567|0|{0|in|}206|208|}
{2010006001|XXGobject_psameas_object|361|0|569|0|{metadata|in_metadata|1|0|}208|206|}
{2010006001|XXGobject_psameas_object|362|0|570|0|{Layout|Layout|0|0|}203|134|}
{2010006001|XXGobject_psameas_object|363|0|571|0|{in_metadata|out_metadata|0|0|}203|185|}
{2010006001|XXGobject_psameas_object|364|0|572|0|{out_metadata|out_metadata|0|0|}203|126|}
{2010601001|XXGgraph_vertex_vertex|365|0|573|0|{Replicate|}154|209|}
{2010212001|XXGvertex_oport_oport|366|0|575|0|{0|out|}209|210|}
{2010213001|XXGoport_dst_flow|367|0|577|0|{0|}210|162|}
{2010213001|XXGoport_dst_flow|368|0|578|0|{1|}210|130|}
{2010213001|XXGoport_dst_flow|369|0|579|0|{2|}210|166|}
{2010211001|XXGvertex_iport_iport|370|0|580|0|{0|in|}209|211|}
{2010007001|XXGobject_proto_object|371|0|582|0|{}209|212|}
{2010212001|XXGvertex_oport_oport|372|0|584|0|{0|out|}212|213|}
{2010006001|XXGobject_psameas_object|373|0|586|0|{metadata|out_metadata|1|0|}213|212|}
{2010211001|XXGvertex_iport_iport|374|0|587|0|{0|in|}212|214|}
{2010006001|XXGobject_psameas_object|375|0|589|0|{metadata|in_metadata|1|0|}214|212|}
{2010006001|XXGobject_psameas_object|376|0|590|0|{Layout|Layout|0|0|}209|134|}
{2010006001|XXGobject_psameas_object|377|0|591|0|{in_metadata|out0_metadata|0|0|}209|56|}
{2010006001|XXGobject_psameas_object|378|0|592|0|{out_metadata|out0_metadata|0|0|}209|56|}
{2010212001|XXGvertex_oport_oport|379|0|593|0|{0|out0|}154|215|}
{2010216002|XXGoport_binding_oport|380|0|595|0|{.5|.5|{0|}14264|}215|168|}
{2010213001|XXGoport_dst_flow|381|0|596|0|{0|}215|21|}
{2010211001|XXGvertex_iport_iport|382|0|597|0|{0|in0|}154|216|}
{2010215002|XXGiport_binding_iport|383|0|599|0|{.5|.5|{0|}14263|}216|211|}
{2010214001|XXGiport_src_flow|384|0|600|0|{0|}216|22|}
{2010006001|XXGobject_psameas_object|385|0|601|0|{Create_Header_output_without_input|CREATE_HEADER_OUTPUT_WITHOUT_INPUT|1|0|}154|1|}
{2010006001|XXGobject_psameas_object|386|0|602|0|{Create_Trailer_output_without_input|CREATE_TRAILER_OUTPUT_WITHOUT_INPUT|1|0|}154|1|}
{2010601001|XXGgraph_vertex_vertex|387|0|603|0|{IFIL_Load_Ready_File|}1|68|}
{2010601001|XXGgraph_vertex_vertex|388|0|604|0|{Partition_And_Or_Sort|}1|217|}
{2010604001|XXGgraph_flow_flow|389|0|606|0|{Flow_1|}217|218|}
{2010604001|XXGgraph_flow_flow|390|0|608|0|{Flow_14|}217|219|}
{2010604001|XXGgraph_flow_flow|391|0|610|0|{Flow_15|}217|220|}
{2010604001|XXGgraph_flow_flow|392|0|612|0|{Flow_16|}217|221|}
{2010604001|XXGgraph_flow_flow|393|0|614|0|{Flow_17|}217|222|}
{2010604001|XXGgraph_flow_flow|394|0|616|0|{Flow_18|}217|223|}
{2010604001|XXGgraph_flow_flow|395|0|618|0|{Flow_19|}217|224|}
{2010604001|XXGgraph_flow_flow|396|0|620|0|{Flow_2|}217|225|}
{2010604001|XXGgraph_flow_flow|397|0|622|0|{Flow_6|}217|226|}
{2010604001|XXGgraph_flow_flow|398|0|624|0|{Flow_7|}217|227|}
{2010601001|XXGgraph_vertex_vertex|399|0|626|0|{Gather|}217|228|}
{2010212001|XXGvertex_oport_oport|400|0|628|0|{0|out|}228|229|}
{2010213001|XXGoport_dst_flow|401|0|630|0|{0|}229|225|}
{2010211001|XXGvertex_iport_iport|402|0|631|0|{0|in|}228|230|}
{2010214001|XXGiport_src_flow|403|0|633|0|{0|}230|218|}
{2010006001|XXGobject_psameas_object|404|0|634|0|{Layout|Layout|0|0|}228|231|}
{2010212001|XXGvertex_oport_oport|405|0|636|0|{0|out|}231|232|}
{2010213001|XXGoport_dst_flow|406|0|638|0|{0|}232|17|}
{2010213001|XXGoport_dst_flow|407|0|639|0|{1|}232|12|}
{2010213001|XXGoport_dst_flow|408|0|640|0|{2|}232|22|}
{2010213001|XXGoport_dst_flow|409|0|641|0|{3|}232|13|}
{2010211001|XXGvertex_iport_iport|410|0|642|0|{0|in|}231|233|}
{2010214001|XXGiport_src_flow|411|0|644|0|{0|}233|20|}
{2010007001|XXGobject_proto_object|412|0|645|0|{}231|234|}
{2010212001|XXGvertex_oport_oport|413|0|647|0|{0|out|}234|235|}
{2010006001|XXGobject_psameas_object|414|0|649|0|{metadata|out_metadata|1|0|}235|234|}
{2010211001|XXGvertex_iport_iport|415|0|650|0|{0|in|}234|236|}
{2010006001|XXGobject_psameas_object|416|0|652|0|{metadata|in_metadata|1|0|}236|234|}
{2010006001|XXGobject_psameas_object|417|0|653|0|{in_metadata|out0_metadata|0|0|}231|56|}
{2010006001|XXGobject_psameas_object|418|0|654|0|{out_metadata|out0_metadata|0|0|}231|56|}
{2010006001|XXGobject_psameas_object|419|0|655|0|{in_metadata|out0_metadata|0|0|}228|56|}
{2010006001|XXGobject_psameas_object|420|0|656|0|{out_metadata|out0_metadata|0|0|}228|56|}
{2010601001|XXGgraph_vertex_vertex|421|0|657|0|{PBK_PBK_KEY_|}217|237|}
{2010212001|XXGvertex_oport_oport|422|0|659|0|{0|out|}237|238|}
{2010213001|XXGoport_dst_flow|423|0|661|0|{0|}238|227|}
{2010211001|XXGvertex_iport_iport|424|0|662|0|{0|in|}237|239|}
{2010214001|XXGiport_src_flow|425|0|664|0|{0|}239|226|}
{2010006001|XXGobject_psameas_object|426|0|665|0|{in_metadata|out0_metadata|0|0|}237|56|}
{2010006001|XXGobject_psameas_object|427|0|666|0|{out_metadata|out0_metadata|0|0|}237|56|}
{2010601001|XXGgraph_vertex_vertex|428|0|667|0|{PBRR|}217|240|}
{2010212001|XXGvertex_oport_oport|429|0|669|0|{0|out|}240|241|}
{2010213001|XXGoport_dst_flow|430|0|671|0|{0|}241|222|}
{2010211001|XXGvertex_iport_iport|431|0|672|0|{0|in|}240|242|}
{2010214001|XXGiport_src_flow|432|0|674|0|{0|}242|220|}
{2010006001|XXGobject_psameas_object|433|0|675|0|{in_metadata|out0_metadata|0|0|}240|56|}
{2010006001|XXGobject_psameas_object|434|0|676|0|{out_metadata|out0_metadata|0|0|}240|56|}
{2010601001|XXGgraph_vertex_vertex|435|0|677|0|{Rplct|}217|243|}
{2010212001|XXGvertex_oport_oport|436|0|679|0|{0|out|}243|244|}
{2010213001|XXGoport_dst_flow|437|0|681|0|{0|}244|219|}
{2010211001|XXGvertex_iport_iport|438|0|682|0|{0|in|}243|245|}
{2010214001|XXGiport_src_flow|439|0|684|0|{0|}245|227|}
{2010006001|XXGobject_psameas_object|440|0|685|0|{in_metadata|out0_metadata|0|0|}243|56|}
{2010006001|XXGobject_psameas_object|441|0|686|0|{out_metadata|out0_metadata|0|0|}243|56|}
{2010601001|XXGgraph_vertex_vertex|442|0|687|0|{Rplct_Input_Layout|}217|246|}
{2010212001|XXGvertex_oport_oport|443|0|689|0|{0|out|}246|247|}
{2010213001|XXGoport_dst_flow|444|0|691|0|{0|}247|226|}
{2010213001|XXGoport_dst_flow|445|0|692|0|{1|}247|220|}
{2010213001|XXGoport_dst_flow|446|0|693|0|{2|}247|221|}
{2010213001|XXGoport_dst_flow|447|0|694|0|{3|}247|218|}
{2010211001|XXGvertex_iport_iport|448|0|695|0|{0|in|}246|248|}
{2010006001|XXGobject_psameas_object|449|0|697|0|{Layout|Layout|0|0|}246|146|}
{2010006001|XXGobject_psameas_object|450|0|698|0|{in_metadata|out0_metadata|0|0|}246|56|}
{2010006001|XXGobject_psameas_object|451|0|699|0|{out_metadata|out0_metadata|0|0|}246|56|}
{2010601001|XXGgraph_vertex_vertex|452|0|700|0|{Rplct_No_Prttn_No_Srt|}217|249|}
{2010212001|XXGvertex_oport_oport|453|0|702|0|{0|out|}249|250|}
{2010213001|XXGoport_dst_flow|454|0|704|0|{0|}250|223|}
{2010211001|XXGvertex_iport_iport|455|0|705|0|{0|in|}249|251|}
{2010214001|XXGiport_src_flow|456|0|707|0|{0|}251|221|}
{2010006001|XXGobject_psameas_object|457|0|708|0|{in_metadata|out0_metadata|0|0|}249|56|}
{2010006001|XXGobject_psameas_object|458|0|709|0|{out_metadata|out0_metadata|0|0|}249|56|}
{2010601001|XXGgraph_vertex_vertex|459|0|710|0|{Rplct_Ouput_Layout|}217|252|}
{2010212001|XXGvertex_oport_oport|460|0|712|0|{0|out|}252|253|}
{2010211001|XXGvertex_iport_iport|461|0|714|0|{0|in|}252|254|}
{2010214001|XXGiport_src_flow|462|0|716|0|{0|}254|224|}
{2010214001|XXGiport_src_flow|463|0|717|0|{1|}254|222|}
{2010214001|XXGiport_src_flow|464|0|718|0|{2|}254|223|}
{2010214001|XXGiport_src_flow|465|0|719|0|{3|}254|225|}
{2010006001|XXGobject_psameas_object|466|0|720|0|{Layout|Layout|0|0|}252|231|}
{2010006001|XXGobject_psameas_object|467|0|721|0|{in_metadata|out0_metadata|0|0|}252|56|}
{2010006001|XXGobject_psameas_object|468|0|722|0|{out_metadata|out0_metadata|0|0|}252|56|}
{2010601001|XXGgraph_vertex_vertex|469|0|723|0|{Srt_SRT_KEY_|}217|255|}
{2010212001|XXGvertex_oport_oport|470|0|725|0|{0|out|}255|256|}
{2010213001|XXGoport_dst_flow|471|0|727|0|{0|}256|224|}
{2010211001|XXGvertex_iport_iport|472|0|728|0|{0|in|}255|257|}
{2010214001|XXGiport_src_flow|473|0|730|0|{0|}257|219|}
{2010006001|XXGobject_psameas_object|474|0|731|0|{Layout|Layout|0|0|}255|231|}
{2010006001|XXGobject_psameas_object|475|0|732|0|{in_metadata|out0_metadata|0|0|}255|56|}
{2010006001|XXGobject_psameas_object|476|0|733|0|{out_metadata|out0_metadata|0|0|}255|56|}
{2010212001|XXGvertex_oport_oport|477|0|734|0|{0|out0|}217|258|}
{2010216002|XXGoport_binding_oport|478|0|736|0|{.5|.5|{0|}12459|}258|253|}
{2010213001|XXGoport_dst_flow|479|0|737|0|{0|}258|20|}
{2010211001|XXGvertex_iport_iport|480|0|738|0|{0|in0|}217|259|}
{2010215002|XXGiport_binding_iport|481|0|740|0|{.5|.5|{0|}12458|}259|248|}
{2010214001|XXGiport_src_flow|482|0|741|0|{0|}259|16|}
{2010007001|XXGobject_proto_object|483|0|742|0|{}217|260|}
{2010604001|XXGgraph_flow_flow|484|0|744|0|{Flow_1|}260|261|}
{2010604001|XXGgraph_flow_flow|485|0|746|0|{Flow_14|}260|262|}
{2010604001|XXGgraph_flow_flow|486|0|748|0|{Flow_15|}260|263|}
{2010604001|XXGgraph_flow_flow|487|0|750|0|{Flow_16|}260|264|}
{2010604001|XXGgraph_flow_flow|488|0|752|0|{Flow_17|}260|265|}
{2010604001|XXGgraph_flow_flow|489|0|754|0|{Flow_18|}260|266|}
{2010604001|XXGgraph_flow_flow|490|0|756|0|{Flow_19|}260|267|}
{2010604001|XXGgraph_flow_flow|491|0|758|0|{Flow_2|}260|268|}
{2010604001|XXGgraph_flow_flow|492|0|760|0|{Flow_6|}260|269|}
{2010604001|XXGgraph_flow_flow|493|0|762|0|{Flow_7|}260|270|}
{2010601001|XXGgraph_vertex_vertex|494|0|764|0|{Gather|}260|271|}
{2010212001|XXGvertex_oport_oport|495|0|766|0|{0|out|}271|272|}
{2010213001|XXGoport_dst_flow|496|0|768|0|{0|}272|268|}
{2010211001|XXGvertex_iport_iport|497|0|769|0|{0|in|}271|273|}
{2010214001|XXGiport_src_flow|498|0|771|0|{0|}273|261|}
{2010007001|XXGobject_proto_object|499|0|772|0|{}271|274|}
{2010212001|XXGvertex_oport_oport|500|0|774|0|{0|out|}274|275|}
{2010006001|XXGobject_psameas_object|501|0|776|0|{metadata|out_metadata|1|0|}275|274|}
{2010211001|XXGvertex_iport_iport|502|0|777|0|{0|in|}274|276|}
{2010006001|XXGobject_psameas_object|503|0|779|0|{metadata|in_metadata|1|0|}276|274|}
{2010601001|XXGgraph_vertex_vertex|504|0|780|0|{PBK_PBK_KEY_|}260|277|}
{2010212001|XXGvertex_oport_oport|505|0|782|0|{0|out|}277|278|}
{2010213001|XXGoport_dst_flow|506|0|784|0|{0|}278|270|}
{2010211001|XXGvertex_iport_iport|507|0|785|0|{0|in|}277|279|}
{2010214001|XXGiport_src_flow|508|0|787|0|{0|}279|269|}
{2010007001|XXGobject_proto_object|509|0|788|0|{}277|280|}
{2010212001|XXGvertex_oport_oport|510|0|790|0|{0|out|}280|281|}
{2010006001|XXGobject_psameas_object|511|0|792|0|{metadata|out_metadata|1|0|}281|280|}
{2010211001|XXGvertex_iport_iport|512|0|793|0|{0|in|}280|282|}
{2010006001|XXGobject_psameas_object|513|0|795|0|{metadata|in_metadata|1|0|}282|280|}
{2010006001|XXGobject_psameas_object|514|0|796|0|{Layout|Layout|0|0|}277|283|}
{2010212001|XXGvertex_oport_oport|515|0|798|0|{0|out|}283|284|}
{2010213001|XXGoport_dst_flow|516|0|800|0|{0|}284|269|}
{2010213001|XXGoport_dst_flow|517|0|801|0|{1|}284|263|}
{2010213001|XXGoport_dst_flow|518|0|802|0|{2|}284|264|}
{2010213001|XXGoport_dst_flow|519|0|803|0|{3|}284|261|}
{2010211001|XXGvertex_iport_iport|520|0|804|0|{0|in|}283|285|}
{2010007001|XXGobject_proto_object|521|0|806|0|{}283|286|}
{2010212001|XXGvertex_oport_oport|522|0|808|0|{0|out|}286|287|}
{2010006001|XXGobject_psameas_object|523|0|810|0|{metadata|out_metadata|1|0|}287|286|}
{2010211001|XXGvertex_iport_iport|524|0|811|0|{0|in|}286|288|}
{2010006001|XXGobject_psameas_object|525|0|813|0|{metadata|in_metadata|1|0|}288|286|}
{2010601001|XXGgraph_vertex_vertex|526|0|814|0|{PBRR|}260|289|}
{2010212001|XXGvertex_oport_oport|527|0|816|0|{0|out|}289|290|}
{2010213001|XXGoport_dst_flow|528|0|818|0|{0|}290|265|}
{2010211001|XXGvertex_iport_iport|529|0|819|0|{0|in|}289|291|}
{2010214001|XXGiport_src_flow|530|0|821|0|{0|}291|263|}
{2010007001|XXGobject_proto_object|531|0|822|0|{}289|292|}
{2010212001|XXGvertex_oport_oport|532|0|824|0|{0|out|}292|293|}
{2010006001|XXGobject_psameas_object|533|0|826|0|{metadata|out_metadata|1|0|}293|292|}
{2010211001|XXGvertex_iport_iport|534|0|827|0|{0|in|}292|294|}
{2010006001|XXGobject_psameas_object|535|0|829|0|{metadata|in_metadata|1|0|}294|292|}
{2010006001|XXGobject_psameas_object|536|0|830|0|{Layout|Layout|0|0|}289|283|}
{2010601001|XXGgraph_vertex_vertex|537|0|831|0|{Rplct|}260|295|}
{2010212001|XXGvertex_oport_oport|538|0|833|0|{0|out|}295|296|}
{2010213001|XXGoport_dst_flow|539|0|835|0|{0|}296|262|}
{2010211001|XXGvertex_iport_iport|540|0|836|0|{0|in|}295|297|}
{2010214001|XXGiport_src_flow|541|0|838|0|{0|}297|270|}
{2010007001|XXGobject_proto_object|542|0|839|0|{}295|298|}
{2010212001|XXGvertex_oport_oport|543|0|841|0|{0|out|}298|299|}
{2010006001|XXGobject_psameas_object|544|0|843|0|{metadata|out_metadata|1|0|}299|298|}
{2010211001|XXGvertex_iport_iport|545|0|844|0|{0|in|}298|300|}
{2010006001|XXGobject_psameas_object|546|0|846|0|{metadata|in_metadata|1|0|}300|298|}
{2010006001|XXGobject_psameas_object|547|0|847|0|{Layout|Layout|0|0|}295|301|}
{2010212001|XXGvertex_oport_oport|548|0|849|0|{0|out|}301|302|}
{2010211001|XXGvertex_iport_iport|549|0|851|0|{0|in|}301|303|}
{2010214001|XXGiport_src_flow|550|0|853|0|{0|}303|267|}
{2010214001|XXGiport_src_flow|551|0|854|0|{1|}303|265|}
{2010214001|XXGiport_src_flow|552|0|855|0|{2|}303|266|}
{2010214001|XXGiport_src_flow|553|0|856|0|{3|}303|268|}
{2010007001|XXGobject_proto_object|554|0|857|0|{}301|304|}
{2010212001|XXGvertex_oport_oport|555|0|859|0|{0|out|}304|305|}
{2010006001|XXGobject_psameas_object|556|0|861|0|{metadata|out_metadata|1|0|}305|304|}
{2010211001|XXGvertex_iport_iport|557|0|862|0|{0|in|}304|306|}
{2010006001|XXGobject_psameas_object|558|0|864|0|{metadata|in_metadata|1|0|}306|304|}
{2010601001|XXGgraph_vertex_vertex|559|0|865|0|{Rplct_Input_Layout|}260|283|}
{2010601001|XXGgraph_vertex_vertex|560|0|866|0|{Rplct_No_Prttn_No_Srt|}260|307|}
{2010212001|XXGvertex_oport_oport|561|0|868|0|{0|out|}307|308|}
{2010213001|XXGoport_dst_flow|562|0|870|0|{0|}308|266|}
{2010211001|XXGvertex_iport_iport|563|0|871|0|{0|in|}307|309|}
{2010214001|XXGiport_src_flow|564|0|873|0|{0|}309|264|}
{2010007001|XXGobject_proto_object|565|0|874|0|{}307|310|}
{2010212001|XXGvertex_oport_oport|566|0|876|0|{0|out|}310|311|}
{2010006001|XXGobject_psameas_object|567|0|878|0|{metadata|out_metadata|1|0|}311|310|}
{2010211001|XXGvertex_iport_iport|568|0|879|0|{0|in|}310|312|}
{2010006001|XXGobject_psameas_object|569|0|881|0|{metadata|in_metadata|1|0|}312|310|}
{2010006001|XXGobject_psameas_object|570|0|882|0|{Layout|Layout|0|0|}307|283|}
{2010601001|XXGgraph_vertex_vertex|571|0|883|0|{Rplct_Ouput_Layout|}260|301|}
{2010601001|XXGgraph_vertex_vertex|572|0|884|0|{Srt_SRT_KEY_|}260|313|}
{2010212001|XXGvertex_oport_oport|573|0|886|0|{0|out|}313|314|}
{2010213001|XXGoport_dst_flow|574|0|888|0|{0|}314|267|}
{2010211001|XXGvertex_iport_iport|575|0|889|0|{0|in|}313|315|}
{2010214001|XXGiport_src_flow|576|0|891|0|{0|}315|262|}
{2010007001|XXGobject_proto_object|577|0|892|0|{}313|316|}
{2010212001|XXGvertex_oport_oport|578|0|894|0|{0|out|}316|317|}
{2010006001|XXGobject_psameas_object|579|0|896|0|{metadata|out_metadata|1|0|}317|316|}
{2010211001|XXGvertex_iport_iport|580|0|897|0|{0|in|}316|318|}
{2010006001|XXGobject_psameas_object|581|0|899|0|{metadata|in_metadata|1|0|}318|316|}
{2010212001|XXGvertex_oport_oport|582|0|900|0|{0|out0|}260|319|}
{2010216002|XXGoport_binding_oport|583|0|902|0|{.5|.5|{0|}12421|}319|302|}
{2010211001|XXGvertex_iport_iport|584|0|903|0|{0|in0|}260|320|}
{2010215002|XXGiport_binding_iport|585|0|905|0|{.5|.5|{0|}12420|}320|285|}
{2010006001|XXGobject_psameas_object|586|0|906|0|{PARTITIONING_SCHEME|PARTITIONING_SCHEME|1|0|}217|1|}
{2010006001|XXGobject_psameas_object|587|0|907|0|{PBK_KEY|PARTITIONING_KEY|1|0|}217|1|}
{2010006001|XXGobject_psameas_object|588|0|908|0|{SRT_KEY|SORT_KEY|1|0|}217|1|}
{2010601001|XXGgraph_vertex_vertex|589|0|909|0|{RFMT_Drop_event_indicator_and_generate_final_log_output|}1|56|}
{2010601001|XXGgraph_vertex_vertex|590|0|910|0|{Replicate|}1|134|}
{2010601001|XXGgraph_vertex_vertex|591|0|911|0|{Replicate_1|}1|231|}
{2010601001|XXGgraph_vertex_vertex|592|0|912|0|{Update_Consumption_Log|}1|321|}
{2010604001|XXGgraph_flow_flow|593|0|914|0|{Flow_18|}321|322|}
{2010604001|XXGgraph_flow_flow|594|0|916|0|{Flow_22|}321|323|}
{2010601001|XXGgraph_vertex_vertex|595|0|918|0|{Consumption_Log|}321|324|}
{2010211001|XXGvertex_iport_iport|596|0|920|0|{0|write|}324|325|}
{2010214001|XXGiport_src_flow|597|0|922|0|{0|}325|322|}
{2010007001|XXGobject_proto_object|598|0|923|0|{}324|326|}
{2010211001|XXGvertex_iport_iport|599|0|925|0|{0|write|}326|327|}
{2010006001|XXGobject_psameas_object|600|0|927|0|{metadata|write_metadata|1|0|}327|326|}
{2010601001|XXGgraph_vertex_vertex|601|0|928|0|{Interim_Events_Log|}321|328|}
{2010212001|XXGvertex_oport_oport|602|0|930|0|{0|read|}328|329|}
{2010213001|XXGoport_dst_flow|603|0|932|0|{0|}329|323|}
{2010007001|XXGobject_proto_object|604|0|933|0|{}328|330|}
{2010212001|XXGvertex_oport_oport|605|0|935|0|{0|read|}330|331|}
{2010006001|XXGobject_psameas_object|606|0|937|0|{metadata|read_metadata|1|0|}331|330|}
{2010601001|XXGgraph_vertex_vertex|607|0|938|0|{Updating_Consumption_Entry|}321|332|}
{2010212001|XXGvertex_oport_oport|608|0|940|0|{0|out|}332|333|}
{2010213001|XXGoport_dst_flow|609|0|942|0|{0|}333|322|}
{2010211001|XXGvertex_iport_iport|610|0|943|0|{0|in|}332|334|}
{2010214001|XXGiport_src_flow|611|0|945|0|{0|}334|323|}
{2010007001|XXGobject_proto_object|612|0|946|0|{}332|335|}
{2010212001|XXGvertex_oport_oport|613|0|948|0|{0|out|}335|336|}
{2010006001|XXGobject_psameas_object|614|0|950|0|{metadata|out_metadata|1|0|}336|335|}
{2010211001|XXGvertex_iport_iport|615|0|951|0|{0|in|}335|337|}
{2010006001|XXGobject_psameas_object|616|0|953|0|{metadata|in_metadata|1|0|}337|335|}
{2010006001|XXGobject_psameas_object|617|0|954|0|{Layout|Layout|0|0|}332|324|}
{2010006001|XXGobject_psameas_object|618|0|955|0|{in_metadata|read_metadata|0|0|}332|328|}
{2010006001|XXGobject_psameas_object|619|0|956|0|{out_metadata|read_metadata|0|0|}332|328|}
{2010601001|XXGgraph_vertex_vertex|620|0|957|0|{Version_Log|}1|338|}
{2010605001|XXGgraph_legend_legend|621|0|959|0|{0|}338|339|}
{2010241001|XXGlegend_face_face|622|0|961|0|{}339|340|}
{2010605001|XXGgraph_legend_legend|623|0|963|0|{1|}338|341|}
{2010241001|XXGlegend_face_face|624|0|965|0|{}341|342|}
{2010605001|XXGgraph_legend_legend|625|0|967|0|{2|}338|343|}
{2010241001|XXGlegend_face_face|626|0|969|0|{}343|344|}
{2010605001|XXGgraph_legend_legend|627|0|971|0|{3|}338|345|}
{2010241001|XXGlegend_face_face|628|0|973|0|{}345|346|}
{2010605001|XXGgraph_legend_legend|629|0|975|0|{4|}338|347|}
{2010241001|XXGlegend_face_face|630|0|977|0|{}347|348|}
{2010605001|XXGgraph_legend_legend|631|0|979|0|{5|}338|349|}
{2010241001|XXGlegend_face_face|632|0|981|0|{}349|350|}
{2010605001|XXGgraph_legend_legend|633|0|983|0|{6|}338|351|}
{2010241001|XXGlegend_face_face|634|0|985|0|{}351|352|}
{2010605001|XXGgraph_legend_legend|635|0|987|0|{7|}338|353|}
{2010241001|XXGlegend_face_face|636|0|989|0|{}353|354|}
{2010605001|XXGgraph_legend_legend|637|0|991|0|{8|}338|355|}
{2010241001|XXGlegend_face_face|638|0|993|0|{}355|356|}
{2010605001|XXGgraph_legend_legend|639|0|995|0|{9|}338|357|}
{2010241001|XXGlegend_face_face|640|0|997|0|{}357|358|}
{2010605001|XXGgraph_legend_legend|641|0|999|0|{10|}338|359|}
{2010241001|XXGlegend_face_face|642|0|1001|0|{}359|360|}
{2010605001|XXGgraph_legend_legend|643|0|1003|0|{11|}338|361|}
{2010241001|XXGlegend_face_face|644|0|1005|0|{}361|362|}
{2010605001|XXGgraph_legend_legend|645|0|1007|0|{12|}338|363|}
{2010241001|XXGlegend_face_face|646|0|1009|0|{}363|364|}
{2010605001|XXGgraph_legend_legend|647|0|1011|0|{13|}338|365|}
{2010241001|XXGlegend_face_face|648|0|1013|0|{}365|366|}
{2010605001|XXGgraph_legend_legend|649|0|1015|0|{14|}338|367|}
{2010241001|XXGlegend_face_face|650|0|1017|0|{}367|368|}
{2010605001|XXGgraph_legend_legend|651|0|1019|0|{15|}338|369|}
{2010241001|XXGlegend_face_face|652|0|1021|0|{}369|370|}
{2010605001|XXGgraph_legend_legend|653|0|1023|0|{16|}338|371|}
{2010241001|XXGlegend_face_face|654|0|1025|0|{}371|372|}
{2010605001|XXGgraph_legend_legend|655|0|1027|0|{17|}338|373|}
{2010241001|XXGlegend_face_face|656|0|1029|0|{}373|374|}
{2010605001|XXGgraph_legend_legend|657|0|1031|0|{18|}338|375|}
{2010241001|XXGlegend_face_face|658|0|1033|0|{}375|376|}
{2010605001|XXGgraph_legend_legend|659|0|1035|0|{19|}338|377|}
{2010241001|XXGlegend_face_face|660|0|1037|0|{}377|378|}
{2010605001|XXGgraph_legend_legend|661|0|1039|0|{20|}338|379|}
{2010241001|XXGlegend_face_face|662|0|1041|0|{}379|380|}
{2010605001|XXGgraph_legend_legend|663|0|1043|0|{21|}338|381|}
{2010241001|XXGlegend_face_face|664|0|1045|0|{}381|382|}
{2010601001|XXGgraph_vertex_vertex|665|0|1047|0|{Write_EXCEL_file_s_Sheet_s_|}1|383|}
{2010604001|XXGgraph_flow_flow|666|0|1049|0|{Flow_1|}383|384|}
{2010604001|XXGgraph_flow_flow|667|0|1051|0|{Flow_4|}383|385|}
{2010604001|XXGgraph_flow_flow|668|0|1053|0|{Flow_6|}383|386|}
{2010604001|XXGgraph_flow_flow|669|0|1055|0|{Flow_7|}383|387|}
{2010601001|XXGgraph_vertex_vertex|670|0|1057|0|{Attach_Header_Record|}383|388|}
{2010604001|XXGgraph_flow_flow|671|0|1059|0|{Flow_1|}388|389|}
{2010604001|XXGgraph_flow_flow|672|0|1061|0|{Flow_2|}388|390|}
{2010604001|XXGgraph_flow_flow|673|0|1063|0|{Flow_3|}388|391|}
{2010604001|XXGgraph_flow_flow|674|0|1065|0|{Flow_4|}388|392|}
{2010604001|XXGgraph_flow_flow|675|0|1067|0|{Flow_5|}388|393|}
{2010604001|XXGgraph_flow_flow|676|0|1069|0|{Flow_6|}388|394|}
{2010604001|XXGgraph_flow_flow|677|0|1071|0|{Flow_8|}388|395|}
{2010601001|XXGgraph_vertex_vertex|678|0|1073|0|{Assign_Seq_nbr_for_each_filename_sheet|}388|396|}
{2010212001|XXGvertex_oport_oport|679|0|1075|0|{0|out|}396|397|}
{2010213001|XXGoport_dst_flow|680|0|1077|0|{0|}397|389|}
{2010212001|XXGvertex_oport_oport|681|0|1078|0|{1|reject|}396|398|}
{2010212001|XXGvertex_oport_oport|682|0|1080|0|{2|error|}396|399|}
{2010212001|XXGvertex_oport_oport|683|0|1082|0|{3|log|}396|400|}
{2010211001|XXGvertex_iport_iport|684|0|1084|0|{0|in|}396|401|}
{2010007001|XXGobject_proto_object|685|0|1086|0|{}396|402|}
{2010212001|XXGvertex_oport_oport|686|0|1088|0|{0|out|}402|403|}
{2010006001|XXGobject_psameas_object|687|0|1090|0|{metadata|out_metadata|1|0|}403|402|}
{2010212001|XXGvertex_oport_oport|688|0|1091|0|{1|reject|}402|404|}
{2010006001|XXGobject_psameas_object|689|0|1093|0|{metadata|reject_metadata|1|0|}404|402|}
{2010212001|XXGvertex_oport_oport|690|0|1094|0|{2|error|}402|405|}
{2010006001|XXGobject_psameas_object|691|0|1096|0|{metadata|error_metadata|1|0|}405|402|}
{2010212001|XXGvertex_oport_oport|692|0|1097|0|{3|log|}402|406|}
{2010006001|XXGobject_psameas_object|693|0|1099|0|{metadata|log_metadata|1|0|}406|402|}
{2010211001|XXGvertex_iport_iport|694|0|1100|0|{0|in|}402|407|}
{2010006001|XXGobject_psameas_object|695|0|1102|0|{metadata|in_metadata|1|0|}407|402|}
{2010006001|XXGobject_psameas_object|696|0|1103|0|{Layout|Layout|0|0|}396|231|}
{2010006001|XXGobject_psameas_object|697|0|1104|0|{in_metadata|out0_metadata|0|0|}396|408|}
{2010212001|XXGvertex_oport_oport|698|0|1106|0|{0|out0|}408|409|}
{2010213001|XXGoport_dst_flow|699|0|1108|0|{0|}409|385|}
{2010212001|XXGvertex_oport_oport|700|0|1109|0|{1|reject0|}408|410|}
{2010212001|XXGvertex_oport_oport|701|0|1111|0|{2|error0|}408|411|}
{2010212001|XXGvertex_oport_oport|702|0|1113|0|{3|log|}408|412|}
{2010211001|XXGvertex_iport_iport|703|0|1115|0|{0|in|}408|413|}
{2010007001|XXGobject_proto_object|704|0|1117|0|{}408|414|}
{2010212001|XXGvertex_oport_oport|705|0|1119|0|{0|out0|}414|415|}
{2010006001|XXGobject_psameas_object|706|0|1121|0|{metadata|out0_metadata|1|0|}415|414|}
{2010006001|XXGobject_psameas_object|707|0|1122|0|{transform0|transform0|1|0|}415|414|}
{2010212001|XXGvertex_oport_oport|708|0|1123|0|{1|reject0|}414|416|}
{2010006001|XXGobject_psameas_object|709|0|1125|0|{metadata|reject0_metadata|1|0|}416|414|}
{2010212001|XXGvertex_oport_oport|710|0|1126|0|{2|error0|}414|417|}
{2010006001|XXGobject_psameas_object|711|0|1128|0|{metadata|error0_metadata|1|0|}417|414|}
{2010212001|XXGvertex_oport_oport|712|0|1129|0|{3|log|}414|418|}
{2010006001|XXGobject_psameas_object|713|0|1131|0|{metadata|log_metadata|1|0|}418|414|}
{2010211001|XXGvertex_iport_iport|714|0|1132|0|{0|in|}414|419|}
{2010006001|XXGobject_psameas_object|715|0|1134|0|{metadata|in_metadata|1|0|}419|414|}
{2010006001|XXGobject_psameas_object|716|0|1135|0|{Layout|Layout|0|0|}408|231|}
{2010006001|XXGobject_psameas_object|717|0|1136|0|{in_metadata|out0_metadata|0|0|}408|56|}
{2010006001|XXGobject_psameas_object|718|0|1137|0|{reject0_metadata|out0_metadata|0|0|}408|56|}
{2010006001|XXGobject_psameas_object|719|0|1138|0|{reject_metadata|out0_metadata|0|0|}396|408|}
{2010601001|XXGgraph_vertex_vertex|720|0|1139|0|{Back_to_excel_format|}388|420|}
{2010212001|XXGvertex_oport_oport|721|0|1141|0|{0|out0|}420|421|}
{2010212001|XXGvertex_oport_oport|722|0|1143|0|{1|reject0|}420|422|}
{2010212001|XXGvertex_oport_oport|723|0|1145|0|{2|error0|}420|423|}
{2010212001|XXGvertex_oport_oport|724|0|1147|0|{3|log|}420|424|}
{2010211001|XXGvertex_iport_iport|725|0|1149|0|{0|in|}420|425|}
{2010214001|XXGiport_src_flow|726|0|1151|0|{0|}425|394|}
{2010007001|XXGobject_proto_object|727|0|1152|0|{}420|426|}
{2010212001|XXGvertex_oport_oport|728|0|1154|0|{0|out0|}426|427|}
{2010006001|XXGobject_psameas_object|729|0|1156|0|{metadata|out0_metadata|1|0|}427|426|}
{2010006001|XXGobject_psameas_object|730|0|1157|0|{transform0|transform0|1|0|}427|426|}
{2010212001|XXGvertex_oport_oport|731|0|1158|0|{1|reject0|}426|428|}
{2010006001|XXGobject_psameas_object|732|0|1160|0|{metadata|reject0_metadata|1|0|}428|426|}
{2010212001|XXGvertex_oport_oport|733|0|1161|0|{2|error0|}426|429|}
{2010006001|XXGobject_psameas_object|734|0|1163|0|{metadata|error0_metadata|1|0|}429|426|}
{2010212001|XXGvertex_oport_oport|735|0|1164|0|{3|log|}426|430|}
{2010006001|XXGobject_psameas_object|736|0|1166|0|{metadata|log_metadata|1|0|}430|426|}
{2010211001|XXGvertex_iport_iport|737|0|1167|0|{0|in|}426|431|}
{2010006001|XXGobject_psameas_object|738|0|1169|0|{metadata|in_metadata|1|0|}431|426|}
{2010006001|XXGobject_psameas_object|739|0|1170|0|{Layout|Layout|0|0|}420|231|}
{2010006001|XXGobject_psameas_object|740|0|1171|0|{in_metadata|out_metadata|0|0|}420|396|}
{2010006001|XXGobject_psameas_object|741|0|1172|0|{reject0_metadata|out_metadata|0|0|}420|396|}
{2010601001|XXGgraph_vertex_vertex|742|0|1173|0|{Bring_Header_to_top|}388|432|}
{2010212001|XXGvertex_oport_oport|743|0|1175|0|{0|out|}432|433|}
{2010213001|XXGoport_dst_flow|744|0|1177|0|{0|}433|394|}
{2010211001|XXGvertex_iport_iport|745|0|1178|0|{0|in|}432|434|}
{2010214001|XXGiport_src_flow|746|0|1180|0|{0|}434|392|}
{2010007001|XXGobject_proto_object|747|0|1181|0|{}432|435|}
{2010212001|XXGvertex_oport_oport|748|0|1183|0|{0|out|}435|436|}
{2010006001|XXGobject_psameas_object|749|0|1185|0|{metadata|out_metadata|1|0|}436|435|}
{2010211001|XXGvertex_iport_iport|750|0|1186|0|{0|in|}435|437|}
{2010006001|XXGobject_psameas_object|751|0|1188|0|{metadata|in_metadata|1|0|}437|435|}
{2010006001|XXGobject_psameas_object|752|0|1189|0|{Layout|Layout|0|0|}432|231|}
{2010006001|XXGobject_psameas_object|753|0|1190|0|{in_metadata|out_metadata|0|0|}432|396|}
{2010006001|XXGobject_psameas_object|754|0|1191|0|{out_metadata|out_metadata|0|0|}432|396|}
{2010601001|XXGgraph_vertex_vertex|755|0|1192|0|{Generation_header_for_each_sheet_file|}388|438|}
{2010212001|XXGvertex_oport_oport|756|0|1194|0|{0|out0|}438|439|}
{2010213001|XXGoport_dst_flow|757|0|1196|0|{0|}439|390|}
{2010212001|XXGvertex_oport_oport|758|0|1197|0|{1|reject0|}438|440|}
{2010212001|XXGvertex_oport_oport|759|0|1199|0|{2|error0|}438|441|}
{2010212001|XXGvertex_oport_oport|760|0|1201|0|{3|log|}438|442|}
{2010211001|XXGvertex_iport_iport|761|0|1203|0|{0|in|}438|443|}
{2010214001|XXGiport_src_flow|762|0|1205|0|{0|}443|395|}
{2010007001|XXGobject_proto_object|763|0|1206|0|{}438|444|}
{2010212001|XXGvertex_oport_oport|764|0|1208|0|{0|out0|}444|445|}
{2010006001|XXGobject_psameas_object|765|0|1210|0|{metadata|out0_metadata|1|0|}445|444|}
{2010006001|XXGobject_psameas_object|766|0|1211|0|{transform0|transform0|1|0|}445|444|}
{2010212001|XXGvertex_oport_oport|767|0|1212|0|{1|reject0|}444|446|}
{2010006001|XXGobject_psameas_object|768|0|1214|0|{metadata|reject0_metadata|1|0|}446|444|}
{2010212001|XXGvertex_oport_oport|769|0|1215|0|{2|error0|}444|447|}
{2010006001|XXGobject_psameas_object|770|0|1217|0|{metadata|error0_metadata|1|0|}447|444|}
{2010212001|XXGvertex_oport_oport|771|0|1218|0|{3|log|}444|448|}
{2010006001|XXGobject_psameas_object|772|0|1220|0|{metadata|log_metadata|1|0|}448|444|}
{2010211001|XXGvertex_iport_iport|773|0|1221|0|{0|in|}444|449|}
{2010006001|XXGobject_psameas_object|774|0|1223|0|{metadata|in_metadata|1|0|}449|444|}
{2010006001|XXGobject_psameas_object|775|0|1224|0|{Layout|Layout|0|0|}438|231|}
{2010006001|XXGobject_psameas_object|776|0|1225|0|{in_metadata|out_metadata|0|0|}438|396|}
{2010006001|XXGobject_psameas_object|777|0|1226|0|{out0_metadata|out_metadata|0|0|}438|396|}
{2010006001|XXGobject_psameas_object|778|0|1227|0|{reject0_metadata|out_metadata|0|0|}438|396|}
{2010601001|XXGgraph_vertex_vertex|779|0|1228|0|{Merge|}388|450|}
{2010212001|XXGvertex_oport_oport|780|0|1230|0|{0|out|}450|451|}
{2010213001|XXGoport_dst_flow|781|0|1232|0|{0|}451|392|}
{2010211001|XXGvertex_iport_iport|782|0|1233|0|{0|in|}450|452|}
{2010214001|XXGiport_src_flow|783|0|1235|0|{0|}452|390|}
{2010214001|XXGiport_src_flow|784|0|1236|0|{1|}452|393|}
{2010007001|XXGobject_proto_object|785|0|1237|0|{}450|453|}
{2010212001|XXGvertex_oport_oport|786|0|1239|0|{0|out|}453|454|}
{2010006001|XXGobject_psameas_object|787|0|1241|0|{metadata|out_metadata|1|0|}454|453|}
{2010211001|XXGvertex_iport_iport|788|0|1242|0|{0|in|}453|455|}
{2010006001|XXGobject_psameas_object|789|0|1244|0|{metadata|in_metadata|1|0|}455|453|}
{2010006001|XXGobject_psameas_object|790|0|1245|0|{Layout|Layout|0|0|}450|231|}
{2010006001|XXGobject_psameas_object|791|0|1246|0|{in_metadata|out_metadata|0|0|}450|396|}
{2010006001|XXGobject_psameas_object|792|0|1247|0|{out_metadata|out_metadata|0|0|}450|396|}
{2010601001|XXGgraph_vertex_vertex|793|0|1248|0|{Remove_Duplicates|}388|456|}
{2010212001|XXGvertex_oport_oport|794|0|1250|0|{0|out|}456|457|}
{2010213001|XXGoport_dst_flow|795|0|1252|0|{0|}457|395|}
{2010212001|XXGvertex_oport_oport|796|0|1253|0|{1|dup|}456|458|}
{2010212001|XXGvertex_oport_oport|797|0|1255|0|{2|reject|}456|459|}
{2010212001|XXGvertex_oport_oport|798|0|1257|0|{3|error|}456|460|}
{2010212001|XXGvertex_oport_oport|799|0|1259|0|{4|log|}456|461|}
{2010211001|XXGvertex_iport_iport|800|0|1261|0|{0|in|}456|462|}
{2010214001|XXGiport_src_flow|801|0|1263|0|{0|}462|391|}
{2010007001|XXGobject_proto_object|802|0|1264|0|{}456|463|}
{2010212001|XXGvertex_oport_oport|803|0|1266|0|{0|out|}463|464|}
{2010006001|XXGobject_psameas_object|804|0|1268|0|{metadata|out_metadata|1|0|}464|463|}
{2010212001|XXGvertex_oport_oport|805|0|1269|0|{1|dup|}463|465|}
{2010006001|XXGobject_psameas_object|806|0|1271|0|{metadata|dup_metadata|1|0|}465|463|}
{2010212001|XXGvertex_oport_oport|807|0|1272|0|{2|reject|}463|466|}
{2010006001|XXGobject_psameas_object|808|0|1274|0|{metadata|reject_metadata|1|0|}466|463|}
{2010212001|XXGvertex_oport_oport|809|0|1275|0|{3|error|}463|467|}
{2010006001|XXGobject_psameas_object|810|0|1277|0|{metadata|error_metadata|1|0|}467|463|}
{2010212001|XXGvertex_oport_oport|811|0|1278|0|{4|log|}463|468|}
{2010006001|XXGobject_psameas_object|812|0|1280|0|{metadata|log_metadata|1|0|}468|463|}
{2010211001|XXGvertex_iport_iport|813|0|1281|0|{0|in|}463|469|}
{2010006001|XXGobject_psameas_object|814|0|1283|0|{metadata|in_metadata|1|0|}469|463|}
{2010006001|XXGobject_psameas_object|815|0|1284|0|{Layout|Layout|0|0|}456|231|}
{2010006001|XXGobject_psameas_object|816|0|1285|0|{dup_metadata|out_metadata|0|0|}456|396|}
{2010006001|XXGobject_psameas_object|817|0|1286|0|{in_metadata|out_metadata|0|0|}456|396|}
{2010006001|XXGobject_psameas_object|818|0|1287|0|{out_metadata|out_metadata|0|0|}456|396|}
{2010006001|XXGobject_psameas_object|819|0|1288|0|{reject_metadata|out_metadata|0|0|}456|396|}
{2010601001|XXGgraph_vertex_vertex|820|0|1289|0|{Replicate|}388|470|}
{2010212001|XXGvertex_oport_oport|821|0|1291|0|{0|out|}470|471|}
{2010213001|XXGoport_dst_flow|822|0|1293|0|{0|}471|391|}
{2010213001|XXGoport_dst_flow|823|0|1294|0|{1|}471|393|}
{2010211001|XXGvertex_iport_iport|824|0|1295|0|{0|in|}470|472|}
{2010214001|XXGiport_src_flow|825|0|1297|0|{0|}472|389|}
{2010007001|XXGobject_proto_object|826|0|1298|0|{}470|473|}
{2010212001|XXGvertex_oport_oport|827|0|1300|0|{0|out|}473|474|}
{2010006001|XXGobject_psameas_object|828|0|1302|0|{metadata|out_metadata|1|0|}474|473|}
{2010211001|XXGvertex_iport_iport|829|0|1303|0|{0|in|}473|475|}
{2010006001|XXGobject_psameas_object|830|0|1305|0|{metadata|in_metadata|1|0|}475|473|}
{2010006001|XXGobject_psameas_object|831|0|1306|0|{Layout|Layout|0|0|}470|231|}
{2010006001|XXGobject_psameas_object|832|0|1307|0|{in_metadata|out_metadata|0|0|}470|396|}
{2010006001|XXGobject_psameas_object|833|0|1308|0|{out_metadata|out_metadata|0|0|}470|396|}
{2010212001|XXGvertex_oport_oport|834|0|1309|0|{0|out0|}388|476|}
{2010216002|XXGoport_binding_oport|835|0|1311|0|{.5|.5|{0|}14644|}476|421|}
{2010213001|XXGoport_dst_flow|836|0|1312|0|{0|}476|387|}
{2010211001|XXGvertex_iport_iport|837|0|1313|0|{0|in0|}388|477|}
{2010215002|XXGiport_binding_iport|838|0|1315|0|{.5|.5|{0|}14643|}477|401|}
{2010214001|XXGiport_src_flow|839|0|1316|0|{0|}477|384|}
{2010601001|XXGgraph_vertex_vertex|840|0|1317|0|{EXCEL_BRE_Default_Mapping|}383|408|}
{2010601001|XXGgraph_vertex_vertex|841|0|1318|0|{Sort_on_filename_sheetname|}383|478|}
{2010212001|XXGvertex_oport_oport|842|0|1320|0|{0|out|}478|479|}
{2010213001|XXGoport_dst_flow|843|0|1322|0|{0|}479|384|}
{2010211001|XXGvertex_iport_iport|844|0|1323|0|{0|in|}478|480|}
{2010214001|XXGiport_src_flow|845|0|1325|0|{0|}480|385|}
{2010007001|XXGobject_proto_object|846|0|1326|0|{}478|481|}
{2010212001|XXGvertex_oport_oport|847|0|1328|0|{0|out|}481|482|}
{2010006001|XXGobject_psameas_object|848|0|1330|0|{metadata|out_metadata|1|0|}482|481|}
{2010211001|XXGvertex_iport_iport|849|0|1331|0|{0|in|}481|483|}
{2010006001|XXGobject_psameas_object|850|0|1333|0|{metadata|in_metadata|1|0|}483|481|}
{2010006001|XXGobject_psameas_object|851|0|1334|0|{Layout|Layout|0|0|}478|231|}
{2010006001|XXGobject_psameas_object|852|0|1335|0|{in_metadata|out0_metadata|0|0|}478|408|}
{2010006001|XXGobject_psameas_object|853|0|1336|0|{out_metadata|out0_metadata|0|0|}478|408|}
{2010601001|XXGgraph_vertex_vertex|854|0|1337|0|{Write_Excel_Flow|}383|484|}
{2010212001|XXGvertex_oport_oport|855|0|1339|0|{0|out|}484|485|}
{2010213001|XXGoport_dst_flow|856|0|1341|0|{0|}485|386|}
{2010212001|XXGvertex_oport_oport|857|0|1342|0|{1|reject|}484|486|}
{2010212001|XXGvertex_oport_oport|858|0|1344|0|{2|error|}484|487|}
{2010212001|XXGvertex_oport_oport|859|0|1346|0|{3|log|}484|488|}
{2010211001|XXGvertex_iport_iport|860|0|1348|0|{0|in|}484|489|}
{2010214001|XXGiport_src_flow|861|0|1350|0|{0|}489|387|}
{2010007001|XXGobject_proto_object|862|0|1351|0|{}484|490|}
{2010212001|XXGvertex_oport_oport|863|0|1353|0|{0|out|}490|491|}
{2010006001|XXGobject_psameas_object|864|0|1355|0|{metadata|out_metadata|1|0|}491|490|}
{2010212001|XXGvertex_oport_oport|865|0|1356|0|{1|reject|}490|492|}
{2010006001|XXGobject_psameas_object|866|0|1358|0|{metadata|reject_metadata|1|0|}492|490|}
{2010212001|XXGvertex_oport_oport|867|0|1359|0|{2|error|}490|493|}
{2010006001|XXGobject_psameas_object|868|0|1361|0|{metadata|error_metadata|1|0|}493|490|}
{2010212001|XXGvertex_oport_oport|869|0|1362|0|{3|log|}490|494|}
{2010006001|XXGobject_psameas_object|870|0|1364|0|{metadata|log_metadata|1|0|}494|490|}
{2010211001|XXGvertex_iport_iport|871|0|1365|0|{0|in|}490|495|}
{2010006001|XXGobject_psameas_object|872|0|1367|0|{metadata|in_metadata|1|0|}495|490|}
{2010006001|XXGobject_psameas_object|873|0|1368|0|{Layout|Layout|0|0|}484|231|}
{2010006001|XXGobject_psameas_object|874|0|1369|0|{in_metadata|out_metadata|0|0|}484|478|}
{2010006001|XXGobject_psameas_object|875|0|1370|0|{reject_metadata|in_metadata|0|0|}484|484|}
{2010006001|XXGobject_psameas_object|876|0|1371|0|{write_mode|XLS_WRITE_MODE|1|0|}484|383|}
{2010601001|XXGgraph_vertex_vertex|877|0|1372|0|{Write_Multiple_Files|}383|496|}
{2010212001|XXGvertex_oport_oport|878|0|1374|0|{0|reject|}496|497|}
{2010212001|XXGvertex_oport_oport|879|0|1376|0|{1|error|}496|498|}
{2010212001|XXGvertex_oport_oport|880|0|1378|0|{2|log|}496|499|}
{2010211001|XXGvertex_iport_iport|881|0|1380|0|{0|in|}496|500|}
{2010214001|XXGiport_src_flow|882|0|1382|0|{0|}500|386|}
{2010007001|XXGobject_proto_object|883|0|1383|0|{}496|501|}
{2010212001|XXGvertex_oport_oport|884|0|1385|0|{0|reject|}501|502|}
{2010006001|XXGobject_psameas_object|885|0|1387|0|{metadata|reject_metadata|1|0|}502|501|}
{2010212001|XXGvertex_oport_oport|886|0|1388|0|{1|error|}501|503|}
{2010006001|XXGobject_psameas_object|887|0|1390|0|{metadata|error_metadata|1|0|}503|501|}
{2010212001|XXGvertex_oport_oport|888|0|1391|0|{2|log|}501|504|}
{2010006001|XXGobject_psameas_object|889|0|1393|0|{metadata|log_metadata|1|0|}504|501|}
{2010211001|XXGvertex_iport_iport|890|0|1394|0|{0|in|}501|505|}
{2010006001|XXGobject_psameas_object|891|0|1396|0|{metadata|in_metadata|1|0|}505|501|}
{2010006001|XXGobject_psameas_object|892|0|1397|0|{Layout|Layout|0|0|}496|231|}
{2010006001|XXGobject_psameas_object|893|0|1398|0|{in_metadata|out_metadata|0|0|}496|484|}
{2010006001|XXGobject_psameas_object|894|0|1399|0|{reject_metadata|out_metadata|0|0|}496|484|}
{2010211001|XXGvertex_iport_iport|895|0|1400|0|{0|in0|}383|506|}
{2010215002|XXGiport_binding_iport|896|0|1402|0|{.5|.5|{0|}14524|}506|413|}
{2010214001|XXGiport_src_flow|897|0|1403|0|{0|}506|13|}
{2010006001|XXGobject_psameas_object|898|0|1404|0|{XLS_WRITE_MODE|XLS_WRITE_MODE|1|0|}383|1|}
{2010601001|XXGgraph_vertex_vertex|899|0|1405|0|{Write_Multiple_CSVs|}1|507|}
{2010604001|XXGgraph_flow_flow|900|0|1407|0|{Flow_1|}507|508|}
{2010604001|XXGgraph_flow_flow|901|0|1409|0|{Flow_5|}507|509|}
{2010604001|XXGgraph_flow_flow|902|0|1411|0|{Flow_6|}507|510|}
{2010604001|XXGgraph_flow_flow|903|0|1413|0|{Flow_7|}507|511|}
{2010604001|XXGgraph_flow_flow|904|0|1415|0|{Flow_8|}507|512|}
{2010604001|XXGgraph_flow_flow|905|0|1417|0|{Flow_9|}507|513|}
{2010601001|XXGgraph_vertex_vertex|906|0|1419|0|{Concatenate|}507|514|}
{2010212001|XXGvertex_oport_oport|907|0|1421|0|{0|out|}514|515|}
{2010213001|XXGoport_dst_flow|908|0|1423|0|{0|}515|512|}
{2010211001|XXGvertex_iport_iport|909|0|1424|0|{0|in|}514|516|}
{2010214001|XXGiport_src_flow|910|0|1426|0|{0|}516|508|}
{2010214001|XXGiport_src_flow|911|0|1427|0|{1|}516|511|}
{2010007001|XXGobject_proto_object|912|0|1428|0|{}514|517|}
{2010212001|XXGvertex_oport_oport|913|0|1430|0|{0|out|}517|518|}
{2010006001|XXGobject_psameas_object|914|0|1432|0|{metadata|out_metadata|1|0|}518|517|}
{2010211001|XXGvertex_iport_iport|915|0|1433|0|{0|in|}517|519|}
{2010006001|XXGobject_psameas_object|916|0|1435|0|{metadata|in_metadata|1|0|}519|517|}
{2010006001|XXGobject_psameas_object|917|0|1436|0|{Layout|Layout|0|0|}514|231|}
{2010006001|XXGobject_psameas_object|918|0|1437|0|{in_metadata|out_metadata|0|0|}514|520|}
{2010212001|XXGvertex_oport_oport|919|0|1439|0|{0|out|}520|521|}
{2010213001|XXGoport_dst_flow|920|0|1441|0|{0|}521|511|}
{2010212001|XXGvertex_oport_oport|921|0|1442|0|{1|rollup|}520|522|}
{2010213001|XXGoport_dst_flow|922|0|1444|0|{0|}522|508|}
{2010212001|XXGvertex_oport_oport|923|0|1445|0|{2|reject|}520|523|}
{2010212001|XXGvertex_oport_oport|924|0|1447|0|{3|error|}520|524|}
{2010212001|XXGvertex_oport_oport|925|0|1449|0|{4|log|}520|525|}
{2010211001|XXGvertex_iport_iport|926|0|1451|0|{0|in|}520|526|}
{2010214001|XXGiport_src_flow|927|0|1453|0|{0|}526|510|}
{2010007001|XXGobject_proto_object|928|0|1454|0|{}520|527|}
{2010212001|XXGvertex_oport_oport|929|0|1456|0|{0|out|}527|528|}
{2010006001|XXGobject_psameas_object|930|0|1458|0|{metadata|out_metadata|1|0|}528|527|}
{2010212001|XXGvertex_oport_oport|931|0|1459|0|{1|rollup|}527|529|}
{2010006001|XXGobject_psameas_object|932|0|1461|0|{metadata|rollup_metadata|1|0|}529|527|}
{2010212001|XXGvertex_oport_oport|933|0|1462|0|{2|reject|}527|530|}
{2010006001|XXGobject_psameas_object|934|0|1464|0|{metadata|reject_metadata|1|0|}530|527|}
{2010212001|XXGvertex_oport_oport|935|0|1465|0|{3|error|}527|531|}
{2010006001|XXGobject_psameas_object|936|0|1467|0|{metadata|error_metadata|1|0|}531|527|}
{2010212001|XXGvertex_oport_oport|937|0|1468|0|{4|log|}527|532|}
{2010006001|XXGobject_psameas_object|938|0|1470|0|{metadata|log_metadata|1|0|}532|527|}
{2010211001|XXGvertex_iport_iport|939|0|1471|0|{0|in|}527|533|}
{2010006001|XXGobject_psameas_object|940|0|1473|0|{metadata|in_metadata|1|0|}533|527|}
{2010006001|XXGobject_psameas_object|941|0|1474|0|{Layout|Layout|0|0|}520|231|}
{2010006001|XXGobject_psameas_object|942|0|1475|0|{in_metadata|out0_metadata|0|0|}520|534|}
{2010212001|XXGvertex_oport_oport|943|0|1477|0|{0|out0|}534|535|}
{2010213001|XXGoport_dst_flow|944|0|1479|0|{0|}535|513|}
{2010212001|XXGvertex_oport_oport|945|0|1480|0|{1|reject0|}534|536|}
{2010212001|XXGvertex_oport_oport|946|0|1482|0|{2|error0|}534|537|}
{2010212001|XXGvertex_oport_oport|947|0|1484|0|{3|log|}534|538|}
{2010211001|XXGvertex_iport_iport|948|0|1486|0|{0|in|}534|539|}
{2010214001|XXGiport_src_flow|949|0|1488|0|{0|}539|509|}
{2010007001|XXGobject_proto_object|950|0|1489|0|{}534|540|}
{2010212001|XXGvertex_oport_oport|951|0|1491|0|{0|out0|}540|541|}
{2010006001|XXGobject_psameas_object|952|0|1493|0|{metadata|out0_metadata|1|0|}541|540|}
{2010006001|XXGobject_psameas_object|953|0|1494|0|{transform0|transform0|1|0|}541|540|}
{2010212001|XXGvertex_oport_oport|954|0|1495|0|{1|reject0|}540|542|}
{2010006001|XXGobject_psameas_object|955|0|1497|0|{metadata|reject0_metadata|1|0|}542|540|}
{2010212001|XXGvertex_oport_oport|956|0|1498|0|{2|error0|}540|543|}
{2010006001|XXGobject_psameas_object|957|0|1500|0|{metadata|error0_metadata|1|0|}543|540|}
{2010212001|XXGvertex_oport_oport|958|0|1501|0|{3|log|}540|544|}
{2010006001|XXGobject_psameas_object|959|0|1503|0|{metadata|log_metadata|1|0|}544|540|}
{2010211001|XXGvertex_iport_iport|960|0|1504|0|{0|in|}540|545|}
{2010006001|XXGobject_psameas_object|961|0|1506|0|{metadata|in_metadata|1|0|}545|540|}
{2010006001|XXGobject_psameas_object|962|0|1507|0|{Layout|Layout|0|0|}534|231|}
{2010006001|XXGobject_psameas_object|963|0|1508|0|{in_metadata|out0_metadata|0|0|}534|56|}
{2010006001|XXGobject_psameas_object|964|0|1509|0|{reject0_metadata|out0_metadata|0|0|}534|56|}
{2010006001|XXGobject_psameas_object|965|0|1510|0|{transform0|MAP_TO_TARGET_XFR|1|0|}534|507|}
{2010006001|XXGobject_psameas_object|966|0|1511|0|{reject_metadata|out0_metadata|0|0|}520|534|}
{2010006001|XXGobject_psameas_object|967|0|1512|0|{out_metadata|out_metadata|0|0|}514|520|}
{2010601001|XXGgraph_vertex_vertex|968|0|1513|0|{Group_on_file_name_to_generate_header_for_each_file|}507|520|}
{2010601001|XXGgraph_vertex_vertex|969|0|1514|0|{RFMT_Calculate_file_name_and_accumulate_data|}507|534|}
{2010601001|XXGgraph_vertex_vertex|970|0|1515|0|{RPLC_1|}507|546|}
{2010212001|XXGvertex_oport_oport|971|0|1517|0|{0|out|}546|547|}
{2010213001|XXGoport_dst_flow|972|0|1519|0|{0|}547|509|}
{2010211001|XXGvertex_iport_iport|973|0|1520|0|{0|in|}546|548|}
{2010007001|XXGobject_proto_object|974|0|1522|0|{}546|549|}
{2010212001|XXGvertex_oport_oport|975|0|1524|0|{0|out|}549|550|}
{2010006001|XXGobject_psameas_object|976|0|1526|0|{metadata|out_metadata|1|0|}550|549|}
{2010211001|XXGvertex_iport_iport|977|0|1527|0|{0|in|}549|551|}
{2010006001|XXGobject_psameas_object|978|0|1529|0|{metadata|in_metadata|1|0|}551|549|}
{2010006001|XXGobject_psameas_object|979|0|1530|0|{Layout|Layout|0|0|}546|231|}
{2010006001|XXGobject_psameas_object|980|0|1531|0|{in_metadata|out0_metadata|0|0|}546|56|}
{2010006001|XXGobject_psameas_object|981|0|1532|0|{out_metadata|out0_metadata|0|0|}546|56|}
{2010601001|XXGgraph_vertex_vertex|982|0|1533|0|{SORT_on_file_name|}507|552|}
{2010212001|XXGvertex_oport_oport|983|0|1535|0|{0|out|}552|553|}
{2010213001|XXGoport_dst_flow|984|0|1537|0|{0|}553|510|}
{2010211001|XXGvertex_iport_iport|985|0|1538|0|{0|in|}552|554|}
{2010214001|XXGiport_src_flow|986|0|1540|0|{0|}554|513|}
{2010007001|XXGobject_proto_object|987|0|1541|0|{}552|555|}
{2010212001|XXGvertex_oport_oport|988|0|1543|0|{0|out|}555|556|}
{2010006001|XXGobject_psameas_object|989|0|1545|0|{metadata|out_metadata|1|0|}556|555|}
{2010211001|XXGvertex_iport_iport|990|0|1546|0|{0|in|}555|557|}
{2010006001|XXGobject_psameas_object|991|0|1548|0|{metadata|in_metadata|1|0|}557|555|}
{2010006001|XXGobject_psameas_object|992|0|1549|0|{Layout|Layout|0|0|}552|231|}
{2010006001|XXGobject_psameas_object|993|0|1550|0|{in_metadata|out0_metadata|0|0|}552|534|}
{2010006001|XXGobject_psameas_object|994|0|1551|0|{out_metadata|out0_metadata|0|0|}552|534|}
{2010601001|XXGgraph_vertex_vertex|995|0|1552|0|{Write_Multiple_Files|}507|558|}
{2010212001|XXGvertex_oport_oport|996|0|1554|0|{0|reject|}558|559|}
{2010212001|XXGvertex_oport_oport|997|0|1556|0|{1|error|}558|560|}
{2010212001|XXGvertex_oport_oport|998|0|1558|0|{2|log|}558|561|}
{2010211001|XXGvertex_iport_iport|999|0|1560|0|{0|in|}558|562|}
{2010214001|XXGiport_src_flow|1000|0|1562|0|{0|}562|512|}
{2010007001|XXGobject_proto_object|1001|0|1563|0|{}558|563|}
{2010212001|XXGvertex_oport_oport|1002|0|1565|0|{0|reject|}563|564|}
{2010006001|XXGobject_psameas_object|1003|0|1567|0|{metadata|reject_metadata|1|0|}564|563|}
{2010212001|XXGvertex_oport_oport|1004|0|1568|0|{1|error|}563|565|}
{2010006001|XXGobject_psameas_object|1005|0|1570|0|{metadata|error_metadata|1|0|}565|563|}
{2010212001|XXGvertex_oport_oport|1006|0|1571|0|{2|log|}563|566|}
{2010006001|XXGobject_psameas_object|1007|0|1573|0|{metadata|log_metadata|1|0|}566|563|}
{2010211001|XXGvertex_iport_iport|1008|0|1574|0|{0|in|}563|567|}
{2010006001|XXGobject_psameas_object|1009|0|1576|0|{metadata|in_metadata|1|0|}567|563|}
{2010006001|XXGobject_psameas_object|1010|0|1577|0|{Layout|Layout|0|0|}558|231|}
{2010006001|XXGobject_psameas_object|1011|0|1578|0|{in_metadata|out_metadata|0|0|}558|520|}
{2010006001|XXGobject_psameas_object|1012|0|1579|0|{reject_metadata|out_metadata|0|0|}558|520|}
{2010211001|XXGvertex_iport_iport|1013|0|1580|0|{0|in0|}507|568|}
{2010215002|XXGiport_binding_iport|1014|0|1582|0|{.5|.5|{0|}14235|}568|548|}
{2010214001|XXGiport_src_flow|1015|0|1583|0|{0|}568|12|}
{2010006001|XXGobject_psameas_object|1016|0|1584|0|{FILE_QUOTE_FLAG|FILE_QUOTE_FLAG|1|0|}507|1|}
{2010006001|XXGobject_psameas_object|1017|0|1585|0|{MAP_TO_TARGET_XFR|MULTI_CSV_MAP_TO_TARGET_XFR|1|0|}507|1|}
{2010109001|XXGobject_property_value|1018|0|1586|0|{0|TrackingThumbprint|72|}1|569|}
