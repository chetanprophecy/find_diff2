@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|860|rel_count|1358|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|_____Intermediate_Pset_Parameters_________|@3|9|K|@{0|}}
{30001002|XXparameter|AI_DML|$AI_DML|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_SERIAL_TEMP|$AI_SERIAL_TEMP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_MFS_TEMP|$AI_MFS_TEMP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_MFS|$AI_MFS|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_SERIAL_LOOKUP|$AI_SERIAL_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_MFS_LOOKUP|$AI_MFS_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_SERIAL_LOG|$AI_SERIAL_LOG|3|9|EFK|@{0|}}
{30001002|XXparameter|______Input_Parameters_________|@3|9|K|@{0|}}
{30001002|XXparameter|KEY||3|9|EFK|This key is a data partition key |{0|}}
{30001002|XXparameter|ICFF_KEY|$KEY|3|9|FK|If no key is specified , data partion key will become ICFF key for the graph|{0|}}
{30001002|XXparameter|INPUT_FILE_PATH||3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION|$[string_prefix(INPUT_FILE_PATH, string_rindex(INPUT_FILE_PATH, "/"))]|3|9|FK|@{0|}}
{30001002|XXparameter|OUTPUT_DATASET_TYPE|REFERENCE|15|9|FK|@{2|REFERENCE|TRANSACTION|}}
{30001002|XXparameter|INPUT_FILE_PATTERN||3|9|FK|This pattern should be added without .dat or .dat.gz , this is used in identifying o/p dml and generating o/p file name |{0|}}
{30001002|XXparameter|CREATE_ICFF|False|13|9|RFK|@{0|}}
{30001002|XXparameter|WRITE_MULTIPLE_ICFF|False|13|9|FK|@{0|}}
{30001002|XXparameter|INDEX_FIELD||3|9|FK|Field (other than KEY) on which index is needed. A separate ICFF will be created for this field.|{0|}}
{30001002|XXparameter|MULTIPLE_ICFF_SUB_DIR||3|9|EFK|@{0|}}
{30001002|XXparameter|HEADER_COUNT|0|3|9|RFK|@{0|}}
{30001002|XXparameter|CREATE_REDUCED_DATASET|N|3|9|FK|This parameter should be enabled for very large datasets where alternate query approach is needed|{0|}}
{30001002|XXparameter|USE_STEP2_REDUCTION|N|3|9|FK|@{0|}}
{30001002|XXparameter|USE_STEP3_REDUCTION|N|3|9|FK|@{0|}}
{30001002|XXparameter|USE_DEFAULT_PARTITION|False|13|9|FK|@{0|}}
{30001002|XXparameter|DEFAULT_XFR|out::reformat(in)=
begin
out.(*, form == "string") :1: string_trim(in.*);
out.* :: in.*;
end;|3|9|FK|This is the default XFR that will be applied in case there is no specific data correction xfr |{0|}}
{30001002|XXparameter|FINAL_SELECT|1|3|9|FK|@{0|}}
{30001002|XXparameter|____Runtime_Parameters_and_Input_Parameters________|@3|9|K|These parameters  should be left to be resolved via graph but can be overrided in many cases as per requirement|{0|}}
{30001002|XXparameter|EXTERNAL_RUN_ID||3|9|FK|A unique identifier for the run. This is typically passed in from an outer plan that wants to keep track of tasks that ran in a single plan run. This is used, for example, in setting up the log file name of the list of files read.|{0|}}
{30001002|XXparameter|DML_FILE_VEC|$[directory_listing(AI_DML,INPUT_FILE_PATTERN)]|3|9|FK|@{0|}}
{30001002|XXparameter|DML_FILE|$[if(length_of(DML_FILE_VEC) == 1 ) AI_DML+ "/" + DML_FILE_VEC[0] 
else "ambigious refernce or dml file is not defined in AI_DML , pass in input parameter"
]|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_DML|$DML_FILE|3|9|K|@{0|}}
{30001002|XXparameter|OUTPUT_DML_FILE|$DML_FILE|3|9|FK|Target DML file|{0|}}
{30001002|XXparameter|OUTPUT_DML_REDUCED|$[if(string_index(OUTPUT_DML_FILE ,".dml"))
string_replace(OUTPUT_DML_FILE, ".dml", "_reduced.dml")
else
OUTPUT_DML_FILE
]|3|9|K|The naming convention of dml file for reduced dataset should be main_dml to main_dml_reduced |{0|}}
{30001002|XXparameter|OUTPUT_STEP2_REDUCED_DML|$[if(string_index(OUTPUT_DML_FILE ,".dml"))
string_replace(OUTPUT_DML_FILE, ".dml", "_reduced_step2.dml")
else
OUTPUT_DML_FILE
]|3|9|K|@{0|}}
{30001002|XXparameter|OUTPUT_STEP3_REDUCED_DML|$[if(string_index(OUTPUT_DML_FILE ,".dml"))
string_replace(OUTPUT_DML_FILE, ".dml", "_reduced_step3.dml")
else
OUTPUT_DML_FILE
]|3|9|K|@{0|}}
{30001002|XXparameter|CLEAN_OUT_FILE_FOR_NAME|$[string_filter_out(INPUT_FILE_PATTERN,"*?")]|3|9|EFK|If not passed as from pset , the O/P file name will be derived from input pattern|{0|}}
{30001002|XXparameter|CHECK|$[if(is_blank(KEY) and CREATE_ICFF) force_abort("No KEY provided for ICFF target file") else 0]|3|9|RK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE|$[ if (OUTPUT_DATASET_TYPE == 'REFERENCE'  )
string_concat(AI_MFS_LOOKUP ,'/' , CLEAN_OUT_FILE_FOR_NAME , '.dat')
else if ( OUTPUT_DATASET_TYPE == 'TRANSACTION' && CREATE_ICFF && WRITE_MULTIPLE_ICFF  )
string_concat(AI_MFS ,'/' ,MULTIPLE_ICFF_SUB_DIR, '/', CLEAN_OUT_FILE_FOR_NAME , '.dat.gz')

else if ( OUTPUT_DATASET_TYPE == 'TRANSACTION' && CREATE_ICFF  )

string_concat(AI_MFS ,'/' , CLEAN_OUT_FILE_FOR_NAME , '.dat.gz')
else 
string_concat(AI_MFS ,'/' , CLEAN_OUT_FILE_FOR_NAME , '.dat')
]|3|9|RK|Location of query it target dataset|{0|}}
{30001002|XXparameter|INDEX_FILE|$[if(string_index(OUTPUT_FILE ,".dat.gz"))
string_replace(OUTPUT_FILE, ".dat.gz", ".idx")
else
string_replace(OUTPUT_FILE, ".dat", ".idx")
]|3|9|K|Create name of index file from Output file |{0|}}
{30001002|XXparameter|CHECK_MULTIPLE_ICFF_DIR|$[if(is_blank(MULTIPLE_ICFF_SUB_DIR) and WRITE_MULTIPLE_ICFF) force_abort("If You want to create multiple ICFF , please provide subdirectory") else 0]|3|9|K|@{0|}}
{30001002|XXparameter|FIRST_FILE|$[first_without_error(INPUT_FILE_LOCATION + directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)[0]  , "NO_Matching_File" )]|3|9|K|A indicator first file to view data of file , In case of multiple file matching pattern only one file will be visible here|{0|}}
{30001002|XXparameter|XREF_FILE|file:$\{AI_SERIAL_LOOKUP\}/$\{MULTIPLE_ICFF_SUB_DIR\}/$\{CLEAN_OUT_FILE_FOR_NAME\}_xref.$KEY.$INDEX_FIELD.dat|3|9|K|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|XREF_DML|$[ begin
  let string("\\x01") keyName = $KEY;     // this can be a multi part key so need to change this to support that
  let string("\\x01") outDml = expand_type(read_type(OUTPUT_DML_FILE));
  let string("\\x01") xref_dml_key_fields = "record end";
  let string("\\x01") xref_dml_count_fields = "record end";

  for(let field in record_info(outDml))
    if(field.name == keyName or field.name == INDEX_FIELD)
    begin
      xref_dml_key_fields = add_fields(xref_dml_key_fields, [vector field]);
      xref_dml_count_fields = add_field(xref_dml_count_fields, field.name + "_count", "integer(4)", "0");
    end
  
  result :: join_types(xref_dml_key_fields, xref_dml_count_fields);
end ]|3|9|RK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|create_data_source_local|bfisher|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1666000|934000|5|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|1|1|}Job 'create_data_source' Execution Status Report


Job "create_data_source" Execution started at Friday, February 12, 2016 21:40:43
***** Job execution failed at Friday, February 12, 2016 21:42:15 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:01:31
Run performed by user Mukesh.Singh
Total data moved through all flows: 0 records (-1 bytes)
Total CPU time (all processes): 360 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@egv-dev-3.2.6||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@$[!is_blank(KEY) &&
 not USE_DEFAULT_PARTITION ]|434000|244000|0|0|0|0|11621|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@$[is_blank(KEY) && not 
USE_DEFAULT_PARTITION ]|449000|639000|0|0|0|0|11625|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Disabled input file component to view data of first file|16000|726000|36000|51000|315000|64000|11530|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@
Generic graph to create output data source for query it ,This
graph will create 3 type of output file based on input conditions specified:

1.MFS Output file
2.Single ICFF
3.Multiple ICFF 
4.In flow 3 itself , write Xref file along with Multiple ICFF file in specified subdirectory
|676000|16000|36000|51000|315000|64000|11715|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@Only one output flow will be enabled
 based on specified condition|968000|255000|36000|51000|315000|64000|11521|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|15|0|29|0|{@{}@Condition:
$[not CREATE_ICFF and  not WRITE_MULTIPLE_ICFF]|1334000|304000|0|0|0|0|11518|}}
{2010242002|XXGface|16|0|31|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|17|0|33|0|{@{}@condition:
$[CREATE_ICFF && not WRITE_MULTIPLE_ICFF ]|1329000|459000|0|0|0|0|11519|}}
{2010242002|XXGface|18|0|35|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|19|0|37|0|{@{}@condition:
$[CREATE_ICFF && WRITE_MULTIPLE_ICFF ]|1354000|689000|0|0|0|0|11520|}}
{2010242002|XXGface|20|0|39|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|21|0|41|0|{@{}@$AI_SERIAL_LOG : 
Count detail|1214000|884000|0|0|0|0|11144|}}
{2010242002|XXGface|22|0|43|0|{@{}@Arial|32768|110|0|}}
{2010240003|XXGlegend|23|0|45|0|{@{}@$[USE_DEFAULT_PARTITION ]|469000|431000|0|0|0|0|11628|}}
{2010242002|XXGface|24|0|47|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}11707|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}11659|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}11727|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}11719|529|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}11705|531|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}11700|529|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}11694|529|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{0|}11725|17|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.5|{0|}11708|17|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}11696|529|}}
{2010210004|XXGflow|35|0|69|0|{@{}@384|.5|.5|{0|}11722|17|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}11718|529|}}
{2010210004|XXGflow|37|0|73|0|{@{}@384|.5|.5|{0|}11721|17|}}
{2010210004|XXGflow|38|0|75|0|{@{}@384|.5|.5|{0|}11660|529|}}
{2010501005|XXGpvertex|39|0|77|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@739000|360000|0|0|0|0|11481|Dummy - Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|79|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|41|0|82|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|42|0|87|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|43|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|44|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|45|0|95|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@285000|131000|0|0|0|0|10649|ICFF Data|Ab Initio Software|@1|1000|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|46|0|97|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|47|0|99|0|{@{}@384|.5|.5|{0|}10648|2065|}}
{2010202004|XXGiport|48|0|101|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|49|0|103|0|{@{}@384|.5|.5|{0|}10651|17|}}
{2010503005|XXGfvertex|50|0|105|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|51|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|52|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|53|0|113|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@254000|10000|0|0|0|0|11441|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|54|0|115|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|55|0|117|0|{@{}@384|.5|.5|{0|}11440|17|}}
{2010203004|XXGoport|56|0|119|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|57|0|121|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|58|0|123|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|59|0|125|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|60|0|127|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|61|0|129|0|{@{}@384|.5|.5|{0|}11439|17|}}
{2010501005|XXGpvertex|62|0|134|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@421000|334500|0|0|0|0|2230|Read All Matching Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|63|0|136|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|64|0|138|0|{@{}@384|.5|.5|{0|}2229|1041|}}
{2010203004|XXGoport|65|0|140|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|66|0|142|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|67|0|144|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|68|0|146|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|69|0|148|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|70|0|150|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|71|0|152|0|{@{}@384|.5|.5|{0|}2228|18|}}
{2010501005|XXGpvertex|72|0|154|0|{|{}@0|@65000|424000|0|0|0|0|2220|List Files|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|73|0|156|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|74|0|158|0|{@{}@384|.5|.5|{0|}2219|17|}}
{2010203004|XXGoport|75|0|160|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|76|0|162|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|77|0|166|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@319000|360000|0|0|0|0|11542|Dummy- Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|78|0|168|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|79|0|173|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|80|0|176|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|81|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|82|0|181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|83|0|184|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|84|0|186|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010210004|XXGflow|85|0|188|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010202004|XXGiport|86|0|190|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|87|0|196|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1088000|359500|0|0|0|0|11488|Dummy Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|198|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|89|0|203|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|90|0|206|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|91|0|208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|92|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|93|0|217|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|DATA_SOURCE|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|@865000|671500|0|0|0|0|11706|Get Log|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|94|0|219|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|95|0|222|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|96|0|224|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|97|0|226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|98|0|229|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|99|0|232|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_group|DATA_SOURCE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|$DEFAULT_XFR|3|9||@{0|}}
{30001002|XXparameter|select|$FINAL_SELECT|3|9||@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@876000|330000|0|0|0|0|11723|Trim Strings|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|234|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|101|0|237|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|102|0|239|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|103|0|241|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|104|0|243|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|246|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|106|0|248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|107|0|252|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|108|0|255|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|109|0|258|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|110|0|261|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|111|0|269|0|{Subgraph created from graph "enrich"|{}@0|@991250|782250|0|0|0|0|11701|Get Record count|Mukesh.Singh|Created 8/21/2015 9:18:26 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|490000|163000|3|}}
{2010210004|XXGflow|112|0|271|0|{@{}@384|.5|.5|{0|}11110|17|}}
{2010243001|XXGwatcher|113|0|273|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|114|0|275|0|{@{}@384|.5|.5|{0|}11104|17|}}
{2010243001|XXGwatcher|115|0|277|0|{@{}@1|100|0||0|}}
{2010501005|XXGpvertex|116|0|279|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
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
}}@0|@337000|36000|0|0|0|0|11111|Count -Local|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|117|0|281|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|118|0|283|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|119|0|285|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|120|0|287|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|121|0|289|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|122|0|292|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|123|0|294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|124|0|297|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|125|0|300|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|126|0|303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|127|0|306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|128|0|309|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/audit_count_computed_source.dml|3|2|f$|@{0|}}
}}@0|@1230000|811500|0|0|0|0|11633|Output File|Ab Initio Software|@1|1000|0|@6||33025|-1|-1|}}
{2010202004|XXGiport|129|0|311|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|130|0|314|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|131|0|316|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|132|0|319|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
out.src_info :: "CREATE_DATASET";
out.run_dttm :: current_time;
out.record_count :: string_filter( string_split(in.event_text,"(")[0],"0123456789");
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select|string_lrtrim(event_type)=="finish"|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@171000|42500|0|0|0|0|11105|Parse Log|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|133|0|321|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|134|0|324|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|135|0|326|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|136|0|328|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|137|0|330|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|138|0|333|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|139|0|335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|140|0|339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|141|0|342|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|142|0|345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|143|0|348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|144|0|356|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@52000|65000|0|0|0|0|11081|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|145|0|358|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|146|0|361|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|147|0|363|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|148|0|365|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|149|0|368|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010203004|XXGoport|150|0|375|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|151|0|379|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|152|0|383|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[CREATE_ICFF && not WRITE_MULTIPLE_ICFF ]|3|9|F||{0|}}
}}@0|@1420500|347500|0|0|0|0|11697|ICFF Output|Mukesh.Singh|Created 7/28/2015 6:06:47 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|564000|372000|3|}}
{2010210004|XXGflow|153|0|386|0|{@{}@384|.5|.5|{0|}10652|17|}}
{2010503005|XXGfvertex|154|0|390|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@290000|246000|0|0|0|0|10633|ICFF Index|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|155|0|392|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|156|0|395|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|157|0|397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|158|0|400|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$KEY|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|block_size|104857|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@70000|120000|0|0|0|0|10653|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|159|0|402|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|160|0|405|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|161|0|408|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|162|0|410|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|163|0|412|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|164|0|414|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|165|0|417|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|166|0|420|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|167|0|423|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|168|0|429|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@427000|110500|0|0|0|0|10622|To Enable View Data|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32833|1|{1|0|}}}
{2010202004|XXGiport|169|0|431|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|170|0|434|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|171|0|436|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|172|0|441|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010503005|XXGfvertex|173|0|445|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FIRST_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$FIRST_FILE|3|2|$|@{0|}}
}}@0|@115000|658500|0|0|0|0|11724|Input File|Ab Initio Software|@1|100|-1|@6||33089|-1|-1|}}
{2010203004|XXGoport|174|0|447|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|175|0|449|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|176|0|451|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|177|0|454|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_DEFAULT_PARTITION ]|3|9|F||{0|}}
}}@0|@449000|315500|0|0|0|0|11720|No-Sort-No-Partition|bfisher|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|137000|134000|7|}}
{2010501005|XXGpvertex|178|0|456|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@52000|63000|0|0|0|0|11589|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|179|0|458|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|180|0|460|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|181|0|462|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|182|0|464|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|183|0|467|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|184|0|473|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|185|0|477|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|186|0|481|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||7|9|Fs||{0|}}
{30001002|XXparameter|condition|$[not CREATE_ICFF and  not WRITE_MULTIPLE_ICFF]|3|9|F||{0|}}
}}@0|@1411000|179000|0|0|0|0|11695|Non-ICFF Outputs|Mukesh.Singh|Created 7/28/2015 6:06:53 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|655000|392000|3|}}
{2010240003|XXGlegend|187|0|483|0|{@{}@Always disabled|-1050000|-159000|0|0|0|0|10538|}}
{2010242002|XXGface|188|0|485|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|189|0|487|0|{@{}@Condition:
$[not is_blank(KEY)]|-1050000|-159000|0|0|0|0|10560|}}
{2010242002|XXGface|190|0|489|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|191|0|491|0|{@{}@Always disabled|-1050000|-159000|0|0|0|0|10592|}}
{2010242002|XXGface|192|0|493|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|193|0|495|0|{@{}@Condition:
$[is_blank(KEY)]|-1050000|-159000|0|0|0|0|10595|}}
{2010242002|XXGface|194|0|497|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|195|0|499|0|{@{}@384|.5|.5|{0|}10586|1041|}}
{2010210004|XXGflow|196|0|501|0|{@{}@384|.5|.5|{0|}10607|17|}}
{2010210004|XXGflow|197|0|503|0|{@{}@384|.5|.5|{0|}10597|17|}}
{2010210004|XXGflow|198|0|505|0|{@{}@384|.5|.5|{0|}10604|17|}}
{2010210004|XXGflow|199|0|507|0|{@{}@384|.5|.5|{0|}10602|17|}}
{2010210004|XXGflow|200|0|509|0|{@{}@384|.5|.5|{0|}10603|1041|}}
{2010501005|XXGpvertex|201|0|511|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@387000|107500|0|0|0|0|10587|Dummy Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|202|0|513|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|203|0|516|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|204|0|520|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|205|0|522|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|206|0|525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|207|0|528|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$OUTPUT_DML_FILE|3|2|f$|@{0|}}
}}@0|@534000|101000|0|0|0|0|10608|Extracted File|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|208|0|530|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|209|0|533|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|210|0|535|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|211|0|540|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@59000|111000|0|0|0|0|10598|Dummy Replicate 1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|212|0|542|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|213|0|546|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|214|0|548|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|215|0|550|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|216|0|553|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|217|0|556|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INDEX_FILE|3|2|$|@{0|}}
}}@0|@538000|231000|0|0|0|0|10590|Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|218|0|558|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|219|0|561|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|220|0|563|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|221|0|566|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key0|$\{KEY\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@203000|201000|0|0|0|0|10605|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|222|0|568|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|223|0|571|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|224|0|574|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|225|0|577|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{2010203004|XXGoport|226|0|579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|227|0|582|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|228|0|586|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|229|0|594|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[is_blank(KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@233000|104500|0|0|0|0|10585|Dummy Replicate 2|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|230|0|596|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|231|0|599|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|232|0|602|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|233|0|604|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|234|0|607|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|235|0|616|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|236|0|622|0|{Subgraph created from graph "unload_lookup"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[is_blank(KEY) && not USE_DEFAULT_PARTITION ]|3|9|F||{0|}}
}}@0|@469500|544000|0|0|0|0|11661|PBRR|Mukesh.Singh|Created 6/9/2015 5:59:58 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|326000|160000|3|}}
{2010210004|XXGflow|237|0|624|0|{@{}@384|.5|.5|{0|}9947|20|}}
{2010501005|XXGpvertex|238|0|626|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@225000|83000|0|0|0|0|9942|Gather|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|239|0|628|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|240|0|630|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|241|0|633|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|242|0|635|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|243|0|638|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|244|0|644|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@80000|83000|0|0|0|0|9948|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|245|0|646|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|246|0|649|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|247|0|651|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|248|0|653|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|249|0|656|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|250|0|662|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|251|0|666|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|252|0|670|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[!is_blank(KEY) && not USE_DEFAULT_PARTITION ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|=|@{0|}}
{30001002|XXparameter|InputLayout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
}}@0|@447000|137000|0|0|481000|303000|11709|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010501005|XXGpvertex|253|0|674|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|254|0|676|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|255|0|678|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|256|0|683|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|257|0|687|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|258|0|691|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|259|0|693|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|260|0|695|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|261|0|697|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|262|0|700|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|263|0|702|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|264|0|704|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|265|0|707|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|266|0|712|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|267|0|714|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|268|0|716|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|269|0|719|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|270|0|721|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|271|0|724|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|272|0|730|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|273|0|733|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|274|0|737|0|{Subgraph created from graph "enrich"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|/app01/abinitio/sand/msingh/datahub/components/read_files_by_pattern.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION|$INPUT_FILE_LOCATION|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|$INPUT_FILE_PATTERN|3|9||@{0|}}
}}@0|@101000|339000|0|0|0|0|11728|Read File(s)||@1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|857000|1343000|1|}}
{2010240003|XXGlegend|275|0|739|0|{@{}@Expand the list of files
based on the provided
pattern|16000|333500|0|0|0|0|2211|}}
{2010242002|XXGface|276|0|741|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|277|0|743|0|{@{}@Skips header records
from each file|426000|393500|0|0|0|0|2218|}}
{2010242002|XXGface|278|0|745|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|279|0|747|0|{@{}@[ Always disabled ]|144000|461000|0|0|0|0|2215|}}
{2010242002|XXGface|280|0|749|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|281|0|751|0|{@{}@[ Always disabled ]|679000|451000|0|0|0|0|2216|}}
{2010242002|XXGface|282|0|753|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|283|0|755|0|{@{}@[ These components run in case the input is MFS ]|349000|641000|0|0|0|0|2217|}}
{2010242002|XXGface|284|0|757|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|285|0|759|0|{@{}@[ This component runs in
case the input is serial ]|429000|271000|0|0|0|0|2212|}}
{2010242002|XXGface|286|0|761|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|287|0|763|0|{@{}@Reads multi- or serial files by pattern. Output flow
is in the same layout as the source files.

The log and error files are created with names derived
from the calling graph name and the file pattern.

Author: Anwar.Parvez\@catamaranrx.com (Exusia)|10000|64000|0|0|0|0|2199|}}
{2010242002|XXGface|288|0|765|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|289|0|768|0|{@{}@384|.5|.5|{0|}2205|1043|}}
{2010210004|XXGflow|290|0|770|0|{@{}@384|.5|.5|{0|}2232|531|}}
{2010210004|XXGflow|291|0|772|0|{@{}@384|.5|.5|{0|}2221|17|}}
{2010210004|XXGflow|292|0|776|0|{@{}@384|.5|.5|{0|}2224|1041|}}
{2010210004|XXGflow|293|0|778|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}2223|530|}}
{2010210004|XXGflow|294|0|780|0|{@{}@384|.5|.5|{0|}2207|17|}}
{2010210004|XXGflow|295|0|782|0|{@{}@384|.5|.5|{0|}2209|17|}}
{2010210004|XXGflow|296|0|784|0|{@{}@384|.5|.5|{0|}2202|17|}}
{2010501005|XXGpvertex|297|0|786|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@355000|537500|723000|204000|54000|41000|2222|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|298|0|788|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|299|0|791|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|300|0|797|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@264000|908000|0|0|0|0|2203|Collect Read Errors MFS|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|301|0|799|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|302|0|801|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|303|0|804|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|304|0|806|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|305|0|808|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@266000|1089500|0|0|0|0|2201|Read Errors MFS|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|306|0|810|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|307|0|816|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@124000|908000|0|0|0|0|2200|Collect Read Errors - Serial|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|308|0|818|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|309|0|820|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|310|0|823|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|311|0|825|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|312|0|827|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@126000|1089500|0|0|0|0|2210|Read Errors Serial|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|313|0|829|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|314|0|835|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
}}@0|@472000|909000|0|0|0|0|2204|Collect Read File(s) Log|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|315|0|837|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|316|0|840|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|317|0|843|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@504000|1109000|0|0|0|0|2206|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|318|0|845|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|319|0|848|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|320|0|851|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@491000|1200500|0|0|0|0|2208|Read File(s) Log|Ab Initio Software|@1|1000|-1|@6||164225|-1|-1|}}
{2010202004|XXGiport|321|0|853|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|322|0|859|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@752000|439500|0|0|0|0|2214|Dummy Concat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|323|0|861|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|324|0|863|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|325|0|870|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@224000|439500|0|0|0|0|2213|Dummy Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|326|0|872|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|327|0|877|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|328|0|883|0|{Subgraph created from graph "read_files_by_pattern"|{}@0|@242000|664750|0|0|0|0|2233|Log the List of Files|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|189000|283000|3|}}
{2010210004|XXGflow|329|0|885|0|{@{}@384|.5|.5|{0|}2200|17|}}
{2010501005|XXGpvertex|330|0|887|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@40000|30000|0|0|0|0|2198|Build Full Path|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|331|0|889|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|332|0|892|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|333|0|894|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|334|0|896|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|335|0|898|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|336|0|900|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@52000|168500|0|0|0|0|2201|File List|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|337|0|902|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|338|0|910|0|{@{}@0|0|0|0|in0|.5|@@@12816|0|}}
{2010501005|XXGpvertex|339|0|915|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@476000|510500|0|0|0|0|2225|Read All Matching Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|340|0|917|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|341|0|920|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|342|0|922|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|343|0|924|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|344|0|926|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|345|0|928|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|346|0|930|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|347|0|939|0|{@{}@0|0|0|0|out0|.4744094488188976|@@@14352|0|}}
{2010600005|XXGgraph|348|0|943|0|{Subgraph created from graph "enrich"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_FILE_LOCATION||3|9|RFK|Directory where files are to be read from|{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN||3|9|RFK|Name of a single file, or pattern for reading multiple files|{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|IS_MFS|AB_PARAMETER_ENV|13|10|RKd|@{0|}}
{30001002|XXparameter|LOG_ERROR_NAME_SEED|$AB_PSET_NAME.$[string_filter_out(INPUT_FILE_PATTERN, "*?")]|3|9|RK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|IS_MFS:eme|False|3|9||@{0|}}
{30001002|XXparameter|IS_MFS:sandbox|$[file_information(INPUT_FILE_LOCATION + "/.mdir").found]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC:eme|$[[vector ""]]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC:sandbox|$[directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)]|3|9||@{0|}}
{30001002|XXparameter|UNIQUE_ID|$EXTERNAL_RUN_ID|3|9|FK||{0|}}
{30001002|XXparameter|PROCESSED_LIST_LOG_FILENAME|$\{AB_PSET_NAME\}.$[if(is_blank(UNIQUE_ID)) "" else UNIQUE_ID + "."]fileList.log|3|9|RK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1449602633|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@112500|291250|0|0|0|0|193|Read File(s)||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|857000|1343000|3|}}
{2010240003|XXGlegend|349|0|945|0|{@{}@Expand the list of files
based on the provided
pattern|16000|333500|0|0|0|0|2211|}}
{2010242002|XXGface|350|0|947|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|351|0|949|0|{@{}@Skips header records
from each file|426000|393500|0|0|0|0|2218|}}
{2010242002|XXGface|352|0|951|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|353|0|953|0|{@{}@[ Always disabled ]|144000|461000|0|0|0|0|2215|}}
{2010242002|XXGface|354|0|955|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|355|0|957|0|{@{}@[ Always disabled ]|679000|451000|0|0|0|0|2216|}}
{2010242002|XXGface|356|0|959|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|357|0|961|0|{@{}@[ These components run in case the input is MFS ]|349000|641000|0|0|0|0|2217|}}
{2010242002|XXGface|358|0|963|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|359|0|965|0|{@{}@[ This component runs in
case the input is serial ]|429000|271000|0|0|0|0|2212|}}
{2010242002|XXGface|360|0|967|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|361|0|969|0|{@{}@Reads multi- or serial files by pattern. Output flow
is in the same layout as the source files.

The log and error files are created with names derived
from the calling graph name and the file pattern.

Author: Anwar.Parvez\@catamaranrx.com (Exusia)|10000|64000|0|0|0|0|2199|}}
{2010242002|XXGface|362|0|971|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|363|0|973|0|{@{}@384|.5|.5|{0|}2219|17|}}
{2010210004|XXGflow|364|0|975|0|{@{}@384|.5|.5|{0|}2205|1043|}}
{2010210004|XXGflow|365|0|977|0|{@{}@384|.5|.5|{0|}2232|531|}}
{2010210004|XXGflow|366|0|979|0|{@{}@384|.5|.5|{0|}2221|17|}}
{2010210004|XXGflow|367|0|981|0|{@{}@384|.5|.5|{0|}2228|18|}}
{2010210004|XXGflow|368|0|983|0|{@{}@384|.5|.5|{0|}2229|1041|}}
{2010210004|XXGflow|369|0|985|0|{@{}@384|.5|.5|{0|}2224|1041|}}
{2010210004|XXGflow|370|0|987|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}2223|530|}}
{2010210004|XXGflow|371|0|989|0|{@{}@384|.5|.5|{0|}2207|17|}}
{2010210004|XXGflow|372|0|991|0|{@{}@384|.5|.5|{0|}2209|17|}}
{2010210004|XXGflow|373|0|993|0|{@{}@384|.5|.5|{0|}2202|17|}}
{2010501005|XXGpvertex|374|0|995|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@355000|537500|723000|204000|54000|41000|2222|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|375|0|997|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|376|0|1000|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|377|0|1003|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|378|0|1005|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|379|0|1008|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|380|0|1011|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_MFS|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
}}@0|@264000|908000|0|0|0|0|2203|Collect Read Errors MFS|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|381|0|1013|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|382|0|1015|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|383|0|1018|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|384|0|1020|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|385|0|1022|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
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
{2010203004|XXGoport|386|0|1024|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|387|0|1027|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|388|0|1030|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|389|0|1033|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|390|0|1036|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
}}@0|@124000|908000|0|0|0|0|2200|Collect Read Errors - Serial|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|391|0|1038|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|392|0|1040|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|393|0|1043|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|394|0|1045|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|395|0|1047|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
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
{2010203004|XXGoport|396|0|1049|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|397|0|1052|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|398|0|1055|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|399|0|1058|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|400|0|1061|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_group|READ_FILES_LOG_GROUP|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
}}@0|@472000|909000|0|0|0|0|2204|Collect Read File(s) Log|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|401|0|1063|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|402|0|1066|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|403|0|1068|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|404|0|1070|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|405|0|1073|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|406|0|1076|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
}}@0|@504000|1109000|0|0|0|0|2206|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|407|0|1078|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|408|0|1081|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|409|0|1084|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|410|0|1086|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|411|0|1089|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|412|0|1092|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
}}@0|@752000|439500|0|0|0|0|2214|Dummy Concat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|413|0|1094|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|414|0|1096|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|415|0|1100|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|416|0|1102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|417|0|1105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|418|0|1108|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|@224000|439500|0|0|0|0|2213|Dummy Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|419|0|1110|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|420|0|1115|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|421|0|1118|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|422|0|1120|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|423|0|1123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|424|0|1126|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
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
{2010203004|XXGoport|425|0|1128|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|426|0|1131|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|427|0|1133|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|428|0|1135|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|429|0|1137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|430|0|1140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|431|0|1143|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|432|0|1147|0|{Subgraph created from graph "read_files_by_pattern"|{}@0|@242000|664750|0|0|0|0|2233|Log the List of Files|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|189000|283000|3|}}
{2010210004|XXGflow|433|0|1149|0|{@{}@384|.5|.5|{0|}2200|17|}}
{2010501005|XXGpvertex|434|0|1151|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|out::reformat(in)=
begin
  out.file :: $"INPUT_FILE_LOCATION" + in.file;
end;|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
}}@0|@40000|30000|0|0|0|0|2198|Build Full Path|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|435|0|1153|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|436|0|1156|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|437|0|1158|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|438|0|1160|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|439|0|1162|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|440|0|1164|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|441|0|1166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|442|0|1170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|443|0|1173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|444|0|1176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|445|0|1179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|446|0|1182|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$\{PROCESSED_LIST_LOG_FILENAME\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/$\{PROCESSED_LIST_LOG_FILENAME\}|3|2|$|@{0|}}
}}@0|@52000|168500|0|0|0|0|2201|File List|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|447|0|1184|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|448|0|1187|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|449|0|1189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|450|0|1192|0|{@{}@0|0|0|0|in0|.5|@@@12816|0|}}
{2010501005|XXGpvertex|451|0|1196|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
}}@0|@421000|334500|0|0|0|0|2230|Read All Matching Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|452|0|1198|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|453|0|1201|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|454|0|1203|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|455|0|1205|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|456|0|1207|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|457|0|1209|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|458|0|1211|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|459|0|1214|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|460|0|1216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|461|0|1219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|462|0|1222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|463|0|1225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|464|0|1228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|465|0|1231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|466|0|1234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|467|0|1237|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
}}@0|@476000|510500|0|0|0|0|2225|Read All Matching Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|468|0|1239|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|469|0|1242|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|470|0|1244|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|471|0|1246|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|472|0|1248|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|473|0|1250|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|474|0|1252|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|475|0|1255|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|476|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|477|0|1260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|478|0|1263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|479|0|1266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|480|0|1269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|481|0|1272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|482|0|1275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|483|0|1278|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
}}@0|@266000|1089500|0|0|0|0|2201|Read Errors MFS|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|484|0|1280|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|485|0|1283|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|486|0|1285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|487|0|1288|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
}}@0|@126000|1089500|0|0|0|0|2210|Read Errors Serial|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|488|0|1290|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|489|0|1293|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|490|0|1295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|491|0|1298|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log|3|2|$|@{0|}}
}}@0|@491000|1200500|0|0|0|0|2208|Read File(s) Log|Ab Initio Software|@1|1000|-1|@6||164225|-1|-1|}}
{2010202004|XXGiport|492|0|1300|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|493|0|1303|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|494|0|1305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010203004|XXGoport|495|0|1308|0|{@{}@0|0|0|0|out0|.4744094488188976|@@@14352|0|}}
{2010600005|XXGgraph|496|0|1312|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@100000|75000|0|0|0|0|11627|Version Log|Mukesh.singh|Created 8/21/2015 9:17:18 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|731000|533000|3|}}
{2010240003|XXGlegend|497|0|1314|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|498|0|1316|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|499|0|1318|0|{@{}@Author|197000|66000|0|0|0|0|25|}}
{2010242002|XXGface|500|0|1320|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|501|0|1322|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|502|0|1324|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|503|0|1326|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|504|0|1328|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|505|0|1330|0|{@{}@1.0|17000|88000|0|0|0|0|14|}}
{2010242002|XXGface|506|0|1332|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|507|0|1334|0|{@{}@Jun 15 2015|82000|88000|0|0|0|0|34|}}
{2010242002|XXGface|508|0|1336|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|509|0|1338|0|{@{}@Mukesh Singh (Exusia)|192000|88000|0|0|0|0|36|}}
{2010242002|XXGface|510|0|1340|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|511|0|1342|0|{@{}@This Graph was created as part of Cogs Jun 
30 ,2015 Project and later was made as common
 graph to be used across multiple project . 
|412000|83000|0|0|0|0|29|}}
{2010242002|XXGface|512|0|1344|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|513|0|1346|0|{@{}@1.0.1|17000|178000|0|0|0|0|40|}}
{2010242002|XXGface|514|0|1348|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|515|0|1350|0|{@{}@June 25 2015|82000|178000|0|0|0|0|91|}}
{2010242002|XXGface|516|0|1352|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|517|0|1354|0|{@{}@Anwar Parvez (exusia)|192000|178000|0|0|0|0|92|}}
{2010242002|XXGface|518|0|1356|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|519|0|1358|0|{@{}@Added ICCF flow(2) to write ICFF in append mode|412000|178000|0|0|0|0|93|}}
{2010242002|XXGface|520|0|1360|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|521|0|1362|0|{@{}@July 10 2015|82000|213000|0|0|0|0|88|}}
{2010242002|XXGface|522|0|1364|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|523|0|1366|0|{@{}@Mukesh Singh (exusia)|192000|213000|0|0|0|0|89|}}
{2010242002|XXGface|524|0|1368|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|525|0|1370|0|{@{}@Added Compute and write multiple ICFF flow (3)|412000|213000|0|0|0|0|94|}}
{2010242002|XXGface|526|0|1372|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|527|0|1374|0|{@{}@1.0.2|17000|213000|0|0|0|0|95|}}
{2010242002|XXGface|528|0|1376|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|529|0|1378|0|{@{}@1.0.4|17000|303000|0|0|0|0|97|}}
{2010242002|XXGface|530|0|1380|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|531|0|1382|0|{@{}@Aug 17 2015|82000|303000|0|0|0|0|86|}}
{2010242002|XXGface|532|0|1384|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|533|0|1386|0|{@{}@Anwar Parvez (exusia)|192000|303000|0|0|0|0|80|}}
{2010242002|XXGface|534|0|1388|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|535|0|1390|0|{@{}@Added Logic to compute X-ref count|412000|303000|0|0|0|0|78|}}
{2010242002|XXGface|536|0|1392|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|537|0|1394|0|{@{}@1.0.5|17000|343000|0|0|0|0|105|}}
{2010242002|XXGface|538|0|1396|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|539|0|1398|0|{@{}@Aug 20 2015|82000|343000|0|0|0|0|107|}}
{2010242002|XXGface|540|0|1400|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|541|0|1402|0|{@{}@Mukesh Singh (exusia)|192000|343000|0|0|0|0|109|}}
{2010242002|XXGface|542|0|1404|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|543|0|1406|0|{@{}@Added Handle Log to Compute record count|412000|343000|0|0|0|0|111|}}
{2010242002|XXGface|544|0|1408|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|545|0|1410|0|{@{}@1.0.3|17000|258000|0|0|0|0|96|}}
{2010242002|XXGface|546|0|1412|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|547|0|1414|0|{@{}@Added Intermediate pset parameters and re-organized pset|412000|258000|0|0|0|0|83|}}
{2010242002|XXGface|548|0|1416|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|549|0|1418|0|{@{}@Aug 12 2015|82000|258000|0|0|0|0|85|}}
{2010242002|XXGface|550|0|1420|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|551|0|1422|0|{@{}@Mukesh Singh (exusia)|192000|258000|0|0|0|0|84|}}
{2010242002|XXGface|552|0|1424|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|553|0|1426|0|{@{}@1.0.6|17000|378000|0|0|0|0|121|}}
{2010242002|XXGface|554|0|1428|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|555|0|1430|0|{@{}@Oct 02, 2015|82000|378000|0|0|0|0|116|}}
{2010242002|XXGface|556|0|1432|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|557|0|1434|0|{@{}@Mukesh Singh (exusia)|192000|378000|0|0|0|0|118|}}
{2010242002|XXGface|558|0|1436|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|559|0|1438|0|{@{}@Added an additional flow in write multiple ICFF file to 
create reduced , alternate dataset|412000|383000|0|0|0|0|119|}}
{2010242002|XXGface|560|0|1440|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|561|0|1442|0|{@{}@1.0.7|22000|448000|0|0|0|0|122|}}
{2010242002|XXGface|562|0|1444|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|563|0|1446|0|{@{}@Oct 07, 2015|97000|443000|0|0|0|0|123|}}
{2010242002|XXGface|564|0|1448|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|565|0|1450|0|{@{}@Mukesh Singh (exusia)|187000|438000|0|0|0|0|124|}}
{2010242002|XXGface|566|0|1452|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|567|0|1454|0|{@{}@Added a flow for No-Sort, No repartition|407000|423000|0|0|0|0|125|}}
{2010242002|XXGface|568|0|1456|0|{@{}@Arial Narrow|0|100|0|}}
{2010600005|XXGgraph|569|0|1458|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DATAHUB_COMPONENTS/write_daily_icff_and_xref.mp|3|9|Pf|@{0|}}
}}@0|@1418000|542250|0|0|0|0|11726|Write Daily ICFFs and Xref|||1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1410000|1907000|1|}}
{2010240003|XXGlegend|570|0|1460|0|{@{}@Condition:
not is_blank(INDEX_FIELD)|543000|209000|0|0|0|0|11044|}}
{2010242002|XXGface|571|0|1462|0|{@{}@Arial|8421504|120|0|}}
{2010240003|XXGlegend|572|0|1464|0|{@{}@______________________________ Create Alternate reduced dataset   ______________________________|201000|528000|0|0|0|0|11390|}}
{2010242002|XXGface|573|0|1466|0|{@{}@Arial|8421504|120|0|}}
{2010210004|XXGflow|574|0|1469|0|{@{}@384|.5|.5|{0|}11393|17|}}
{2010210004|XXGflow|575|0|1471|0|{@{}@384|.5|.5|{0|}11437|17|}}
{2010210004|XXGflow|576|0|1473|0|{@{}@384|.5|.5|{0|}11434|17|}}
{2010600005|XXGgraph|577|0|1477|0|{Subgraph created from graph "Write Daily ICFFs and Xref"|{}@0|@532000|615000|0|0|0|0|11438|Create Reduced Aleternate Data Source|Mukesh.Singh|Created 10/2/2015 9:42:25 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|907000|1019000|3|}}
{2010210004|XXGflow|578|0|1479|0|{@{}@384|.5|.5|{0|}11436|17|}}
{2010210004|XXGflow|579|0|1481|0|{@{}@384|.5|.5|{0|}11441|529|}}
{2010210004|XXGflow|580|0|1483|0|{@{}@384|.5|.5|{0|}11439|17|}}
{2010600005|XXGgraph|581|0|1485|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|62500|0|0|0|0|11442|Create Main Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|582|0|1487|0|{@{}@384|.5|.5|{0|}11410|17|}}
{2010210004|XXGflow|583|0|1489|0|{@{}@384|.5|.5|{0|}11411|17|}}
{2010501005|XXGpvertex|584|0|1491|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@283000|22000|0|0|0|0|11412|Compute Multiple Block-Compressed Lookups-1|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|585|0|1493|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|586|0|1496|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|587|0|1498|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|588|0|1500|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|589|0|1502|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|590|0|1504|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|591|0|1509|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@45000|45000|0|0|0|0|11408|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|592|0|1511|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|593|0|1514|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|594|0|1516|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|595|0|1518|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|596|0|1520|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|597|0|1526|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@638000|47000|0|0|0|0|11389|Write Multiple Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|598|0|1528|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|599|0|1530|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|600|0|1532|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|601|0|1534|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|602|0|1540|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|603|0|1544|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|242500|0|0|0|0|11437|Create Step2 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|604|0|1546|0|{@{}@384|.5|.5|{0|}11416|17|}}
{2010210004|XXGflow|605|0|1548|0|{@{}@384|.5|.5|{0|}11413|17|}}
{2010501005|XXGpvertex|606|0|1550|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@283000|22000|0|0|0|0|11414|Compute Multiple Block-Compressed Lookups-1|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|607|0|1552|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|608|0|1555|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|609|0|1557|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|610|0|1559|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|611|0|1561|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|612|0|1563|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|613|0|1567|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@45000|45000|0|0|0|0|11417|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|614|0|1569|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|615|0|1572|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|616|0|1574|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|617|0|1576|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|618|0|1578|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|619|0|1583|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@638000|47000|0|0|0|0|11407|Write Multiple Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|620|0|1585|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|621|0|1587|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|622|0|1589|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|623|0|1591|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|624|0|1597|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|625|0|1601|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|422500|0|0|0|0|11440|Create Step3 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|626|0|1603|0|{@{}@384|.5|.5|{0|}11426|17|}}
{2010210004|XXGflow|627|0|1605|0|{@{}@384|.5|.5|{0|}11423|17|}}
{2010501005|XXGpvertex|628|0|1607|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@283000|22000|0|0|0|0|11424|Compute Multiple Block-Compressed Lookups-1|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|629|0|1609|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|630|0|1612|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|631|0|1614|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|632|0|1616|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|633|0|1618|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|634|0|1620|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|635|0|1624|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@45000|45000|0|0|0|0|11427|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|636|0|1626|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|637|0|1629|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|638|0|1631|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|639|0|1633|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|640|0|1635|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|641|0|1641|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@638000|47000|0|0|0|0|11405|Write Multiple Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|642|0|1643|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|643|0|1645|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|644|0|1647|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|645|0|1649|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|646|0|1655|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010501005|XXGpvertex|647|0|1659|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@83000|195000|0|0|0|0|11390|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|648|0|1661|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|649|0|1666|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|650|0|1671|0|{@{}@0|0|0|0|in0|.514792899408284|@@@13840|0|}}
{2010501005|XXGpvertex|651|0|1675|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@78000|213500|0|0|0|0|11362|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|652|0|1677|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|653|0|1682|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|654|0|1687|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@272000|280000|0|0|0|0|11395|Sort on INDEX_FIELD|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|655|0|1689|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|656|0|1692|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|657|0|1698|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@546000|253000|0|0|0|0|11435|Write Date-wise ICFFs for additional index|Ab Initio Software|Built-in 2.14.97:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|658|0|1700|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|659|0|1702|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|660|0|1704|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|661|0|1706|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|662|0|1708|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|663|0|1714|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@574000|27000|0|0|0|0|11411|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|664|0|1716|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|665|0|1718|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|666|0|1720|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|667|0|1722|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|668|0|1728|0|{@{}@0|0|0|0|in0|.4911894273127753|@@@13840|0|}}
{2010600005|XXGgraph|669|0|1732|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[CREATE_ICFF && WRITE_MULTIPLE_ICFF ]|3|9|F||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|KEY|$KEY|3|9|RFK|@{0|}}
{30001002|XXparameter|INDEX_KEY|$ICFF_KEY|3|9|RFK|@{0|}}
{30001002|XXparameter|CREATE_REDUCED_DATASET|$CREATE_REDUCED_DATASET|3|9|RFK|@{0|}}
{30001002|XXparameter|USE_STEP2_REDUCTION|$USE_STEP2_REDUCTION|3|9|RFK|@{0|}}
{30001002|XXparameter|USE_STEP3_REDUCTION|$USE_STEP3_REDUCTION|3|9|RFK|@{0|}}
{30001002|XXparameter|mpcmodtime|1464712175|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@1418000|542250|0|0|0|0|11713|Write Daily ICFFs and Xref|||1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1410000|1907000|3|}}
{2010240003|XXGlegend|670|0|1734|0|{@{}@Condition:
not is_blank(INDEX_FIELD)|543000|209000|0|0|0|0|11044|}}
{2010242002|XXGface|671|0|1736|0|{@{}@Arial|8421504|120|0|}}
{2010240003|XXGlegend|672|0|1738|0|{@{}@______________________________ Create Alternate reduced dataset   ______________________________|201000|528000|0|0|0|0|11390|}}
{2010242002|XXGface|673|0|1740|0|{@{}@Arial|8421504|120|0|}}
{2010210004|XXGflow|674|0|1742|0|{@{}@384|.5|.5|{0|}11422|17|}}
{2010210004|XXGflow|675|0|1744|0|{@{}@384|.5|.5|{0|}11393|17|}}
{2010210004|XXGflow|676|0|1746|0|{@{}@384|.5|.5|{0|}11429|17|}}
{2010210004|XXGflow|677|0|1748|0|{@{}@384|.5|.5|{0|}11394|17|}}
{2010210004|XXGflow|678|0|1750|0|{@{}@384|.5|.5|{0|}11423|17|}}
{2010501005|XXGpvertex|679|0|1752|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|$INDEX_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*extract filename from input record*/
filename::get_filename(in)=
begin
let string(",") key_name = in.$\{KEY\};
        filename:: "mfile:$\{AI_MFS\}/$\{MULTIPLE_ICFF_SUB_DIR\}/$\{CLEAN_OUT_FILE_FOR_NAME\}_" + key_name + ".dat.gz";
end;

/* This function is optional. */
/*extract index filename from data filename*/
indexname::get_indexname(filename)=
begin
indexname ::            if(string_index(filename ,".dat.gz"))
                                string_replace(filename, ".dat.gz", ".idx")
                        else
                                string_replace(filename, ".dat", ".idx");
end;

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$OUTPUT_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@254000|10000|0|0|0|0|11424|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|680|0|1754|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|681|0|1757|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|682|0|1759|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|683|0|1761|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|684|0|1763|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|685|0|1765|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|686|0|1768|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key write|3|2|$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If True, allow continuous-flow operation. If False, allow batch-mode operation|{0|}}
{30001002|XXparameter|grouped|False|13|1|FKl|If True, each output file is closed before a new file is opened.|{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
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
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
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
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|4|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type3|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type4|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata|record string('') filename; void(integer(4)) data; end|7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|687|0|1770|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|688|0|1773|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|689|0|1776|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|690|0|1779|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|691|0|1782|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|692|0|1785|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|693|0|1788|0|{Subgraph created from graph "Write Daily ICFFs and Xref"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[CREATE_REDUCED_DATASET =="Y" ]|3|9|F||{0|}}
}}@0|@532000|615000|0|0|0|0|11430|Create Reduced Aleternate Data Source|Mukesh.Singh|Created 10/2/2015 9:42:25 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|907000|1019000|3|}}
{2010210004|XXGflow|694|0|1790|0|{@{}@384|.5|.5|{0|}11428|17|}}
{2010210004|XXGflow|695|0|1792|0|{@{}@384|.5|.5|{0|}11433|529|}}
{2010210004|XXGflow|696|0|1794|0|{@{}@384|.5|.5|{0|}11430|17|}}
{2010600005|XXGgraph|697|0|1796|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|62500|0|0|0|0|11434|Create Main Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|698|0|1798|0|{@{}@384|.5|.5|{0|}11407|17|}}
{2010210004|XXGflow|699|0|1800|0|{@{}@384|.5|.5|{0|}11404|17|}}
{2010501005|XXGpvertex|700|0|1802|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|$INDEX_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*extract filename from input record*/
filename::get_filename(in)=
begin
let string(",") key_name = in.$\{KEY\};
        filename:: "mfile:$\{AI_MFS\}/$\{MULTIPLE_ICFF_SUB_DIR\}_reduced/$\{CLEAN_OUT_FILE_FOR_NAME\}_" + key_name + ".dat.gz";
end;

/* This function is optional. */
/*extract index filename from data filename*/
indexname::get_indexname(filename)=
begin
indexname ::            if(string_index(filename ,".dat.gz"))
                                string_replace(filename, ".dat.gz", ".idx")
                        else
                                string_replace(filename, ".dat", ".idx");
end;

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$OUTPUT_DML_REDUCED|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@283000|22000|0|0|0|0|11405|Compute Multiple Block-Compressed Lookups-1|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|701|0|1804|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|702|0|1807|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|703|0|1809|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|704|0|1811|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|705|0|1813|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|706|0|1815|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|707|0|1818|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key write|3|2|$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If True, allow continuous-flow operation. If False, allow batch-mode operation|{0|}}
{30001002|XXparameter|grouped|False|13|1|FKl|If True, each output file is closed before a new file is opened.|{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
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
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
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
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|4|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type3|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type4|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata|record string('') filename; void(integer(4)) data; end|7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|708|0|1820|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|709|0|1823|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|710|0|1826|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|711|0|1829|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|712|0|1832|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|713|0|1835|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|714|0|1838|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@45000|45000|0|0|0|0|11408|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|715|0|1840|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|716|0|1843|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|717|0|1845|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|718|0|1847|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|719|0|1849|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|720|0|1851|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|721|0|1853|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|722|0|1857|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|723|0|1860|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|724|0|1863|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|725|0|1866|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|726|0|1869|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|type output_type = void(integer(4));
 
/*extract filename from input record*/
filename::get_filename(in)=
begin
   filename :: in.filename;
end;
 
/*Create output record*/
write::reformat(in)=
begin
   write :: in.data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|write_stripped|Strip length prefix or delimiter|3|1|l|@{0|}}
{30001002|XXparameter|permissions|666|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@638000|47000|0|0|0|0|11389|Write Multiple Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|727|0|1871|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|728|0|1873|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|729|0|1875|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|730|0|1877|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|731|0|1880|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file) .|{4|uninterpreted|orc|parquet|seqfile|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|write_options_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param write_options_condition True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|732|0|1882|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|733|0|1885|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|734|0|1888|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|735|0|1891|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|736|0|1894|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|737|0|1898|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_STEP2_REDUCTION=="Y"]|3|9|F||{0|}}
}}@0|@279500|242500|0|0|0|0|11429|Create Step2 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|738|0|1900|0|{@{}@384|.5|.5|{0|}11416|17|}}
{2010210004|XXGflow|739|0|1902|0|{@{}@384|.5|.5|{0|}11413|17|}}
{2010501005|XXGpvertex|740|0|1904|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|$INDEX_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*extract filename from input record*/
filename::get_filename(in)=
begin
let string(",") key_name = in.$\{KEY\};
        filename:: "mfile:$\{AI_MFS\}/$\{MULTIPLE_ICFF_SUB_DIR\}_reduced_step2/$\{CLEAN_OUT_FILE_FOR_NAME\}_" + key_name + ".dat.gz";
end;

/* This function is optional. */
/*extract index filename from data filename*/
indexname::get_indexname(filename)=
begin
indexname ::            if(string_index(filename ,".dat.gz"))
                                string_replace(filename, ".dat.gz", ".idx")
                        else
                                string_replace(filename, ".dat", ".idx");
end;

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$OUTPUT_STEP2_REDUCED_DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@283000|22000|0|0|0|0|11414|Compute Multiple Block-Compressed Lookups-1|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|741|0|1906|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|742|0|1909|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|743|0|1911|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|744|0|1913|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|745|0|1915|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|746|0|1917|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|747|0|1920|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key write|3|2|$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If True, allow continuous-flow operation. If False, allow batch-mode operation|{0|}}
{30001002|XXparameter|grouped|False|13|1|FKl|If True, each output file is closed before a new file is opened.|{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
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
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
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
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|4|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type3|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type4|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata|record string('') filename; void(integer(4)) data; end|7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|748|0|1922|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|749|0|1925|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|750|0|1928|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|751|0|1931|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|752|0|1934|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|753|0|1937|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|754|0|1941|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out0_metadata|$OUTPUT_STEP2_REDUCED_DML|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@45000|45000|0|0|0|0|11417|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|755|0|1943|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|756|0|1946|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|757|0|1948|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|758|0|1950|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|759|0|1952|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|760|0|1954|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|761|0|1956|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|762|0|1960|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|763|0|1963|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|764|0|1966|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|765|0|1969|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|766|0|1972|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|type output_type = void(integer(4));
 
/*extract filename from input record*/
filename::get_filename(in)=
begin
   filename :: in.filename;
end;
 
/*Create output record*/
write::reformat(in)=
begin
   write :: in.data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|write_stripped|Strip length prefix or delimiter|3|1|l|@{0|}}
{30001002|XXparameter|permissions|666|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@638000|47000|0|0|0|0|11407|Write Multiple Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|767|0|1974|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|768|0|1976|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|769|0|1978|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|770|0|1980|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|771|0|1983|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file) .|{4|uninterpreted|orc|parquet|seqfile|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|write_options_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param write_options_condition True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|772|0|1985|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|773|0|1988|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|774|0|1991|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|775|0|1994|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|776|0|1997|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|777|0|2001|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_STEP3_REDUCTION=="Y"]|3|9|F||{0|}}
}}@0|@279500|422500|0|0|0|0|11431|Create Step3 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|778|0|2003|0|{@{}@384|.5|.5|{0|}11426|17|}}
{2010210004|XXGflow|779|0|2005|0|{@{}@384|.5|.5|{0|}11423|17|}}
{2010501005|XXGpvertex|780|0|2007|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|$INDEX_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*extract filename from input record*/
filename::get_filename(in)=
begin
let string(",") key_name = in.$\{KEY\};
        filename:: "mfile:$\{AI_MFS\}/$\{MULTIPLE_ICFF_SUB_DIR\}_reduced_step3/$\{CLEAN_OUT_FILE_FOR_NAME\}_" + key_name + ".dat.gz";
end;

/* This function is optional. */
/*extract index filename from data filename*/
indexname::get_indexname(filename)=
begin
indexname ::            if(string_index(filename ,".dat.gz"))
                                string_replace(filename, ".dat.gz", ".idx")
                        else
                                string_replace(filename, ".dat", ".idx");
end;

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@283000|22000|0|0|0|0|11424|Compute Multiple Block-Compressed Lookups-1|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|781|0|2009|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|782|0|2012|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|783|0|2014|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|784|0|2016|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|785|0|2018|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|786|0|2020|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|787|0|2023|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key write|3|2|$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If True, allow continuous-flow operation. If False, allow batch-mode operation|{0|}}
{30001002|XXparameter|grouped|False|13|1|FKl|If True, each output file is closed before a new file is opened.|{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
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
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
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
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|4|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type3|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type4|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata|record string('') filename; void(integer(4)) data; end|7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|788|0|2025|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|789|0|2028|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|790|0|2031|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|791|0|2034|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|792|0|2037|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|793|0|2040|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|794|0|2044|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out0_metadata|$OUTPUT_STEP3_REDUCED_DML|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@45000|45000|0|0|0|0|11427|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|795|0|2046|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|796|0|2049|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|797|0|2051|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|798|0|2053|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|799|0|2055|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|800|0|2057|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|801|0|2059|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|802|0|2063|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|803|0|2066|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|804|0|2069|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|805|0|2072|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|806|0|2075|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|type output_type = void(integer(4));
 
/*extract filename from input record*/
filename::get_filename(in)=
begin
   filename :: in.filename;
end;
 
/*Create output record*/
write::reformat(in)=
begin
   write :: in.data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|write_stripped|Strip length prefix or delimiter|3|1|l|@{0|}}
{30001002|XXparameter|permissions|666|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@638000|47000|0|0|0|0|11405|Write Multiple Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|807|0|2077|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|808|0|2079|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|809|0|2081|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|810|0|2083|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|811|0|2086|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file) .|{4|uninterpreted|orc|parquet|seqfile|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|write_options_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param write_options_condition True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|812|0|2088|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|813|0|2091|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|814|0|2094|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|815|0|2097|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|816|0|2100|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010501005|XXGpvertex|817|0|2104|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@83000|195000|0|0|0|0|11390|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|818|0|2106|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|819|0|2111|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|820|0|2113|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|821|0|2115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|822|0|2118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|823|0|2121|0|{@{}@0|0|0|0|in0|.514792899408284|@@@13840|0|}}
{2010501005|XXGpvertex|824|0|2125|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@78000|213500|0|0|0|0|11362|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|825|0|2127|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|826|0|2132|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|827|0|2134|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|828|0|2136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|829|0|2139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|830|0|2142|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$INDEX_FIELD|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@272000|280000|0|0|0|0|11395|Sort on INDEX_FIELD|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|831|0|2144|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|832|0|2147|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|833|0|2150|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|834|0|2152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|835|0|2155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|836|0|2158|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|$INDEX_FIELD|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(INDEX_FIELD)]|3|9||@{0|}}
{30001002|XXparameter|transform|filename::get_filename(in)=
begin
  filename:: "mfile:$\{AI_MFS\}/$\{MULTIPLE_ICFF_SUB_DIR\}/$\{CLEAN_OUT_FILE_FOR_NAME\}_" + (string("\\x01"))in.$\{KEY\} + "." + "$\{INDEX_FIELD\}" + ".dat.gz";
end;

indexname::get_indexname(filename)=
begin
  indexname :: if(string_index(filename ,".dat.gz"))
                 string_replace(filename, ".dat.gz", ".idx")
               else
                 string_replace(filename, ".dat", ".idx");
end;|3|3|c|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|create_directories|True|3|1|l|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@546000|253000|0|0|0|0|11368|Write Date-wise ICFFs for additional index|Ab Initio Software|Built-in 2.14.97:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|837|0|2160|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|838|0|2162|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|839|0|2164|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|840|0|2166|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|841|0|2168|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|842|0|2171|0|{Writes records to a set of output files and indexes them as block-compressed lookups.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-bc-lookups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key write|3|2|$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If True, allow continuous-flow operation. If False, allow batch-mode operation|{0|}}
{30001002|XXparameter|continuous.condition|version 2.14.105:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped|False|13|1|FKl|If True, each output file is closed before a new file is opened.|{0|}}
{30001002|XXparameter|grouped.condition|version 2.14.134:|3|15|P?|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files|{0|}}
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
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
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
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|truncate_on_recovery|True|13|1|Kl|If True, allow truncation of output files during recovery. If False, skip data during replay|{0|}}
{30001002|XXparameter|truncate_on_recovery.display_name|truncate-on-recovery|3|9|P|@{0|}}
{30001002|XXparameter|truncate_on_recovery.keyword|truncate-on-recovery|3|9|P|@{0|}}
{30001002|XXparameter|truncate_on_recovery.condition|version 2.15.1.r22:|3|15|P?|@{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|4|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|publisher|3|2|H$||{0|}}
{30001002|XXparameter|type3|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type4|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|843|0|2173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|844|0|2176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|845|0|2179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|846|0|2182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|847|0|2185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|848|0|2188|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|type output_type = void(integer(4));
 
/*extract filename from input record*/
filename::get_filename(in)=
begin
   filename :: in.filename;
end;
 
/*Create output record*/
write::reformat(in)=
begin
   write :: in.data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|write_stripped|Strip length prefix or delimiter|3|1|l|@{0|}}
{30001002|XXparameter|permissions|666|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@574000|27000|0|0|0|0|11411|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|849|0|2190|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|850|0|2192|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|851|0|2194|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|852|0|2196|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|853|0|2199|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file) .|{4|uninterpreted|orc|parquet|seqfile|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|write_options_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param write_options_condition True|3|15|P?|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|854|0|2201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|855|0|2204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|856|0|2207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|857|0|2210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|858|0|2213|0|{@{}@0|0|0|0|in0|.4911894273127753|@@@13840|0|}}
{2010110002|XXGconstant|859|0|2216|0|{@{}@{1|1221074|}}}
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
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_1|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_10|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_11|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_12|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_13|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_14|}1|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_2|}1|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_3|}1|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_4|}1|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_5|}1|34|}
{2010604001|XXGgraph_flow_flow|34|0|68|0|{Flow_6|}1|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_7|}1|36|}
{2010604001|XXGgraph_flow_flow|36|0|72|0|{Flow_8|}1|37|}
{2010604001|XXGgraph_flow_flow|37|0|74|0|{Flow_9|}1|38|}
{2010601001|XXGgraph_vertex_vertex|38|0|76|0|{Dummy_Replicate_for_flow|}1|39|}
{2010212001|XXGvertex_oport_oport|39|0|78|0|{0|out|}39|40|}
{2010213001|XXGoport_dst_flow|40|0|80|0|{0|}40|37|}
{2010211001|XXGvertex_iport_iport|41|0|81|0|{0|in|}39|41|}
{2010214001|XXGiport_src_flow|42|0|83|0|{0|}41|33|}
{2010214001|XXGiport_src_flow|43|0|84|0|{1|}41|28|}
{2010214001|XXGiport_src_flow|44|0|85|0|{2|}41|38|}
{2010007001|XXGobject_proto_object|45|0|86|0|{}39|42|}
{2010212001|XXGvertex_oport_oport|46|0|88|0|{0|out|}42|43|}
{2010006001|XXGobject_psameas_object|47|0|90|0|{metadata|out_metadata|1|0|}43|42|}
{2010211001|XXGvertex_iport_iport|48|0|91|0|{0|in|}42|44|}
{2010006001|XXGobject_psameas_object|49|0|93|0|{metadata|in_metadata|1|0|}44|42|}
{2010006001|XXGobject_psameas_object|50|0|94|0|{Layout|Layout|0|0|}39|45|}
{2010212001|XXGvertex_oport_oport|51|0|96|0|{0|read|}45|46|}
{2010213001|XXGoport_dst_flow|52|0|98|0|{0|}46|47|}
{2010211001|XXGvertex_iport_iport|53|0|100|0|{0|write|}45|48|}
{2010214001|XXGiport_src_flow|54|0|102|0|{0|}48|49|}
{2010007001|XXGobject_proto_object|55|0|104|0|{}45|50|}
{2010212001|XXGvertex_oport_oport|56|0|106|0|{0|read|}50|51|}
{2010006001|XXGobject_psameas_object|57|0|108|0|{metadata|read_metadata|1|0|}51|50|}
{2010211001|XXGvertex_iport_iport|58|0|109|0|{0|write|}50|52|}
{2010006001|XXGobject_psameas_object|59|0|111|0|{metadata|write_metadata|1|0|}52|50|}
{2010006001|XXGobject_psameas_object|60|0|112|0|{read_metadata|in_metadata|0|0|}45|53|}
{2010212001|XXGvertex_oport_oport|61|0|114|0|{0|out|}53|54|}
{2010213001|XXGoport_dst_flow|62|0|116|0|{0|}54|55|}
{2010212001|XXGvertex_oport_oport|63|0|118|0|{1|reject|}53|56|}
{2010212001|XXGvertex_oport_oport|64|0|120|0|{2|error|}53|57|}
{2010212001|XXGvertex_oport_oport|65|0|122|0|{3|log|}53|58|}
{2010212001|XXGvertex_oport_oport|66|0|124|0|{4|address|}53|59|}
{2010211001|XXGvertex_iport_iport|67|0|126|0|{0|in|}53|60|}
{2010214001|XXGiport_src_flow|68|0|128|0|{0|}60|61|}
{2010006001|XXGobject_psameas_object|69|0|130|0|{Layout|Layout|0|0|}53|45|}
{2010006001|XXGobject_psameas_object|70|0|131|0|{reject_metadata|in_metadata|0|0|}53|53|}
{2010006001|XXGobject_psameas_object|71|0|132|0|{write_metadata|in_metadata|0|0|}45|53|}
{2010006001|XXGobject_psameas_object|72|0|133|0|{in_metadata|out_metadata|0|0|}39|62|}
{2010212001|XXGvertex_oport_oport|73|0|135|0|{0|out|}62|63|}
{2010213001|XXGoport_dst_flow|74|0|137|0|{0|}63|64|}
{2010212001|XXGvertex_oport_oport|75|0|139|0|{1|filereject|}62|65|}
{2010212001|XXGvertex_oport_oport|76|0|141|0|{2|fileerror|}62|66|}
{2010212001|XXGvertex_oport_oport|77|0|143|0|{3|reject|}62|67|}
{2010212001|XXGvertex_oport_oport|78|0|145|0|{4|error|}62|68|}
{2010212001|XXGvertex_oport_oport|79|0|147|0|{5|log|}62|69|}
{2010211001|XXGvertex_iport_iport|80|0|149|0|{0|in|}62|70|}
{2010214001|XXGiport_src_flow|81|0|151|0|{0|}70|71|}
{2010006001|XXGobject_psameas_object|82|0|153|0|{filereject_metadata|out_metadata|0|0|}62|72|}
{2010212001|XXGvertex_oport_oport|83|0|155|0|{0|out|}72|73|}
{2010213001|XXGoport_dst_flow|84|0|157|0|{0|}73|74|}
{2010212001|XXGvertex_oport_oport|85|0|159|0|{1|error|}72|75|}
{2010212001|XXGvertex_oport_oport|86|0|161|0|{2|log|}72|76|}
{2010006001|XXGobject_psameas_object|87|0|163|0|{in_metadata|out_metadata|0|0|}62|72|}
{2010006001|XXGobject_psameas_object|88|0|164|0|{out_metadata|out_metadata|0|0|}39|62|}
{2010601001|XXGgraph_vertex_vertex|89|0|165|0|{Dummy_Replicate_for_flow_1|}1|77|}
{2010212001|XXGvertex_oport_oport|90|0|167|0|{0|out|}77|78|}
{2010213001|XXGoport_dst_flow|91|0|169|0|{0|}78|25|}
{2010213001|XXGoport_dst_flow|92|0|170|0|{1|}78|36|}
{2010213001|XXGoport_dst_flow|93|0|171|0|{2|}78|26|}
{2010211001|XXGvertex_iport_iport|94|0|172|0|{0|in|}77|79|}
{2010214001|XXGiport_src_flow|95|0|174|0|{0|}79|27|}
{2010007001|XXGobject_proto_object|96|0|175|0|{}77|80|}
{2010212001|XXGvertex_oport_oport|97|0|177|0|{0|out|}80|81|}
{2010006001|XXGobject_psameas_object|98|0|179|0|{metadata|out_metadata|1|0|}81|80|}
{2010211001|XXGvertex_iport_iport|99|0|180|0|{0|in|}80|82|}
{2010006001|XXGobject_psameas_object|100|0|182|0|{metadata|in_metadata|1|0|}82|80|}
{2010006001|XXGobject_psameas_object|101|0|183|0|{Layout|Layout|0|0|}77|83|}
{2010212001|XXGvertex_oport_oport|102|0|185|0|{0|out|}83|84|}
{2010213001|XXGoport_dst_flow|103|0|187|0|{0|}84|85|}
{2010211001|XXGvertex_iport_iport|104|0|189|0|{0|in|}83|86|}
{2010006001|XXGobject_psameas_object|105|0|191|0|{in_metadata|out_metadata|0|0|}83|62|}
{2010006001|XXGobject_psameas_object|106|0|192|0|{out_metadata|out_metadata|0|0|}83|62|}
{2010006001|XXGobject_psameas_object|107|0|193|0|{in_metadata|out_metadata|0|0|}77|62|}
{2010006001|XXGobject_psameas_object|108|0|194|0|{out_metadata|out_metadata|0|0|}77|62|}
{2010601001|XXGgraph_vertex_vertex|109|0|195|0|{Dummy_Replicate_for_flow_2|}1|87|}
{2010212001|XXGvertex_oport_oport|110|0|197|0|{0|out|}87|88|}
{2010213001|XXGoport_dst_flow|111|0|199|0|{0|}88|31|}
{2010213001|XXGoport_dst_flow|112|0|200|0|{1|}88|34|}
{2010213001|XXGoport_dst_flow|113|0|201|0|{2|}88|32|}
{2010211001|XXGvertex_iport_iport|114|0|202|0|{0|in|}87|89|}
{2010214001|XXGiport_src_flow|115|0|204|0|{0|}89|35|}
{2010007001|XXGobject_proto_object|116|0|205|0|{}87|90|}
{2010212001|XXGvertex_oport_oport|117|0|207|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|118|0|209|0|{metadata|out_metadata|1|0|}91|90|}
{2010211001|XXGvertex_iport_iport|119|0|210|0|{0|in|}90|92|}
{2010006001|XXGobject_psameas_object|120|0|212|0|{metadata|in_metadata|1|0|}92|90|}
{2010006001|XXGobject_psameas_object|121|0|213|0|{Layout|Layout|0|0|}87|45|}
{2010006001|XXGobject_psameas_object|122|0|214|0|{in_metadata|in_metadata|0|0|}87|53|}
{2010006001|XXGobject_psameas_object|123|0|215|0|{out_metadata|in_metadata|0|0|}87|53|}
{2010601001|XXGgraph_vertex_vertex|124|0|216|0|{Get_Log|}1|93|}
{2010212001|XXGvertex_oport_oport|125|0|218|0|{0|log|}93|94|}
{2010213001|XXGoport_dst_flow|126|0|220|0|{0|}94|29|}
{2010211001|XXGvertex_iport_iport|127|0|221|0|{0|in|}93|95|}
{2010007001|XXGobject_proto_object|128|0|223|0|{}93|96|}
{2010212001|XXGvertex_oport_oport|129|0|225|0|{0|log|}96|97|}
{2010006001|XXGobject_psameas_object|130|0|227|0|{metadata|log_metadata|1|0|}97|96|}
{2010211001|XXGvertex_iport_iport|131|0|228|0|{0|in|}96|98|}
{2010006001|XXGobject_psameas_object|132|0|230|0|{metadata|in_metadata|1|0|}98|96|}
{2010006001|XXGobject_psameas_object|133|0|231|0|{Layout|Layout|0|0|}93|99|}
{2010212001|XXGvertex_oport_oport|134|0|233|0|{0|out0|}99|100|}
{2010213001|XXGoport_dst_flow|135|0|235|0|{0|}100|35|}
{2010212001|XXGvertex_oport_oport|136|0|236|0|{1|reject0|}99|101|}
{2010212001|XXGvertex_oport_oport|137|0|238|0|{2|error0|}99|102|}
{2010212001|XXGvertex_oport_oport|138|0|240|0|{3|log|}99|103|}
{2010211001|XXGvertex_iport_iport|139|0|242|0|{0|in|}99|104|}
{2010214001|XXGiport_src_flow|140|0|244|0|{0|}104|37|}
{2010007001|XXGobject_proto_object|141|0|245|0|{}99|105|}
{2010212001|XXGvertex_oport_oport|142|0|247|0|{0|out0|}105|106|}
{2010006001|XXGobject_psameas_object|143|0|249|0|{metadata|out0_metadata|1|0|}106|105|}
{2010006001|XXGobject_psameas_object|144|0|250|0|{transform0|transform0|1|0|}106|105|}
{2010212001|XXGvertex_oport_oport|145|0|251|0|{1|reject0|}105|107|}
{2010006001|XXGobject_psameas_object|146|0|253|0|{metadata|reject0_metadata|1|0|}107|105|}
{2010212001|XXGvertex_oport_oport|147|0|254|0|{2|error0|}105|108|}
{2010006001|XXGobject_psameas_object|148|0|256|0|{metadata|error0_metadata|1|0|}108|105|}
{2010212001|XXGvertex_oport_oport|149|0|257|0|{3|log|}105|109|}
{2010006001|XXGobject_psameas_object|150|0|259|0|{metadata|log_metadata|1|0|}109|105|}
{2010211001|XXGvertex_iport_iport|151|0|260|0|{0|in|}105|110|}
{2010006001|XXGobject_psameas_object|152|0|262|0|{metadata|in_metadata|1|0|}110|105|}
{2010006001|XXGobject_psameas_object|153|0|263|0|{Layout|Layout|0|0|}99|45|}
{2010006001|XXGobject_psameas_object|154|0|264|0|{in_metadata|out_metadata|0|0|}99|62|}
{2010006001|XXGobject_psameas_object|155|0|265|0|{out0_metadata|in_metadata|0|0|}99|53|}
{2010006001|XXGobject_psameas_object|156|0|266|0|{reject0_metadata|out_metadata|0|0|}99|62|}
{2010006001|XXGobject_psameas_object|157|0|267|0|{log_metadata|in_metadata|0|0|}93|93|}
{2010601001|XXGgraph_vertex_vertex|158|0|268|0|{Get_Record_count|}1|111|}
{2010604001|XXGgraph_flow_flow|159|0|270|0|{Flow_15|}111|112|}
{2010244001|XXGflow_watcher_watcher|160|0|272|0|{}112|113|}
{2010604001|XXGgraph_flow_flow|161|0|274|0|{Flow_16|}111|114|}
{2010244001|XXGflow_watcher_watcher|162|0|276|0|{}114|115|}
{2010601001|XXGgraph_vertex_vertex|163|0|278|0|{Count_Local|}111|116|}
{2010212001|XXGvertex_oport_oport|164|0|280|0|{0|out|}116|117|}
{2010212001|XXGvertex_oport_oport|165|0|282|0|{1|reject|}116|118|}
{2010212001|XXGvertex_oport_oport|166|0|284|0|{2|error|}116|119|}
{2010212001|XXGvertex_oport_oport|167|0|286|0|{3|log|}116|120|}
{2010211001|XXGvertex_iport_iport|168|0|288|0|{0|in|}116|121|}
{2010214001|XXGiport_src_flow|169|0|290|0|{0|}121|112|}
{2010007001|XXGobject_proto_object|170|0|291|0|{}116|122|}
{2010212001|XXGvertex_oport_oport|171|0|293|0|{0|out|}122|123|}
{2010006001|XXGobject_psameas_object|172|0|295|0|{metadata|out_metadata|1|0|}123|122|}
{2010212001|XXGvertex_oport_oport|173|0|296|0|{1|reject|}122|124|}
{2010006001|XXGobject_psameas_object|174|0|298|0|{metadata|reject_metadata|1|0|}124|122|}
{2010212001|XXGvertex_oport_oport|175|0|299|0|{2|error|}122|125|}
{2010006001|XXGobject_psameas_object|176|0|301|0|{metadata|error_metadata|1|0|}125|122|}
{2010212001|XXGvertex_oport_oport|177|0|302|0|{3|log|}122|126|}
{2010006001|XXGobject_psameas_object|178|0|304|0|{metadata|log_metadata|1|0|}126|122|}
{2010211001|XXGvertex_iport_iport|179|0|305|0|{0|in|}122|127|}
{2010006001|XXGobject_psameas_object|180|0|307|0|{metadata|in_metadata|1|0|}127|122|}
{2010006001|XXGobject_psameas_object|181|0|308|0|{Layout|Layout|0|0|}116|128|}
{2010211001|XXGvertex_iport_iport|182|0|310|0|{0|write|}128|129|}
{2010214001|XXGiport_src_flow|183|0|312|0|{0|}129|30|}
{2010007001|XXGobject_proto_object|184|0|313|0|{}128|130|}
{2010211001|XXGvertex_iport_iport|185|0|315|0|{0|write|}130|131|}
{2010006001|XXGobject_psameas_object|186|0|317|0|{metadata|write_metadata|1|0|}131|130|}
{2010006001|XXGobject_psameas_object|187|0|318|0|{in_metadata|out0_metadata|0|0|}116|132|}
{2010212001|XXGvertex_oport_oport|188|0|320|0|{0|out0|}132|133|}
{2010213001|XXGoport_dst_flow|189|0|322|0|{0|}133|112|}
{2010212001|XXGvertex_oport_oport|190|0|323|0|{1|reject0|}132|134|}
{2010212001|XXGvertex_oport_oport|191|0|325|0|{2|error0|}132|135|}
{2010212001|XXGvertex_oport_oport|192|0|327|0|{3|log|}132|136|}
{2010211001|XXGvertex_iport_iport|193|0|329|0|{0|in|}132|137|}
{2010214001|XXGiport_src_flow|194|0|331|0|{0|}137|114|}
{2010007001|XXGobject_proto_object|195|0|332|0|{}132|138|}
{2010212001|XXGvertex_oport_oport|196|0|334|0|{0|out0|}138|139|}
{2010006001|XXGobject_psameas_object|197|0|336|0|{metadata|out0_metadata|1|0|}139|138|}
{2010006001|XXGobject_psameas_object|198|0|337|0|{transform0|transform0|1|0|}139|138|}
{2010212001|XXGvertex_oport_oport|199|0|338|0|{1|reject0|}138|140|}
{2010006001|XXGobject_psameas_object|200|0|340|0|{metadata|reject0_metadata|1|0|}140|138|}
{2010212001|XXGvertex_oport_oport|201|0|341|0|{2|error0|}138|141|}
{2010006001|XXGobject_psameas_object|202|0|343|0|{metadata|error0_metadata|1|0|}141|138|}
{2010212001|XXGvertex_oport_oport|203|0|344|0|{3|log|}138|142|}
{2010006001|XXGobject_psameas_object|204|0|346|0|{metadata|log_metadata|1|0|}142|138|}
{2010211001|XXGvertex_iport_iport|205|0|347|0|{0|in|}138|143|}
{2010006001|XXGobject_psameas_object|206|0|349|0|{metadata|in_metadata|1|0|}143|138|}
{2010006001|XXGobject_psameas_object|207|0|350|0|{Layout|Layout|0|0|}132|128|}
{2010006001|XXGobject_psameas_object|208|0|351|0|{in_metadata|in_metadata|0|0|}132|93|}
{2010006001|XXGobject_psameas_object|209|0|352|0|{reject0_metadata|in_metadata|0|0|}132|93|}
{2010006001|XXGobject_psameas_object|210|0|353|0|{out_metadata|write_metadata|0|0|}116|128|}
{2010006001|XXGobject_psameas_object|211|0|354|0|{reject_metadata|out0_metadata|0|0|}116|132|}
{2010601001|XXGgraph_vertex_vertex|212|0|355|0|{Gather_1|}111|144|}
{2010212001|XXGvertex_oport_oport|213|0|357|0|{0|out|}144|145|}
{2010213001|XXGoport_dst_flow|214|0|359|0|{0|}145|114|}
{2010211001|XXGvertex_iport_iport|215|0|360|0|{0|in|}144|146|}
{2010007001|XXGobject_proto_object|216|0|362|0|{}144|147|}
{2010212001|XXGvertex_oport_oport|217|0|364|0|{0|out|}147|148|}
{2010006001|XXGobject_psameas_object|218|0|366|0|{metadata|out_metadata|1|0|}148|147|}
{2010211001|XXGvertex_iport_iport|219|0|367|0|{0|in|}147|149|}
{2010006001|XXGobject_psameas_object|220|0|369|0|{metadata|in_metadata|1|0|}149|147|}
{2010006001|XXGobject_psameas_object|221|0|370|0|{Layout|Layout|0|0|}144|128|}
{2010006001|XXGobject_psameas_object|222|0|371|0|{in_metadata|in_metadata|0|0|}144|93|}
{2010006001|XXGobject_psameas_object|223|0|372|0|{out_metadata|in_metadata|0|0|}144|93|}
{2010601001|XXGgraph_vertex_vertex|224|0|373|0|{Parse_Log|}111|132|}
{2010212001|XXGvertex_oport_oport|225|0|374|0|{0|out0|}111|150|}
{2010216002|XXGoport_binding_oport|226|0|376|0|{.5|.5|{0|}11113|}150|117|}
{2010213001|XXGoport_dst_flow|227|0|377|0|{0|}150|30|}
{2010211001|XXGvertex_iport_iport|228|0|378|0|{0|in0|}111|151|}
{2010215002|XXGiport_binding_iport|229|0|380|0|{.5|.5|{0|}11112|}151|146|}
{2010214001|XXGiport_src_flow|230|0|381|0|{0|}151|29|}
{2010601001|XXGgraph_vertex_vertex|231|0|382|0|{ICFF_Output|}1|152|}
{2010604001|XXGgraph_flow_flow|232|0|384|0|{Flow_1|}152|47|}
{2010604001|XXGgraph_flow_flow|233|0|385|0|{Flow_10|}152|153|}
{2010604001|XXGgraph_flow_flow|234|0|387|0|{Flow_8|}152|49|}
{2010601001|XXGgraph_vertex_vertex|235|0|388|0|{ICFF_Data|}152|45|}
{2010601001|XXGgraph_vertex_vertex|236|0|389|0|{ICFF_Index|}152|154|}
{2010211001|XXGvertex_iport_iport|237|0|391|0|{0|write|}154|155|}
{2010214001|XXGiport_src_flow|238|0|393|0|{0|}155|153|}
{2010007001|XXGobject_proto_object|239|0|394|0|{}154|156|}
{2010211001|XXGvertex_iport_iport|240|0|396|0|{0|write|}156|157|}
{2010006001|XXGobject_psameas_object|241|0|398|0|{metadata|write_metadata|1|0|}157|156|}
{2010006001|XXGobject_psameas_object|242|0|399|0|{write_metadata|index_metadata|0|0|}154|158|}
{2010212001|XXGvertex_oport_oport|243|0|401|0|{0|out|}158|159|}
{2010213001|XXGoport_dst_flow|244|0|403|0|{0|}159|49|}
{2010212001|XXGvertex_oport_oport|245|0|404|0|{1|index|}158|160|}
{2010213001|XXGoport_dst_flow|246|0|406|0|{0|}160|153|}
{2010212001|XXGvertex_oport_oport|247|0|407|0|{2|address|}158|161|}
{2010211001|XXGvertex_iport_iport|248|0|409|0|{0|in|}158|162|}
{2010007001|XXGobject_proto_object|249|0|411|0|{}158|163|}
{2010212001|XXGvertex_oport_oport|250|0|413|0|{0|out|}163|164|}
{2010006001|XXGobject_psameas_object|251|0|415|0|{metadata|out_metadata|1|0|}164|163|}
{2010212001|XXGvertex_oport_oport|252|0|416|0|{1|index|}163|165|}
{2010006001|XXGobject_psameas_object|253|0|418|0|{metadata|index_metadata|1|0|}165|163|}
{2010212001|XXGvertex_oport_oport|254|0|419|0|{2|address|}163|166|}
{2010006001|XXGobject_psameas_object|255|0|421|0|{metadata|address_metadata|1|0|}166|163|}
{2010211001|XXGvertex_iport_iport|256|0|422|0|{0|in|}163|167|}
{2010006001|XXGobject_psameas_object|257|0|424|0|{metadata|in_metadata|1|0|}167|163|}
{2010006001|XXGobject_psameas_object|258|0|425|0|{Layout|Layout|0|0|}158|45|}
{2010006001|XXGobject_psameas_object|259|0|426|0|{in_metadata|in_metadata|0|0|}158|53|}
{2010006001|XXGobject_psameas_object|260|0|427|0|{out_metadata|in_metadata|0|0|}158|53|}
{2010601001|XXGgraph_vertex_vertex|261|0|428|0|{To_Enable_View_Data|}152|168|}
{2010211001|XXGvertex_iport_iport|262|0|430|0|{0|in|}168|169|}
{2010214001|XXGiport_src_flow|263|0|432|0|{0|}169|47|}
{2010007001|XXGobject_proto_object|264|0|433|0|{}168|170|}
{2010211001|XXGvertex_iport_iport|265|0|435|0|{0|in|}170|171|}
{2010006001|XXGobject_psameas_object|266|0|437|0|{metadata|in_metadata|1|0|}171|170|}
{2010006001|XXGobject_psameas_object|267|0|438|0|{in_metadata|in_metadata|0|0|}168|53|}
{2010601001|XXGgraph_vertex_vertex|268|0|439|0|{Write_Block_Compressed_Lookup|}152|158|}
{2010211001|XXGvertex_iport_iport|269|0|440|0|{0|in0|}152|172|}
{2010215002|XXGiport_binding_iport|270|0|442|0|{.5|.5|{0|}10654|}172|162|}
{2010214001|XXGiport_src_flow|271|0|443|0|{0|}172|34|}
{2010601001|XXGgraph_vertex_vertex|272|0|444|0|{Input_File|}1|173|}
{2010212001|XXGvertex_oport_oport|273|0|446|0|{0|read|}173|174|}
{2010007001|XXGobject_proto_object|274|0|448|0|{}173|175|}
{2010212001|XXGvertex_oport_oport|275|0|450|0|{0|read|}175|176|}
{2010006001|XXGobject_psameas_object|276|0|452|0|{metadata|read_metadata|1|0|}176|175|}
{2010601001|XXGgraph_vertex_vertex|277|0|453|0|{No_Sort_No_Partition|}1|177|}
{2010601001|XXGgraph_vertex_vertex|278|0|455|0|{Replicate|}177|178|}
{2010212001|XXGvertex_oport_oport|279|0|457|0|{0|out|}178|179|}
{2010211001|XXGvertex_iport_iport|280|0|459|0|{0|in|}178|180|}
{2010007001|XXGobject_proto_object|281|0|461|0|{}178|181|}
{2010212001|XXGvertex_oport_oport|282|0|463|0|{0|out|}181|182|}
{2010006001|XXGobject_psameas_object|283|0|465|0|{metadata|out_metadata|1|0|}182|181|}
{2010211001|XXGvertex_iport_iport|284|0|466|0|{0|in|}181|183|}
{2010006001|XXGobject_psameas_object|285|0|468|0|{metadata|in_metadata|1|0|}183|181|}
{2010006001|XXGobject_psameas_object|286|0|469|0|{Layout|Layout|0|0|}178|99|}
{2010006001|XXGobject_psameas_object|287|0|470|0|{in_metadata|out_metadata|0|0|}178|62|}
{2010006001|XXGobject_psameas_object|288|0|471|0|{out_metadata|out_metadata|0|0|}178|62|}
{2010212001|XXGvertex_oport_oport|289|0|472|0|{0|out0|}177|184|}
{2010216002|XXGoport_binding_oport|290|0|474|0|{.5|.5|{0|}11591|}184|179|}
{2010213001|XXGoport_dst_flow|291|0|475|0|{0|}184|28|}
{2010211001|XXGvertex_iport_iport|292|0|476|0|{0|in0|}177|185|}
{2010215002|XXGiport_binding_iport|293|0|478|0|{.5|.5|{0|}11590|}185|180|}
{2010214001|XXGiport_src_flow|294|0|479|0|{0|}185|36|}
{2010601001|XXGgraph_vertex_vertex|295|0|480|0|{Non_ICFF_Outputs|}1|186|}
{2010605001|XXGgraph_legend_legend|296|0|482|0|{0|}186|187|}
{2010241001|XXGlegend_face_face|297|0|484|0|{}187|188|}
{2010605001|XXGgraph_legend_legend|298|0|486|0|{1|}186|189|}
{2010241001|XXGlegend_face_face|299|0|488|0|{}189|190|}
{2010605001|XXGgraph_legend_legend|300|0|490|0|{2|}186|191|}
{2010241001|XXGlegend_face_face|301|0|492|0|{}191|192|}
{2010605001|XXGgraph_legend_legend|302|0|494|0|{3|}186|193|}
{2010241001|XXGlegend_face_face|303|0|496|0|{}193|194|}
{2010604001|XXGgraph_flow_flow|304|0|498|0|{Flow_10|}186|195|}
{2010604001|XXGgraph_flow_flow|305|0|500|0|{Flow_11|}186|196|}
{2010604001|XXGgraph_flow_flow|306|0|502|0|{Flow_12|}186|197|}
{2010604001|XXGgraph_flow_flow|307|0|504|0|{Flow_5|}186|198|}
{2010604001|XXGgraph_flow_flow|308|0|506|0|{Flow_6|}186|199|}
{2010604001|XXGgraph_flow_flow|309|0|508|0|{Flow_8|}186|200|}
{2010601001|XXGgraph_vertex_vertex|310|0|510|0|{Dummy_Concatenate|}186|201|}
{2010212001|XXGvertex_oport_oport|311|0|512|0|{0|out|}201|202|}
{2010213001|XXGoport_dst_flow|312|0|514|0|{0|}202|196|}
{2010211001|XXGvertex_iport_iport|313|0|515|0|{0|in|}201|203|}
{2010214001|XXGiport_src_flow|314|0|517|0|{0|}203|195|}
{2010214001|XXGiport_src_flow|315|0|518|0|{1|}203|200|}
{2010007001|XXGobject_proto_object|316|0|519|0|{}201|204|}
{2010212001|XXGvertex_oport_oport|317|0|521|0|{0|out|}204|205|}
{2010006001|XXGobject_psameas_object|318|0|523|0|{metadata|out_metadata|1|0|}205|204|}
{2010211001|XXGvertex_iport_iport|319|0|524|0|{0|in|}204|206|}
{2010006001|XXGobject_psameas_object|320|0|526|0|{metadata|in_metadata|1|0|}206|204|}
{2010006001|XXGobject_psameas_object|321|0|527|0|{Layout|Layout|0|0|}201|207|}
{2010211001|XXGvertex_iport_iport|322|0|529|0|{0|write|}207|208|}
{2010214001|XXGiport_src_flow|323|0|531|0|{0|}208|196|}
{2010007001|XXGobject_proto_object|324|0|532|0|{}207|209|}
{2010211001|XXGvertex_iport_iport|325|0|534|0|{0|write|}209|210|}
{2010006001|XXGobject_psameas_object|326|0|536|0|{metadata|write_metadata|1|0|}210|209|}
{2010006001|XXGobject_psameas_object|327|0|537|0|{in_metadata|write_metadata|0|0|}201|207|}
{2010006001|XXGobject_psameas_object|328|0|538|0|{out_metadata|write_metadata|0|0|}201|207|}
{2010601001|XXGgraph_vertex_vertex|329|0|539|0|{Dummy_Replicate_1|}186|211|}
{2010212001|XXGvertex_oport_oport|330|0|541|0|{0|out|}211|212|}
{2010213001|XXGoport_dst_flow|331|0|543|0|{0|}212|197|}
{2010213001|XXGoport_dst_flow|332|0|544|0|{1|}212|199|}
{2010211001|XXGvertex_iport_iport|333|0|545|0|{0|in|}211|213|}
{2010007001|XXGobject_proto_object|334|0|547|0|{}211|214|}
{2010212001|XXGvertex_oport_oport|335|0|549|0|{0|out|}214|215|}
{2010006001|XXGobject_psameas_object|336|0|551|0|{metadata|out_metadata|1|0|}215|214|}
{2010211001|XXGvertex_iport_iport|337|0|552|0|{0|in|}214|216|}
{2010006001|XXGobject_psameas_object|338|0|554|0|{metadata|in_metadata|1|0|}216|214|}
{2010006001|XXGobject_psameas_object|339|0|555|0|{Layout|Layout|0|0|}211|217|}
{2010211001|XXGvertex_iport_iport|340|0|557|0|{0|write|}217|218|}
{2010214001|XXGiport_src_flow|341|0|559|0|{0|}218|198|}
{2010007001|XXGobject_proto_object|342|0|560|0|{}217|219|}
{2010211001|XXGvertex_iport_iport|343|0|562|0|{0|write|}219|220|}
{2010006001|XXGobject_psameas_object|344|0|564|0|{metadata|write_metadata|1|0|}220|219|}
{2010006001|XXGobject_psameas_object|345|0|565|0|{write_metadata|index0_metadata|0|0|}217|221|}
{2010212001|XXGvertex_oport_oport|346|0|567|0|{0|out|}221|222|}
{2010213001|XXGoport_dst_flow|347|0|569|0|{0|}222|200|}
{2010212001|XXGvertex_oport_oport|348|0|570|0|{1|index0|}221|223|}
{2010213001|XXGoport_dst_flow|349|0|572|0|{0|}223|198|}
{2010211001|XXGvertex_iport_iport|350|0|573|0|{0|in|}221|224|}
{2010214001|XXGiport_src_flow|351|0|575|0|{0|}224|199|}
{2010007001|XXGobject_proto_object|352|0|576|0|{}221|225|}
{2010212001|XXGvertex_oport_oport|353|0|578|0|{0|out|}225|226|}
{2010006001|XXGobject_psameas_object|354|0|580|0|{metadata|out_metadata|1|0|}226|225|}
{2010212001|XXGvertex_oport_oport|355|0|581|0|{1|index0|}225|227|}
{2010006001|XXGobject_psameas_object|356|0|583|0|{key0|key0|1|0|}227|225|}
{2010006001|XXGobject_psameas_object|357|0|584|0|{metadata|index0_metadata|1|0|}227|225|}
{2010211001|XXGvertex_iport_iport|358|0|585|0|{0|in|}225|228|}
{2010006001|XXGobject_psameas_object|359|0|587|0|{metadata|in_metadata|1|0|}228|225|}
{2010006001|XXGobject_psameas_object|360|0|588|0|{Layout|Layout|0|0|}221|217|}
{2010006001|XXGobject_psameas_object|361|0|589|0|{in_metadata|write_metadata|0|0|}221|207|}
{2010006001|XXGobject_psameas_object|362|0|590|0|{out_metadata|write_metadata|0|0|}221|207|}
{2010006001|XXGobject_psameas_object|363|0|591|0|{in_metadata|in_metadata|0|0|}211|53|}
{2010006001|XXGobject_psameas_object|364|0|592|0|{out_metadata|in_metadata|0|0|}211|53|}
{2010601001|XXGgraph_vertex_vertex|365|0|593|0|{Dummy_Replicate_2|}186|229|}
{2010212001|XXGvertex_oport_oport|366|0|595|0|{0|out|}229|230|}
{2010213001|XXGoport_dst_flow|367|0|597|0|{0|}230|195|}
{2010211001|XXGvertex_iport_iport|368|0|598|0|{0|in|}229|231|}
{2010214001|XXGiport_src_flow|369|0|600|0|{0|}231|197|}
{2010007001|XXGobject_proto_object|370|0|601|0|{}229|232|}
{2010212001|XXGvertex_oport_oport|371|0|603|0|{0|out|}232|233|}
{2010006001|XXGobject_psameas_object|372|0|605|0|{metadata|out_metadata|1|0|}233|232|}
{2010211001|XXGvertex_iport_iport|373|0|606|0|{0|in|}232|234|}
{2010006001|XXGobject_psameas_object|374|0|608|0|{metadata|in_metadata|1|0|}234|232|}
{2010006001|XXGobject_psameas_object|375|0|609|0|{Layout|Layout|0|0|}229|207|}
{2010006001|XXGobject_psameas_object|376|0|610|0|{in_metadata|write_metadata|0|0|}229|207|}
{2010006001|XXGobject_psameas_object|377|0|611|0|{out_metadata|write_metadata|0|0|}229|207|}
{2010601001|XXGgraph_vertex_vertex|378|0|612|0|{Extracted_File|}186|207|}
{2010601001|XXGgraph_vertex_vertex|379|0|613|0|{Index|}186|217|}
{2010601001|XXGgraph_vertex_vertex|380|0|614|0|{Write_Lookup|}186|221|}
{2010211001|XXGvertex_iport_iport|381|0|615|0|{0|in0|}186|235|}
{2010215002|XXGiport_binding_iport|382|0|617|0|{.5|.5|{0|}10609|}235|213|}
{2010214001|XXGiport_src_flow|383|0|618|0|{0|}235|31|}
{2010006001|XXGobject_psameas_object|384|0|619|0|{metadata|in0_metadata|1|0|}235|186|}
{2010601001|XXGgraph_vertex_vertex|385|0|620|0|{Output_File|}1|128|}
{2010601001|XXGgraph_vertex_vertex|386|0|621|0|{PBRR|}1|236|}
{2010604001|XXGgraph_flow_flow|387|0|623|0|{Flow_8|}236|237|}
{2010601001|XXGgraph_vertex_vertex|388|0|625|0|{Gather|}236|238|}
{2010212001|XXGvertex_oport_oport|389|0|627|0|{0|out|}238|239|}
{2010211001|XXGvertex_iport_iport|390|0|629|0|{0|in|}238|240|}
{2010214001|XXGiport_src_flow|391|0|631|0|{0|}240|237|}
{2010007001|XXGobject_proto_object|392|0|632|0|{}238|241|}
{2010212001|XXGvertex_oport_oport|393|0|634|0|{0|out|}241|242|}
{2010006001|XXGobject_psameas_object|394|0|636|0|{metadata|out_metadata|1|0|}242|241|}
{2010211001|XXGvertex_iport_iport|395|0|637|0|{0|in|}241|243|}
{2010006001|XXGobject_psameas_object|396|0|639|0|{metadata|in_metadata|1|0|}243|241|}
{2010006001|XXGobject_psameas_object|397|0|640|0|{Layout|Layout|0|0|}238|45|}
{2010006001|XXGobject_psameas_object|398|0|641|0|{in_metadata|out_metadata|0|0|}238|62|}
{2010006001|XXGobject_psameas_object|399|0|642|0|{out_metadata|out_metadata|0|0|}238|62|}
{2010601001|XXGgraph_vertex_vertex|400|0|643|0|{Partition_by_Round_robin|}236|244|}
{2010212001|XXGvertex_oport_oport|401|0|645|0|{0|out|}244|245|}
{2010213001|XXGoport_dst_flow|402|0|647|0|{0|}245|237|}
{2010211001|XXGvertex_iport_iport|403|0|648|0|{0|in|}244|246|}
{2010007001|XXGobject_proto_object|404|0|650|0|{}244|247|}
{2010212001|XXGvertex_oport_oport|405|0|652|0|{0|out|}247|248|}
{2010006001|XXGobject_psameas_object|406|0|654|0|{metadata|out_metadata|1|0|}248|247|}
{2010211001|XXGvertex_iport_iport|407|0|655|0|{0|in|}247|249|}
{2010006001|XXGobject_psameas_object|408|0|657|0|{metadata|in_metadata|1|0|}249|247|}
{2010006001|XXGobject_psameas_object|409|0|658|0|{Layout|Layout|0|0|}244|83|}
{2010006001|XXGobject_psameas_object|410|0|659|0|{in_metadata|out_metadata|0|0|}244|62|}
{2010006001|XXGobject_psameas_object|411|0|660|0|{out_metadata|out_metadata|0|0|}244|62|}
{2010212001|XXGvertex_oport_oport|412|0|661|0|{0|out0|}236|250|}
{2010216002|XXGoport_binding_oport|413|0|663|0|{.5|.5|{0|}9950|}250|239|}
{2010213001|XXGoport_dst_flow|414|0|664|0|{0|}250|38|}
{2010211001|XXGvertex_iport_iport|415|0|665|0|{0|in0|}236|251|}
{2010215002|XXGiport_binding_iport|416|0|667|0|{.5|.5|{0|}9949|}251|246|}
{2010214001|XXGiport_src_flow|417|0|668|0|{0|}251|26|}
{2010601001|XXGgraph_vertex_vertex|418|0|669|0|{Partition_by_Key_and_Sort|}1|252|}
{2010604001|XXGgraph_flow_flow|419|0|671|0|{Flow_1|}252|85|}
{2010601001|XXGgraph_vertex_vertex|420|0|672|0|{Partition_by_Key|}252|83|}
{2010601001|XXGgraph_vertex_vertex|421|0|673|0|{Sort|}252|253|}
{2010212001|XXGvertex_oport_oport|422|0|675|0|{0|out|}253|254|}
{2010211001|XXGvertex_iport_iport|423|0|677|0|{0|in|}253|255|}
{2010214001|XXGiport_src_flow|424|0|679|0|{0|}255|85|}
{2010006001|XXGobject_psameas_object|425|0|680|0|{in_metadata|out_metadata|0|0|}253|62|}
{2010006001|XXGobject_psameas_object|426|0|681|0|{out_metadata|out_metadata|0|0|}253|62|}
{2010212001|XXGvertex_oport_oport|427|0|682|0|{0|out0|}252|256|}
{2010216002|XXGoport_binding_oport|428|0|684|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}256|254|}
{2010213001|XXGoport_dst_flow|429|0|685|0|{0|}256|33|}
{2010211001|XXGvertex_iport_iport|430|0|686|0|{0|in0|}252|257|}
{2010215002|XXGiport_binding_iport|431|0|688|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}257|86|}
{2010214001|XXGiport_src_flow|432|0|689|0|{0|}257|25|}
{2010007001|XXGobject_proto_object|433|0|690|0|{}252|258|}
{2010604001|XXGgraph_flow_flow|434|0|692|0|{Flow_1|}258|259|}
{2010601001|XXGgraph_vertex_vertex|435|0|694|0|{Partition_by_Key|}258|260|}
{2010212001|XXGvertex_oport_oport|436|0|696|0|{0|out|}260|261|}
{2010213001|XXGoport_dst_flow|437|0|698|0|{0|}261|259|}
{2010211001|XXGvertex_iport_iport|438|0|699|0|{0|in|}260|262|}
{2010007001|XXGobject_proto_object|439|0|701|0|{}260|263|}
{2010212001|XXGvertex_oport_oport|440|0|703|0|{0|out|}263|264|}
{2010006001|XXGobject_psameas_object|441|0|705|0|{metadata|out_metadata|1|0|}264|263|}
{2010211001|XXGvertex_iport_iport|442|0|706|0|{0|in|}263|265|}
{2010006001|XXGobject_psameas_object|443|0|708|0|{metadata|in_metadata|1|0|}265|263|}
{2010006001|XXGobject_psameas_object|444|0|709|0|{Layout|InputLayout|1|0|}260|258|}
{2010006001|XXGobject_psameas_object|445|0|710|0|{key|Key|1|0|}260|258|}
{2010601001|XXGgraph_vertex_vertex|446|0|711|0|{Sort|}258|266|}
{2010212001|XXGvertex_oport_oport|447|0|713|0|{0|out|}266|267|}
{2010211001|XXGvertex_iport_iport|448|0|715|0|{0|in|}266|268|}
{2010214001|XXGiport_src_flow|449|0|717|0|{0|}268|259|}
{2010007001|XXGobject_proto_object|450|0|718|0|{}266|269|}
{2010212001|XXGvertex_oport_oport|451|0|720|0|{0|out|}269|270|}
{2010006001|XXGobject_psameas_object|452|0|722|0|{metadata|out_metadata|1|0|}270|269|}
{2010211001|XXGvertex_iport_iport|453|0|723|0|{0|in|}269|271|}
{2010006001|XXGobject_psameas_object|454|0|725|0|{metadata|in_metadata|1|0|}271|269|}
{2010006001|XXGobject_psameas_object|455|0|726|0|{Layout|OutputLayout|1|0|}266|258|}
{2010006001|XXGobject_psameas_object|456|0|727|0|{key|Key|1|0|}266|258|}
{2010006001|XXGobject_psameas_object|457|0|728|0|{max_core|Max_core|1|0|}266|258|}
{2010212001|XXGvertex_oport_oport|458|0|729|0|{0|out0|}258|272|}
{2010216002|XXGoport_binding_oport|459|0|731|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}272|267|}
{2010211001|XXGvertex_iport_iport|460|0|732|0|{0|in0|}258|273|}
{2010215002|XXGiport_binding_iport|461|0|734|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}273|262|}
{2010006001|XXGobject_psameas_object|462|0|735|0|{OutputLayout|Layout|0|0|}252|99|}
{2010601001|XXGgraph_vertex_vertex|463|0|736|0|{Read_File_s_|}1|274|}
{2010605001|XXGgraph_legend_legend|464|0|738|0|{0|}274|275|}
{2010241001|XXGlegend_face_face|465|0|740|0|{}275|276|}
{2010605001|XXGgraph_legend_legend|466|0|742|0|{1|}274|277|}
{2010241001|XXGlegend_face_face|467|0|744|0|{}277|278|}
{2010605001|XXGgraph_legend_legend|468|0|746|0|{2|}274|279|}
{2010241001|XXGlegend_face_face|469|0|748|0|{}279|280|}
{2010605001|XXGgraph_legend_legend|470|0|750|0|{3|}274|281|}
{2010241001|XXGlegend_face_face|471|0|752|0|{}281|282|}
{2010605001|XXGgraph_legend_legend|472|0|754|0|{4|}274|283|}
{2010241001|XXGlegend_face_face|473|0|756|0|{}283|284|}
{2010605001|XXGgraph_legend_legend|474|0|758|0|{5|}274|285|}
{2010241001|XXGlegend_face_face|475|0|760|0|{}285|286|}
{2010605001|XXGgraph_legend_legend|476|0|762|0|{6|}274|287|}
{2010241001|XXGlegend_face_face|477|0|764|0|{}287|288|}
{2010604001|XXGgraph_flow_flow|478|0|766|0|{Flow_1|}274|74|}
{2010604001|XXGgraph_flow_flow|479|0|767|0|{Flow_10|}274|289|}
{2010604001|XXGgraph_flow_flow|480|0|769|0|{Flow_12|}274|290|}
{2010604001|XXGgraph_flow_flow|481|0|771|0|{Flow_2|}274|291|}
{2010604001|XXGgraph_flow_flow|482|0|773|0|{Flow_3|}274|71|}
{2010604001|XXGgraph_flow_flow|483|0|774|0|{Flow_4|}274|64|}
{2010604001|XXGgraph_flow_flow|484|0|775|0|{Flow_5|}274|292|}
{2010604001|XXGgraph_flow_flow|485|0|777|0|{Flow_6|}274|293|}
{2010604001|XXGgraph_flow_flow|486|0|779|0|{Flow_7|}274|294|}
{2010604001|XXGgraph_flow_flow|487|0|781|0|{Flow_8|}274|295|}
{2010604001|XXGgraph_flow_flow|488|0|783|0|{Flow_9|}274|296|}
{2010601001|XXGgraph_vertex_vertex|489|0|785|0|{Broadcast|}274|297|}
{2010212001|XXGvertex_oport_oport|490|0|787|0|{0|out|}297|298|}
{2010213001|XXGoport_dst_flow|491|0|789|0|{0|}298|293|}
{2010211001|XXGvertex_iport_iport|492|0|790|0|{0|in|}297|299|}
{2010214001|XXGiport_src_flow|493|0|792|0|{0|}299|291|}
{2010006001|XXGobject_psameas_object|494|0|793|0|{Layout|Layout|0|0|}297|72|}
{2010006001|XXGobject_psameas_object|495|0|794|0|{in_metadata|out_metadata|0|0|}297|72|}
{2010006001|XXGobject_psameas_object|496|0|795|0|{out_metadata|out_metadata|0|0|}297|72|}
{2010601001|XXGgraph_vertex_vertex|497|0|796|0|{Collect_Read_Errors_MFS|}274|300|}
{2010212001|XXGvertex_oport_oport|498|0|798|0|{0|escalate|}300|301|}
{2010212001|XXGvertex_oport_oport|499|0|800|0|{1|error|}300|302|}
{2010213001|XXGoport_dst_flow|500|0|802|0|{0|}302|296|}
{2010212001|XXGvertex_oport_oport|501|0|803|0|{2|log|}300|303|}
{2010211001|XXGvertex_iport_iport|502|0|805|0|{0|in|}300|304|}
{2010006001|XXGobject_psameas_object|503|0|807|0|{Layout|Layout|0|0|}300|305|}
{2010211001|XXGvertex_iport_iport|504|0|809|0|{0|write|}305|306|}
{2010214001|XXGiport_src_flow|505|0|811|0|{0|}306|296|}
{2010006001|XXGobject_psameas_object|506|0|812|0|{write_metadata|in_metadata|0|0|}305|300|}
{2010006001|XXGobject_psameas_object|507|0|813|0|{error_metadata|in_metadata|0|0|}300|300|}
{2010006001|XXGobject_psameas_object|508|0|814|0|{escalate_metadata|in_metadata|0|0|}300|300|}
{2010601001|XXGgraph_vertex_vertex|509|0|815|0|{Collect_Read_Errors_Serial|}274|307|}
{2010212001|XXGvertex_oport_oport|510|0|817|0|{0|escalate|}307|308|}
{2010212001|XXGvertex_oport_oport|511|0|819|0|{1|error|}307|309|}
{2010213001|XXGoport_dst_flow|512|0|821|0|{0|}309|295|}
{2010212001|XXGvertex_oport_oport|513|0|822|0|{2|log|}307|310|}
{2010211001|XXGvertex_iport_iport|514|0|824|0|{0|in|}307|311|}
{2010006001|XXGobject_psameas_object|515|0|826|0|{Layout|Layout|0|0|}307|312|}
{2010211001|XXGvertex_iport_iport|516|0|828|0|{0|write|}312|313|}
{2010214001|XXGiport_src_flow|517|0|830|0|{0|}313|295|}
{2010006001|XXGobject_psameas_object|518|0|831|0|{write_metadata|in_metadata|0|0|}312|307|}
{2010006001|XXGobject_psameas_object|519|0|832|0|{error_metadata|in_metadata|0|0|}307|307|}
{2010006001|XXGobject_psameas_object|520|0|833|0|{escalate_metadata|in_metadata|0|0|}307|307|}
{2010601001|XXGgraph_vertex_vertex|521|0|834|0|{Collect_Read_File_s_Log|}274|314|}
{2010212001|XXGvertex_oport_oport|522|0|836|0|{0|log|}314|315|}
{2010213001|XXGoport_dst_flow|523|0|838|0|{0|}315|289|}
{2010211001|XXGvertex_iport_iport|524|0|839|0|{0|in|}314|316|}
{2010006001|XXGobject_psameas_object|525|0|841|0|{log_metadata|in_metadata|0|0|}314|314|}
{2010601001|XXGgraph_vertex_vertex|526|0|842|0|{Concatenate|}274|317|}
{2010212001|XXGvertex_oport_oport|527|0|844|0|{0|out|}317|318|}
{2010213001|XXGoport_dst_flow|528|0|846|0|{0|}318|294|}
{2010211001|XXGvertex_iport_iport|529|0|847|0|{0|in|}317|319|}
{2010214001|XXGiport_src_flow|530|0|849|0|{0|}319|289|}
{2010006001|XXGobject_psameas_object|531|0|850|0|{Layout|Layout|0|0|}317|320|}
{2010211001|XXGvertex_iport_iport|532|0|852|0|{0|write|}320|321|}
{2010214001|XXGiport_src_flow|533|0|854|0|{0|}321|294|}
{2010006001|XXGobject_psameas_object|534|0|855|0|{write_metadata|in_metadata|0|0|}320|314|}
{2010006001|XXGobject_psameas_object|535|0|856|0|{in_metadata|in_metadata|0|0|}317|314|}
{2010006001|XXGobject_psameas_object|536|0|857|0|{out_metadata|in_metadata|0|0|}317|314|}
{2010601001|XXGgraph_vertex_vertex|537|0|858|0|{Dummy_Concat|}274|322|}
{2010212001|XXGvertex_oport_oport|538|0|860|0|{0|out|}322|323|}
{2010211001|XXGvertex_iport_iport|539|0|862|0|{0|in|}322|324|}
{2010214001|XXGiport_src_flow|540|0|864|0|{0|}324|64|}
{2010214001|XXGiport_src_flow|541|0|865|0|{1|}324|292|}
{2010006001|XXGobject_psameas_object|542|0|866|0|{Layout|Layout|0|0|}322|83|}
{2010006001|XXGobject_psameas_object|543|0|867|0|{in_metadata|out_metadata|0|0|}322|62|}
{2010006001|XXGobject_psameas_object|544|0|868|0|{out_metadata|out_metadata|0|0|}322|62|}
{2010601001|XXGgraph_vertex_vertex|545|0|869|0|{Dummy_Replicate|}274|325|}
{2010212001|XXGvertex_oport_oport|546|0|871|0|{0|out|}325|326|}
{2010213001|XXGoport_dst_flow|547|0|873|0|{0|}326|71|}
{2010213001|XXGoport_dst_flow|548|0|874|0|{1|}326|291|}
{2010213001|XXGoport_dst_flow|549|0|875|0|{2|}326|290|}
{2010211001|XXGvertex_iport_iport|550|0|876|0|{0|in|}325|327|}
{2010214001|XXGiport_src_flow|551|0|878|0|{0|}327|74|}
{2010006001|XXGobject_psameas_object|552|0|879|0|{in_metadata|out_metadata|0|0|}325|72|}
{2010006001|XXGobject_psameas_object|553|0|880|0|{out_metadata|out_metadata|0|0|}325|72|}
{2010601001|XXGgraph_vertex_vertex|554|0|881|0|{List_Files|}274|72|}
{2010601001|XXGgraph_vertex_vertex|555|0|882|0|{Log_the_List_of_Files|}274|328|}
{2010604001|XXGgraph_flow_flow|556|0|884|0|{Flow_11|}328|329|}
{2010601001|XXGgraph_vertex_vertex|557|0|886|0|{Build_Full_Path|}328|330|}
{2010212001|XXGvertex_oport_oport|558|0|888|0|{0|out0|}330|331|}
{2010213001|XXGoport_dst_flow|559|0|890|0|{0|}331|329|}
{2010212001|XXGvertex_oport_oport|560|0|891|0|{1|reject0|}330|332|}
{2010212001|XXGvertex_oport_oport|561|0|893|0|{2|error0|}330|333|}
{2010212001|XXGvertex_oport_oport|562|0|895|0|{3|log|}330|334|}
{2010211001|XXGvertex_iport_iport|563|0|897|0|{0|in|}330|335|}
{2010006001|XXGobject_psameas_object|564|0|899|0|{Layout|Layout|0|0|}330|336|}
{2010211001|XXGvertex_iport_iport|565|0|901|0|{0|write|}336|337|}
{2010214001|XXGiport_src_flow|566|0|903|0|{0|}337|329|}
{2010006001|XXGobject_psameas_object|567|0|904|0|{write_metadata|out_metadata|0|0|}336|72|}
{2010006001|XXGobject_psameas_object|568|0|905|0|{in_metadata|out_metadata|0|0|}330|72|}
{2010006001|XXGobject_psameas_object|569|0|906|0|{out0_metadata|out_metadata|0|0|}330|72|}
{2010006001|XXGobject_psameas_object|570|0|907|0|{reject0_metadata|out_metadata|0|0|}330|72|}
{2010601001|XXGgraph_vertex_vertex|571|0|908|0|{File_List|}328|336|}
{2010211001|XXGvertex_iport_iport|572|0|909|0|{0|in0|}328|338|}
{2010215002|XXGiport_binding_iport|573|0|911|0|{.5|.5|{0|}2202|}338|335|}
{2010214001|XXGiport_src_flow|574|0|912|0|{0|}338|290|}
{2010601001|XXGgraph_vertex_vertex|575|0|913|0|{Read_All_Matching_Files|}274|62|}
{2010601001|XXGgraph_vertex_vertex|576|0|914|0|{Read_All_Matching_Files_1|}274|339|}
{2010212001|XXGvertex_oport_oport|577|0|916|0|{0|out|}339|340|}
{2010213001|XXGoport_dst_flow|578|0|918|0|{0|}340|292|}
{2010212001|XXGvertex_oport_oport|579|0|919|0|{1|filereject|}339|341|}
{2010212001|XXGvertex_oport_oport|580|0|921|0|{2|fileerror|}339|342|}
{2010212001|XXGvertex_oport_oport|581|0|923|0|{3|reject|}339|343|}
{2010212001|XXGvertex_oport_oport|582|0|925|0|{4|error|}339|344|}
{2010212001|XXGvertex_oport_oport|583|0|927|0|{5|log|}339|345|}
{2010211001|XXGvertex_iport_iport|584|0|929|0|{0|in|}339|346|}
{2010214001|XXGiport_src_flow|585|0|931|0|{0|}346|293|}
{2010006001|XXGobject_psameas_object|586|0|932|0|{filereject_metadata|out_metadata|0|0|}339|72|}
{2010006001|XXGobject_psameas_object|587|0|933|0|{in_metadata|out_metadata|0|0|}339|72|}
{2010006001|XXGobject_psameas_object|588|0|934|0|{out_metadata|out_metadata|0|0|}339|62|}
{2010601001|XXGgraph_vertex_vertex|589|0|935|0|{Read_Errors_MFS|}274|305|}
{2010601001|XXGgraph_vertex_vertex|590|0|936|0|{Read_Errors_Serial|}274|312|}
{2010601001|XXGgraph_vertex_vertex|591|0|937|0|{Read_File_s_Log|}274|320|}
{2010212001|XXGvertex_oport_oport|592|0|938|0|{0|out0|}274|347|}
{2010216002|XXGoport_binding_oport|593|0|940|0|{.5|.5|{0|}2234|}347|323|}
{2010213001|XXGoport_dst_flow|594|0|941|0|{0|}347|27|}
{2010007001|XXGobject_proto_object|595|0|942|0|{}274|348|}
{2010605001|XXGgraph_legend_legend|596|0|944|0|{0|}348|349|}
{2010241001|XXGlegend_face_face|597|0|946|0|{}349|350|}
{2010605001|XXGgraph_legend_legend|598|0|948|0|{1|}348|351|}
{2010241001|XXGlegend_face_face|599|0|950|0|{}351|352|}
{2010605001|XXGgraph_legend_legend|600|0|952|0|{2|}348|353|}
{2010241001|XXGlegend_face_face|601|0|954|0|{}353|354|}
{2010605001|XXGgraph_legend_legend|602|0|956|0|{3|}348|355|}
{2010241001|XXGlegend_face_face|603|0|958|0|{}355|356|}
{2010605001|XXGgraph_legend_legend|604|0|960|0|{4|}348|357|}
{2010241001|XXGlegend_face_face|605|0|962|0|{}357|358|}
{2010605001|XXGgraph_legend_legend|606|0|964|0|{5|}348|359|}
{2010241001|XXGlegend_face_face|607|0|966|0|{}359|360|}
{2010605001|XXGgraph_legend_legend|608|0|968|0|{6|}348|361|}
{2010241001|XXGlegend_face_face|609|0|970|0|{}361|362|}
{2010604001|XXGgraph_flow_flow|610|0|972|0|{Flow_1|}348|363|}
{2010604001|XXGgraph_flow_flow|611|0|974|0|{Flow_10|}348|364|}
{2010604001|XXGgraph_flow_flow|612|0|976|0|{Flow_12|}348|365|}
{2010604001|XXGgraph_flow_flow|613|0|978|0|{Flow_2|}348|366|}
{2010604001|XXGgraph_flow_flow|614|0|980|0|{Flow_3|}348|367|}
{2010604001|XXGgraph_flow_flow|615|0|982|0|{Flow_4|}348|368|}
{2010604001|XXGgraph_flow_flow|616|0|984|0|{Flow_5|}348|369|}
{2010604001|XXGgraph_flow_flow|617|0|986|0|{Flow_6|}348|370|}
{2010604001|XXGgraph_flow_flow|618|0|988|0|{Flow_7|}348|371|}
{2010604001|XXGgraph_flow_flow|619|0|990|0|{Flow_8|}348|372|}
{2010604001|XXGgraph_flow_flow|620|0|992|0|{Flow_9|}348|373|}
{2010601001|XXGgraph_vertex_vertex|621|0|994|0|{Broadcast|}348|374|}
{2010212001|XXGvertex_oport_oport|622|0|996|0|{0|out|}374|375|}
{2010213001|XXGoport_dst_flow|623|0|998|0|{0|}375|370|}
{2010211001|XXGvertex_iport_iport|624|0|999|0|{0|in|}374|376|}
{2010214001|XXGiport_src_flow|625|0|1001|0|{0|}376|366|}
{2010007001|XXGobject_proto_object|626|0|1002|0|{}374|377|}
{2010212001|XXGvertex_oport_oport|627|0|1004|0|{0|out|}377|378|}
{2010006001|XXGobject_psameas_object|628|0|1006|0|{metadata|out_metadata|1|0|}378|377|}
{2010211001|XXGvertex_iport_iport|629|0|1007|0|{0|in|}377|379|}
{2010006001|XXGobject_psameas_object|630|0|1009|0|{metadata|in_metadata|1|0|}379|377|}
{2010601001|XXGgraph_vertex_vertex|631|0|1010|0|{Collect_Read_Errors_MFS|}348|380|}
{2010212001|XXGvertex_oport_oport|632|0|1012|0|{0|escalate|}380|381|}
{2010212001|XXGvertex_oport_oport|633|0|1014|0|{1|error|}380|382|}
{2010213001|XXGoport_dst_flow|634|0|1016|0|{0|}382|373|}
{2010212001|XXGvertex_oport_oport|635|0|1017|0|{2|log|}380|383|}
{2010211001|XXGvertex_iport_iport|636|0|1019|0|{0|in|}380|384|}
{2010007001|XXGobject_proto_object|637|0|1021|0|{}380|385|}
{2010212001|XXGvertex_oport_oport|638|0|1023|0|{0|escalate|}385|386|}
{2010006001|XXGobject_psameas_object|639|0|1025|0|{metadata|escalate_metadata|1|0|}386|385|}
{2010212001|XXGvertex_oport_oport|640|0|1026|0|{1|error|}385|387|}
{2010006001|XXGobject_psameas_object|641|0|1028|0|{metadata|error_metadata|1|0|}387|385|}
{2010212001|XXGvertex_oport_oport|642|0|1029|0|{2|log|}385|388|}
{2010006001|XXGobject_psameas_object|643|0|1031|0|{metadata|log_metadata|1|0|}388|385|}
{2010211001|XXGvertex_iport_iport|644|0|1032|0|{0|in|}385|389|}
{2010006001|XXGobject_psameas_object|645|0|1034|0|{metadata|in_metadata|1|0|}389|385|}
{2010601001|XXGgraph_vertex_vertex|646|0|1035|0|{Collect_Read_Errors_Serial|}348|390|}
{2010212001|XXGvertex_oport_oport|647|0|1037|0|{0|escalate|}390|391|}
{2010212001|XXGvertex_oport_oport|648|0|1039|0|{1|error|}390|392|}
{2010213001|XXGoport_dst_flow|649|0|1041|0|{0|}392|372|}
{2010212001|XXGvertex_oport_oport|650|0|1042|0|{2|log|}390|393|}
{2010211001|XXGvertex_iport_iport|651|0|1044|0|{0|in|}390|394|}
{2010007001|XXGobject_proto_object|652|0|1046|0|{}390|395|}
{2010212001|XXGvertex_oport_oport|653|0|1048|0|{0|escalate|}395|396|}
{2010006001|XXGobject_psameas_object|654|0|1050|0|{metadata|escalate_metadata|1|0|}396|395|}
{2010212001|XXGvertex_oport_oport|655|0|1051|0|{1|error|}395|397|}
{2010006001|XXGobject_psameas_object|656|0|1053|0|{metadata|error_metadata|1|0|}397|395|}
{2010212001|XXGvertex_oport_oport|657|0|1054|0|{2|log|}395|398|}
{2010006001|XXGobject_psameas_object|658|0|1056|0|{metadata|log_metadata|1|0|}398|395|}
{2010211001|XXGvertex_iport_iport|659|0|1057|0|{0|in|}395|399|}
{2010006001|XXGobject_psameas_object|660|0|1059|0|{metadata|in_metadata|1|0|}399|395|}
{2010601001|XXGgraph_vertex_vertex|661|0|1060|0|{Collect_Read_File_s_Log|}348|400|}
{2010212001|XXGvertex_oport_oport|662|0|1062|0|{0|log|}400|401|}
{2010213001|XXGoport_dst_flow|663|0|1064|0|{0|}401|364|}
{2010211001|XXGvertex_iport_iport|664|0|1065|0|{0|in|}400|402|}
{2010007001|XXGobject_proto_object|665|0|1067|0|{}400|403|}
{2010212001|XXGvertex_oport_oport|666|0|1069|0|{0|log|}403|404|}
{2010006001|XXGobject_psameas_object|667|0|1071|0|{metadata|log_metadata|1|0|}404|403|}
{2010211001|XXGvertex_iport_iport|668|0|1072|0|{0|in|}403|405|}
{2010006001|XXGobject_psameas_object|669|0|1074|0|{metadata|in_metadata|1|0|}405|403|}
{2010601001|XXGgraph_vertex_vertex|670|0|1075|0|{Concatenate|}348|406|}
{2010212001|XXGvertex_oport_oport|671|0|1077|0|{0|out|}406|407|}
{2010213001|XXGoport_dst_flow|672|0|1079|0|{0|}407|371|}
{2010211001|XXGvertex_iport_iport|673|0|1080|0|{0|in|}406|408|}
{2010214001|XXGiport_src_flow|674|0|1082|0|{0|}408|364|}
{2010007001|XXGobject_proto_object|675|0|1083|0|{}406|409|}
{2010212001|XXGvertex_oport_oport|676|0|1085|0|{0|out|}409|410|}
{2010006001|XXGobject_psameas_object|677|0|1087|0|{metadata|out_metadata|1|0|}410|409|}
{2010211001|XXGvertex_iport_iport|678|0|1088|0|{0|in|}409|411|}
{2010006001|XXGobject_psameas_object|679|0|1090|0|{metadata|in_metadata|1|0|}411|409|}
{2010601001|XXGgraph_vertex_vertex|680|0|1091|0|{Dummy_Concat|}348|412|}
{2010212001|XXGvertex_oport_oport|681|0|1093|0|{0|out|}412|413|}
{2010211001|XXGvertex_iport_iport|682|0|1095|0|{0|in|}412|414|}
{2010214001|XXGiport_src_flow|683|0|1097|0|{0|}414|368|}
{2010214001|XXGiport_src_flow|684|0|1098|0|{1|}414|369|}
{2010007001|XXGobject_proto_object|685|0|1099|0|{}412|415|}
{2010212001|XXGvertex_oport_oport|686|0|1101|0|{0|out|}415|416|}
{2010006001|XXGobject_psameas_object|687|0|1103|0|{metadata|out_metadata|1|0|}416|415|}
{2010211001|XXGvertex_iport_iport|688|0|1104|0|{0|in|}415|417|}
{2010006001|XXGobject_psameas_object|689|0|1106|0|{metadata|in_metadata|1|0|}417|415|}
{2010601001|XXGgraph_vertex_vertex|690|0|1107|0|{Dummy_Replicate|}348|418|}
{2010212001|XXGvertex_oport_oport|691|0|1109|0|{0|out|}418|419|}
{2010213001|XXGoport_dst_flow|692|0|1111|0|{0|}419|367|}
{2010213001|XXGoport_dst_flow|693|0|1112|0|{1|}419|366|}
{2010213001|XXGoport_dst_flow|694|0|1113|0|{2|}419|365|}
{2010211001|XXGvertex_iport_iport|695|0|1114|0|{0|in|}418|420|}
{2010214001|XXGiport_src_flow|696|0|1116|0|{0|}420|363|}
{2010007001|XXGobject_proto_object|697|0|1117|0|{}418|421|}
{2010212001|XXGvertex_oport_oport|698|0|1119|0|{0|out|}421|422|}
{2010006001|XXGobject_psameas_object|699|0|1121|0|{metadata|out_metadata|1|0|}422|421|}
{2010211001|XXGvertex_iport_iport|700|0|1122|0|{0|in|}421|423|}
{2010006001|XXGobject_psameas_object|701|0|1124|0|{metadata|in_metadata|1|0|}423|421|}
{2010006001|XXGobject_psameas_object|702|0|1125|0|{Layout|Layout|0|0|}418|424|}
{2010212001|XXGvertex_oport_oport|703|0|1127|0|{0|out|}424|425|}
{2010213001|XXGoport_dst_flow|704|0|1129|0|{0|}425|363|}
{2010212001|XXGvertex_oport_oport|705|0|1130|0|{1|error|}424|426|}
{2010212001|XXGvertex_oport_oport|706|0|1132|0|{2|log|}424|427|}
{2010007001|XXGobject_proto_object|707|0|1134|0|{}424|428|}
{2010212001|XXGvertex_oport_oport|708|0|1136|0|{0|out|}428|429|}
{2010006001|XXGobject_psameas_object|709|0|1138|0|{metadata|out_metadata|1|0|}429|428|}
{2010212001|XXGvertex_oport_oport|710|0|1139|0|{1|error|}428|430|}
{2010006001|XXGobject_psameas_object|711|0|1141|0|{metadata|error_metadata|1|0|}430|428|}
{2010212001|XXGvertex_oport_oport|712|0|1142|0|{2|log|}428|431|}
{2010006001|XXGobject_psameas_object|713|0|1144|0|{metadata|log_metadata|1|0|}431|428|}
{2010601001|XXGgraph_vertex_vertex|714|0|1145|0|{List_Files|}348|424|}
{2010601001|XXGgraph_vertex_vertex|715|0|1146|0|{Log_the_List_of_Files|}348|432|}
{2010604001|XXGgraph_flow_flow|716|0|1148|0|{Flow_11|}432|433|}
{2010601001|XXGgraph_vertex_vertex|717|0|1150|0|{Build_Full_Path|}432|434|}
{2010212001|XXGvertex_oport_oport|718|0|1152|0|{0|out0|}434|435|}
{2010213001|XXGoport_dst_flow|719|0|1154|0|{0|}435|433|}
{2010212001|XXGvertex_oport_oport|720|0|1155|0|{1|reject0|}434|436|}
{2010212001|XXGvertex_oport_oport|721|0|1157|0|{2|error0|}434|437|}
{2010212001|XXGvertex_oport_oport|722|0|1159|0|{3|log|}434|438|}
{2010211001|XXGvertex_iport_iport|723|0|1161|0|{0|in|}434|439|}
{2010007001|XXGobject_proto_object|724|0|1163|0|{}434|440|}
{2010212001|XXGvertex_oport_oport|725|0|1165|0|{0|out0|}440|441|}
{2010006001|XXGobject_psameas_object|726|0|1167|0|{metadata|out0_metadata|1|0|}441|440|}
{2010006001|XXGobject_psameas_object|727|0|1168|0|{transform0|transform0|1|0|}441|440|}
{2010212001|XXGvertex_oport_oport|728|0|1169|0|{1|reject0|}440|442|}
{2010006001|XXGobject_psameas_object|729|0|1171|0|{metadata|reject0_metadata|1|0|}442|440|}
{2010212001|XXGvertex_oport_oport|730|0|1172|0|{2|error0|}440|443|}
{2010006001|XXGobject_psameas_object|731|0|1174|0|{metadata|error0_metadata|1|0|}443|440|}
{2010212001|XXGvertex_oport_oport|732|0|1175|0|{3|log|}440|444|}
{2010006001|XXGobject_psameas_object|733|0|1177|0|{metadata|log_metadata|1|0|}444|440|}
{2010211001|XXGvertex_iport_iport|734|0|1178|0|{0|in|}440|445|}
{2010006001|XXGobject_psameas_object|735|0|1180|0|{metadata|in_metadata|1|0|}445|440|}
{2010601001|XXGgraph_vertex_vertex|736|0|1181|0|{File_List|}432|446|}
{2010211001|XXGvertex_iport_iport|737|0|1183|0|{0|write|}446|447|}
{2010214001|XXGiport_src_flow|738|0|1185|0|{0|}447|433|}
{2010007001|XXGobject_proto_object|739|0|1186|0|{}446|448|}
{2010211001|XXGvertex_iport_iport|740|0|1188|0|{0|write|}448|449|}
{2010006001|XXGobject_psameas_object|741|0|1190|0|{metadata|write_metadata|1|0|}449|448|}
{2010211001|XXGvertex_iport_iport|742|0|1191|0|{0|in0|}432|450|}
{2010215002|XXGiport_binding_iport|743|0|1193|0|{.5|.5|{0|}2199|}450|439|}
{2010214001|XXGiport_src_flow|744|0|1194|0|{0|}450|365|}
{2010601001|XXGgraph_vertex_vertex|745|0|1195|0|{Read_All_Matching_Files|}348|451|}
{2010212001|XXGvertex_oport_oport|746|0|1197|0|{0|out|}451|452|}
{2010213001|XXGoport_dst_flow|747|0|1199|0|{0|}452|368|}
{2010212001|XXGvertex_oport_oport|748|0|1200|0|{1|filereject|}451|453|}
{2010212001|XXGvertex_oport_oport|749|0|1202|0|{2|fileerror|}451|454|}
{2010212001|XXGvertex_oport_oport|750|0|1204|0|{3|reject|}451|455|}
{2010212001|XXGvertex_oport_oport|751|0|1206|0|{4|error|}451|456|}
{2010212001|XXGvertex_oport_oport|752|0|1208|0|{5|log|}451|457|}
{2010211001|XXGvertex_iport_iport|753|0|1210|0|{0|in|}451|458|}
{2010214001|XXGiport_src_flow|754|0|1212|0|{0|}458|367|}
{2010007001|XXGobject_proto_object|755|0|1213|0|{}451|459|}
{2010212001|XXGvertex_oport_oport|756|0|1215|0|{0|out|}459|460|}
{2010006001|XXGobject_psameas_object|757|0|1217|0|{metadata|out_metadata|1|0|}460|459|}
{2010212001|XXGvertex_oport_oport|758|0|1218|0|{1|filereject|}459|461|}
{2010006001|XXGobject_psameas_object|759|0|1220|0|{metadata|filereject_metadata|1|0|}461|459|}
{2010212001|XXGvertex_oport_oport|760|0|1221|0|{2|fileerror|}459|462|}
{2010006001|XXGobject_psameas_object|761|0|1223|0|{metadata|fileerror_metadata|1|0|}462|459|}
{2010212001|XXGvertex_oport_oport|762|0|1224|0|{3|reject|}459|463|}
{2010006001|XXGobject_psameas_object|763|0|1226|0|{metadata|reject_metadata|1|0|}463|459|}
{2010212001|XXGvertex_oport_oport|764|0|1227|0|{4|error|}459|464|}
{2010006001|XXGobject_psameas_object|765|0|1229|0|{metadata|error_metadata|1|0|}464|459|}
{2010212001|XXGvertex_oport_oport|766|0|1230|0|{5|log|}459|465|}
{2010006001|XXGobject_psameas_object|767|0|1232|0|{metadata|log_metadata|1|0|}465|459|}
{2010211001|XXGvertex_iport_iport|768|0|1233|0|{0|in|}459|466|}
{2010006001|XXGobject_psameas_object|769|0|1235|0|{metadata|in_metadata|1|0|}466|459|}
{2010601001|XXGgraph_vertex_vertex|770|0|1236|0|{Read_All_Matching_Files_1|}348|467|}
{2010212001|XXGvertex_oport_oport|771|0|1238|0|{0|out|}467|468|}
{2010213001|XXGoport_dst_flow|772|0|1240|0|{0|}468|369|}
{2010212001|XXGvertex_oport_oport|773|0|1241|0|{1|filereject|}467|469|}
{2010212001|XXGvertex_oport_oport|774|0|1243|0|{2|fileerror|}467|470|}
{2010212001|XXGvertex_oport_oport|775|0|1245|0|{3|reject|}467|471|}
{2010212001|XXGvertex_oport_oport|776|0|1247|0|{4|error|}467|472|}
{2010212001|XXGvertex_oport_oport|777|0|1249|0|{5|log|}467|473|}
{2010211001|XXGvertex_iport_iport|778|0|1251|0|{0|in|}467|474|}
{2010214001|XXGiport_src_flow|779|0|1253|0|{0|}474|370|}
{2010007001|XXGobject_proto_object|780|0|1254|0|{}467|475|}
{2010212001|XXGvertex_oport_oport|781|0|1256|0|{0|out|}475|476|}
{2010006001|XXGobject_psameas_object|782|0|1258|0|{metadata|out_metadata|1|0|}476|475|}
{2010212001|XXGvertex_oport_oport|783|0|1259|0|{1|filereject|}475|477|}
{2010006001|XXGobject_psameas_object|784|0|1261|0|{metadata|filereject_metadata|1|0|}477|475|}
{2010212001|XXGvertex_oport_oport|785|0|1262|0|{2|fileerror|}475|478|}
{2010006001|XXGobject_psameas_object|786|0|1264|0|{metadata|fileerror_metadata|1|0|}478|475|}
{2010212001|XXGvertex_oport_oport|787|0|1265|0|{3|reject|}475|479|}
{2010006001|XXGobject_psameas_object|788|0|1267|0|{metadata|reject_metadata|1|0|}479|475|}
{2010212001|XXGvertex_oport_oport|789|0|1268|0|{4|error|}475|480|}
{2010006001|XXGobject_psameas_object|790|0|1270|0|{metadata|error_metadata|1|0|}480|475|}
{2010212001|XXGvertex_oport_oport|791|0|1271|0|{5|log|}475|481|}
{2010006001|XXGobject_psameas_object|792|0|1273|0|{metadata|log_metadata|1|0|}481|475|}
{2010211001|XXGvertex_iport_iport|793|0|1274|0|{0|in|}475|482|}
{2010006001|XXGobject_psameas_object|794|0|1276|0|{metadata|in_metadata|1|0|}482|475|}
{2010601001|XXGgraph_vertex_vertex|795|0|1277|0|{Read_Errors_MFS|}348|483|}
{2010211001|XXGvertex_iport_iport|796|0|1279|0|{0|write|}483|484|}
{2010214001|XXGiport_src_flow|797|0|1281|0|{0|}484|373|}
{2010007001|XXGobject_proto_object|798|0|1282|0|{}483|485|}
{2010211001|XXGvertex_iport_iport|799|0|1284|0|{0|write|}485|486|}
{2010006001|XXGobject_psameas_object|800|0|1286|0|{metadata|write_metadata|1|0|}486|485|}
{2010601001|XXGgraph_vertex_vertex|801|0|1287|0|{Read_Errors_Serial|}348|487|}
{2010211001|XXGvertex_iport_iport|802|0|1289|0|{0|write|}487|488|}
{2010214001|XXGiport_src_flow|803|0|1291|0|{0|}488|372|}
{2010007001|XXGobject_proto_object|804|0|1292|0|{}487|489|}
{2010211001|XXGvertex_iport_iport|805|0|1294|0|{0|write|}489|490|}
{2010006001|XXGobject_psameas_object|806|0|1296|0|{metadata|write_metadata|1|0|}490|489|}
{2010601001|XXGgraph_vertex_vertex|807|0|1297|0|{Read_File_s_Log|}348|491|}
{2010211001|XXGvertex_iport_iport|808|0|1299|0|{0|write|}491|492|}
{2010214001|XXGiport_src_flow|809|0|1301|0|{0|}492|371|}
{2010007001|XXGobject_proto_object|810|0|1302|0|{}491|493|}
{2010211001|XXGvertex_iport_iport|811|0|1304|0|{0|write|}493|494|}
{2010006001|XXGobject_psameas_object|812|0|1306|0|{metadata|write_metadata|1|0|}494|493|}
{2010212001|XXGvertex_oport_oport|813|0|1307|0|{0|out0|}348|495|}
{2010216002|XXGoport_binding_oport|814|0|1309|0|{.5|.5|{0|}2231|}495|413|}
{2010601001|XXGgraph_vertex_vertex|815|0|1310|0|{Trim_Strings|}1|99|}
{2010601001|XXGgraph_vertex_vertex|816|0|1311|0|{Version_Log|}1|496|}
{2010605001|XXGgraph_legend_legend|817|0|1313|0|{0|}496|497|}
{2010241001|XXGlegend_face_face|818|0|1315|0|{}497|498|}
{2010605001|XXGgraph_legend_legend|819|0|1317|0|{1|}496|499|}
{2010241001|XXGlegend_face_face|820|0|1319|0|{}499|500|}
{2010605001|XXGgraph_legend_legend|821|0|1321|0|{2|}496|501|}
{2010241001|XXGlegend_face_face|822|0|1323|0|{}501|502|}
{2010605001|XXGgraph_legend_legend|823|0|1325|0|{3|}496|503|}
{2010241001|XXGlegend_face_face|824|0|1327|0|{}503|504|}
{2010605001|XXGgraph_legend_legend|825|0|1329|0|{4|}496|505|}
{2010241001|XXGlegend_face_face|826|0|1331|0|{}505|506|}
{2010605001|XXGgraph_legend_legend|827|0|1333|0|{5|}496|507|}
{2010241001|XXGlegend_face_face|828|0|1335|0|{}507|508|}
{2010605001|XXGgraph_legend_legend|829|0|1337|0|{6|}496|509|}
{2010241001|XXGlegend_face_face|830|0|1339|0|{}509|510|}
{2010605001|XXGgraph_legend_legend|831|0|1341|0|{7|}496|511|}
{2010241001|XXGlegend_face_face|832|0|1343|0|{}511|512|}
{2010605001|XXGgraph_legend_legend|833|0|1345|0|{8|}496|513|}
{2010241001|XXGlegend_face_face|834|0|1347|0|{}513|514|}
{2010605001|XXGgraph_legend_legend|835|0|1349|0|{9|}496|515|}
{2010241001|XXGlegend_face_face|836|0|1351|0|{}515|516|}
{2010605001|XXGgraph_legend_legend|837|0|1353|0|{10|}496|517|}
{2010241001|XXGlegend_face_face|838|0|1355|0|{}517|518|}
{2010605001|XXGgraph_legend_legend|839|0|1357|0|{11|}496|519|}
{2010241001|XXGlegend_face_face|840|0|1359|0|{}519|520|}
{2010605001|XXGgraph_legend_legend|841|0|1361|0|{12|}496|521|}
{2010241001|XXGlegend_face_face|842|0|1363|0|{}521|522|}
{2010605001|XXGgraph_legend_legend|843|0|1365|0|{13|}496|523|}
{2010241001|XXGlegend_face_face|844|0|1367|0|{}523|524|}
{2010605001|XXGgraph_legend_legend|845|0|1369|0|{14|}496|525|}
{2010241001|XXGlegend_face_face|846|0|1371|0|{}525|526|}
{2010605001|XXGgraph_legend_legend|847|0|1373|0|{15|}496|527|}
{2010241001|XXGlegend_face_face|848|0|1375|0|{}527|528|}
{2010605001|XXGgraph_legend_legend|849|0|1377|0|{16|}496|529|}
{2010241001|XXGlegend_face_face|850|0|1379|0|{}529|530|}
{2010605001|XXGgraph_legend_legend|851|0|1381|0|{17|}496|531|}
{2010241001|XXGlegend_face_face|852|0|1383|0|{}531|532|}
{2010605001|XXGgraph_legend_legend|853|0|1385|0|{18|}496|533|}
{2010241001|XXGlegend_face_face|854|0|1387|0|{}533|534|}
{2010605001|XXGgraph_legend_legend|855|0|1389|0|{19|}496|535|}
{2010241001|XXGlegend_face_face|856|0|1391|0|{}535|536|}
{2010605001|XXGgraph_legend_legend|857|0|1393|0|{20|}496|537|}
{2010241001|XXGlegend_face_face|858|0|1395|0|{}537|538|}
{2010605001|XXGgraph_legend_legend|859|0|1397|0|{21|}496|539|}
{2010241001|XXGlegend_face_face|860|0|1399|0|{}539|540|}
{2010605001|XXGgraph_legend_legend|861|0|1401|0|{22|}496|541|}
{2010241001|XXGlegend_face_face|862|0|1403|0|{}541|542|}
{2010605001|XXGgraph_legend_legend|863|0|1405|0|{23|}496|543|}
{2010241001|XXGlegend_face_face|864|0|1407|0|{}543|544|}
{2010605001|XXGgraph_legend_legend|865|0|1409|0|{24|}496|545|}
{2010241001|XXGlegend_face_face|866|0|1411|0|{}545|546|}
{2010605001|XXGgraph_legend_legend|867|0|1413|0|{25|}496|547|}
{2010241001|XXGlegend_face_face|868|0|1415|0|{}547|548|}
{2010605001|XXGgraph_legend_legend|869|0|1417|0|{26|}496|549|}
{2010241001|XXGlegend_face_face|870|0|1419|0|{}549|550|}
{2010605001|XXGgraph_legend_legend|871|0|1421|0|{27|}496|551|}
{2010241001|XXGlegend_face_face|872|0|1423|0|{}551|552|}
{2010605001|XXGgraph_legend_legend|873|0|1425|0|{28|}496|553|}
{2010241001|XXGlegend_face_face|874|0|1427|0|{}553|554|}
{2010605001|XXGgraph_legend_legend|875|0|1429|0|{29|}496|555|}
{2010241001|XXGlegend_face_face|876|0|1431|0|{}555|556|}
{2010605001|XXGgraph_legend_legend|877|0|1433|0|{30|}496|557|}
{2010241001|XXGlegend_face_face|878|0|1435|0|{}557|558|}
{2010605001|XXGgraph_legend_legend|879|0|1437|0|{31|}496|559|}
{2010241001|XXGlegend_face_face|880|0|1439|0|{}559|560|}
{2010605001|XXGgraph_legend_legend|881|0|1441|0|{32|}496|561|}
{2010241001|XXGlegend_face_face|882|0|1443|0|{}561|562|}
{2010605001|XXGgraph_legend_legend|883|0|1445|0|{33|}496|563|}
{2010241001|XXGlegend_face_face|884|0|1447|0|{}563|564|}
{2010605001|XXGgraph_legend_legend|885|0|1449|0|{34|}496|565|}
{2010241001|XXGlegend_face_face|886|0|1451|0|{}565|566|}
{2010605001|XXGgraph_legend_legend|887|0|1453|0|{35|}496|567|}
{2010241001|XXGlegend_face_face|888|0|1455|0|{}567|568|}
{2010601001|XXGgraph_vertex_vertex|889|0|1457|0|{Write_Daily_ICFFs_and_Xref|}1|569|}
{2010605001|XXGgraph_legend_legend|890|0|1459|0|{0|}569|570|}
{2010241001|XXGlegend_face_face|891|0|1461|0|{}570|571|}
{2010605001|XXGgraph_legend_legend|892|0|1463|0|{1|}569|572|}
{2010241001|XXGlegend_face_face|893|0|1465|0|{}572|573|}
{2010604001|XXGgraph_flow_flow|894|0|1467|0|{Flow_1|}569|61|}
{2010604001|XXGgraph_flow_flow|895|0|1468|0|{Flow_10|}569|574|}
{2010604001|XXGgraph_flow_flow|896|0|1470|0|{Flow_14|}569|575|}
{2010604001|XXGgraph_flow_flow|897|0|1472|0|{Flow_5|}569|576|}
{2010604001|XXGgraph_flow_flow|898|0|1474|0|{Flow_8|}569|55|}
{2010601001|XXGgraph_vertex_vertex|899|0|1475|0|{Compute_Multiple_Block_Compressed_Lookups|}569|53|}
{2010601001|XXGgraph_vertex_vertex|900|0|1476|0|{Create_Reduced_Aleternate_Data_Source|}569|577|}
{2010604001|XXGgraph_flow_flow|901|0|1478|0|{Flow_1|}577|578|}
{2010604001|XXGgraph_flow_flow|902|0|1480|0|{Flow_2|}577|579|}
{2010604001|XXGgraph_flow_flow|903|0|1482|0|{Flow_3|}577|580|}
{2010601001|XXGgraph_vertex_vertex|904|0|1484|0|{Create_Main_Reduced_File|}577|581|}
{2010604001|XXGgraph_flow_flow|905|0|1486|0|{Flow_1|}581|582|}
{2010604001|XXGgraph_flow_flow|906|0|1488|0|{Flow_14|}581|583|}
{2010601001|XXGgraph_vertex_vertex|907|0|1490|0|{Compute_Multiple_Block_Compressed_Lookups_1|}581|584|}
{2010212001|XXGvertex_oport_oport|908|0|1492|0|{0|out|}584|585|}
{2010213001|XXGoport_dst_flow|909|0|1494|0|{0|}585|583|}
{2010212001|XXGvertex_oport_oport|910|0|1495|0|{1|reject|}584|586|}
{2010212001|XXGvertex_oport_oport|911|0|1497|0|{2|error|}584|587|}
{2010212001|XXGvertex_oport_oport|912|0|1499|0|{3|log|}584|588|}
{2010212001|XXGvertex_oport_oport|913|0|1501|0|{4|address|}584|589|}
{2010211001|XXGvertex_iport_iport|914|0|1503|0|{0|in|}584|590|}
{2010214001|XXGiport_src_flow|915|0|1505|0|{0|}590|582|}
{2010006001|XXGobject_psameas_object|916|0|1506|0|{Layout|Layout|0|0|}584|45|}
{2010006001|XXGobject_psameas_object|917|0|1507|0|{reject_metadata|in_metadata|0|0|}584|584|}
{2010601001|XXGgraph_vertex_vertex|918|0|1508|0|{Drop_columns|}581|591|}
{2010212001|XXGvertex_oport_oport|919|0|1510|0|{0|out0|}591|592|}
{2010213001|XXGoport_dst_flow|920|0|1512|0|{0|}592|582|}
{2010212001|XXGvertex_oport_oport|921|0|1513|0|{1|reject0|}591|593|}
{2010212001|XXGvertex_oport_oport|922|0|1515|0|{2|error0|}591|594|}
{2010212001|XXGvertex_oport_oport|923|0|1517|0|{3|log|}591|595|}
{2010211001|XXGvertex_iport_iport|924|0|1519|0|{0|in|}591|596|}
{2010006001|XXGobject_psameas_object|925|0|1521|0|{Layout|Layout|0|0|}591|45|}
{2010006001|XXGobject_psameas_object|926|0|1522|0|{in_metadata|in_metadata|0|0|}591|53|}
{2010006001|XXGobject_psameas_object|927|0|1523|0|{out0_metadata|in_metadata|0|0|}591|584|}
{2010006001|XXGobject_psameas_object|928|0|1524|0|{reject0_metadata|in_metadata|0|0|}591|53|}
{2010601001|XXGgraph_vertex_vertex|929|0|1525|0|{Write_Multiple_Files_1|}581|597|}
{2010212001|XXGvertex_oport_oport|930|0|1527|0|{0|reject|}597|598|}
{2010212001|XXGvertex_oport_oport|931|0|1529|0|{1|error|}597|599|}
{2010212001|XXGvertex_oport_oport|932|0|1531|0|{2|log|}597|600|}
{2010211001|XXGvertex_iport_iport|933|0|1533|0|{0|in|}597|601|}
{2010214001|XXGiport_src_flow|934|0|1535|0|{0|}601|583|}
{2010006001|XXGobject_psameas_object|935|0|1536|0|{Layout|Layout|0|0|}597|45|}
{2010006001|XXGobject_psameas_object|936|0|1537|0|{in_metadata|out_metadata|0|0|}597|584|}
{2010006001|XXGobject_psameas_object|937|0|1538|0|{reject_metadata|out_metadata|0|0|}597|584|}
{2010211001|XXGvertex_iport_iport|938|0|1539|0|{0|in0|}581|602|}
{2010215002|XXGiport_binding_iport|939|0|1541|0|{.5|.5|{0|}11409|}602|596|}
{2010214001|XXGiport_src_flow|940|0|1542|0|{0|}602|579|}
{2010601001|XXGgraph_vertex_vertex|941|0|1543|0|{Create_Step2_Reduced_File|}577|603|}
{2010604001|XXGgraph_flow_flow|942|0|1545|0|{Flow_1|}603|604|}
{2010604001|XXGgraph_flow_flow|943|0|1547|0|{Flow_14|}603|605|}
{2010601001|XXGgraph_vertex_vertex|944|0|1549|0|{Compute_Multiple_Block_Compressed_Lookups_1|}603|606|}
{2010212001|XXGvertex_oport_oport|945|0|1551|0|{0|out|}606|607|}
{2010213001|XXGoport_dst_flow|946|0|1553|0|{0|}607|605|}
{2010212001|XXGvertex_oport_oport|947|0|1554|0|{1|reject|}606|608|}
{2010212001|XXGvertex_oport_oport|948|0|1556|0|{2|error|}606|609|}
{2010212001|XXGvertex_oport_oport|949|0|1558|0|{3|log|}606|610|}
{2010212001|XXGvertex_oport_oport|950|0|1560|0|{4|address|}606|611|}
{2010211001|XXGvertex_iport_iport|951|0|1562|0|{0|in|}606|612|}
{2010214001|XXGiport_src_flow|952|0|1564|0|{0|}612|604|}
{2010006001|XXGobject_psameas_object|953|0|1565|0|{Layout|Layout|0|0|}606|45|}
{2010601001|XXGgraph_vertex_vertex|954|0|1566|0|{Drop_columns|}603|613|}
{2010212001|XXGvertex_oport_oport|955|0|1568|0|{0|out0|}613|614|}
{2010213001|XXGoport_dst_flow|956|0|1570|0|{0|}614|604|}
{2010212001|XXGvertex_oport_oport|957|0|1571|0|{1|reject0|}613|615|}
{2010212001|XXGvertex_oport_oport|958|0|1573|0|{2|error0|}613|616|}
{2010212001|XXGvertex_oport_oport|959|0|1575|0|{3|log|}613|617|}
{2010211001|XXGvertex_iport_iport|960|0|1577|0|{0|in|}613|618|}
{2010006001|XXGobject_psameas_object|961|0|1579|0|{Layout|Layout|0|0|}613|45|}
{2010006001|XXGobject_psameas_object|962|0|1580|0|{in_metadata|in_metadata|0|0|}613|53|}
{2010006001|XXGobject_psameas_object|963|0|1581|0|{reject0_metadata|in_metadata|0|0|}613|53|}
{2010601001|XXGgraph_vertex_vertex|964|0|1582|0|{Write_Multiple_Files_1|}603|619|}
{2010212001|XXGvertex_oport_oport|965|0|1584|0|{0|reject|}619|620|}
{2010212001|XXGvertex_oport_oport|966|0|1586|0|{1|error|}619|621|}
{2010212001|XXGvertex_oport_oport|967|0|1588|0|{2|log|}619|622|}
{2010211001|XXGvertex_iport_iport|968|0|1590|0|{0|in|}619|623|}
{2010214001|XXGiport_src_flow|969|0|1592|0|{0|}623|605|}
{2010006001|XXGobject_psameas_object|970|0|1593|0|{Layout|Layout|0|0|}619|45|}
{2010006001|XXGobject_psameas_object|971|0|1594|0|{in_metadata|out_metadata|0|0|}619|606|}
{2010006001|XXGobject_psameas_object|972|0|1595|0|{reject_metadata|out_metadata|0|0|}619|606|}
{2010211001|XXGvertex_iport_iport|973|0|1596|0|{0|in0|}603|624|}
{2010215002|XXGiport_binding_iport|974|0|1598|0|{.5|.5|{0|}11418|}624|618|}
{2010214001|XXGiport_src_flow|975|0|1599|0|{0|}624|578|}
{2010601001|XXGgraph_vertex_vertex|976|0|1600|0|{Create_Step3_Reduced_File|}577|625|}
{2010604001|XXGgraph_flow_flow|977|0|1602|0|{Flow_1|}625|626|}
{2010604001|XXGgraph_flow_flow|978|0|1604|0|{Flow_14|}625|627|}
{2010601001|XXGgraph_vertex_vertex|979|0|1606|0|{Compute_Multiple_Block_Compressed_Lookups_1|}625|628|}
{2010212001|XXGvertex_oport_oport|980|0|1608|0|{0|out|}628|629|}
{2010213001|XXGoport_dst_flow|981|0|1610|0|{0|}629|627|}
{2010212001|XXGvertex_oport_oport|982|0|1611|0|{1|reject|}628|630|}
{2010212001|XXGvertex_oport_oport|983|0|1613|0|{2|error|}628|631|}
{2010212001|XXGvertex_oport_oport|984|0|1615|0|{3|log|}628|632|}
{2010212001|XXGvertex_oport_oport|985|0|1617|0|{4|address|}628|633|}
{2010211001|XXGvertex_iport_iport|986|0|1619|0|{0|in|}628|634|}
{2010214001|XXGiport_src_flow|987|0|1621|0|{0|}634|626|}
{2010006001|XXGobject_psameas_object|988|0|1622|0|{Layout|Layout|0|0|}628|45|}
{2010006001|XXGobject_psameas_object|989|0|1623|0|{in_metadata|out0_metadata|0|0|}628|635|}
{2010212001|XXGvertex_oport_oport|990|0|1625|0|{0|out0|}635|636|}
{2010213001|XXGoport_dst_flow|991|0|1627|0|{0|}636|626|}
{2010212001|XXGvertex_oport_oport|992|0|1628|0|{1|reject0|}635|637|}
{2010212001|XXGvertex_oport_oport|993|0|1630|0|{2|error0|}635|638|}
{2010212001|XXGvertex_oport_oport|994|0|1632|0|{3|log|}635|639|}
{2010211001|XXGvertex_iport_iport|995|0|1634|0|{0|in|}635|640|}
{2010006001|XXGobject_psameas_object|996|0|1636|0|{Layout|Layout|0|0|}635|45|}
{2010006001|XXGobject_psameas_object|997|0|1637|0|{in_metadata|in_metadata|0|0|}635|53|}
{2010006001|XXGobject_psameas_object|998|0|1638|0|{reject0_metadata|in_metadata|0|0|}635|53|}
{2010601001|XXGgraph_vertex_vertex|999|0|1639|0|{Drop_columns|}625|635|}
{2010601001|XXGgraph_vertex_vertex|1000|0|1640|0|{Write_Multiple_Files_1|}625|641|}
{2010212001|XXGvertex_oport_oport|1001|0|1642|0|{0|reject|}641|642|}
{2010212001|XXGvertex_oport_oport|1002|0|1644|0|{1|error|}641|643|}
{2010212001|XXGvertex_oport_oport|1003|0|1646|0|{2|log|}641|644|}
{2010211001|XXGvertex_iport_iport|1004|0|1648|0|{0|in|}641|645|}
{2010214001|XXGiport_src_flow|1005|0|1650|0|{0|}645|627|}
{2010006001|XXGobject_psameas_object|1006|0|1651|0|{Layout|Layout|0|0|}641|45|}
{2010006001|XXGobject_psameas_object|1007|0|1652|0|{in_metadata|out_metadata|0|0|}641|628|}
{2010006001|XXGobject_psameas_object|1008|0|1653|0|{reject_metadata|out_metadata|0|0|}641|628|}
{2010211001|XXGvertex_iport_iport|1009|0|1654|0|{0|in0|}625|646|}
{2010215002|XXGiport_binding_iport|1010|0|1656|0|{.5|.5|{0|}11428|}646|640|}
{2010214001|XXGiport_src_flow|1011|0|1657|0|{0|}646|580|}
{2010601001|XXGgraph_vertex_vertex|1012|0|1658|0|{Replicate|}577|647|}
{2010212001|XXGvertex_oport_oport|1013|0|1660|0|{0|out|}647|648|}
{2010213001|XXGoport_dst_flow|1014|0|1662|0|{0|}648|579|}
{2010213001|XXGoport_dst_flow|1015|0|1663|0|{1|}648|578|}
{2010213001|XXGoport_dst_flow|1016|0|1664|0|{2|}648|580|}
{2010211001|XXGvertex_iport_iport|1017|0|1665|0|{0|in|}647|649|}
{2010006001|XXGobject_psameas_object|1018|0|1667|0|{Layout|Layout|0|0|}647|45|}
{2010006001|XXGobject_psameas_object|1019|0|1668|0|{in_metadata|in_metadata|0|0|}647|53|}
{2010006001|XXGobject_psameas_object|1020|0|1669|0|{out_metadata|in_metadata|0|0|}647|53|}
{2010211001|XXGvertex_iport_iport|1021|0|1670|0|{0|in0|}577|650|}
{2010215002|XXGiport_binding_iport|1022|0|1672|0|{.5|.5|{0|}11438|}650|649|}
{2010214001|XXGiport_src_flow|1023|0|1673|0|{0|}650|575|}
{2010601001|XXGgraph_vertex_vertex|1024|0|1674|0|{Replicate|}569|651|}
{2010212001|XXGvertex_oport_oport|1025|0|1676|0|{0|out|}651|652|}
{2010213001|XXGoport_dst_flow|1026|0|1678|0|{0|}652|61|}
{2010213001|XXGoport_dst_flow|1027|0|1679|0|{1|}652|574|}
{2010213001|XXGoport_dst_flow|1028|0|1680|0|{2|}652|575|}
{2010211001|XXGvertex_iport_iport|1029|0|1681|0|{0|in|}651|653|}
{2010006001|XXGobject_psameas_object|1030|0|1683|0|{Layout|Layout|0|0|}651|45|}
{2010006001|XXGobject_psameas_object|1031|0|1684|0|{in_metadata|in_metadata|0|0|}651|53|}
{2010006001|XXGobject_psameas_object|1032|0|1685|0|{out_metadata|in_metadata|0|0|}651|53|}
{2010601001|XXGgraph_vertex_vertex|1033|0|1686|0|{Sort_on_INDEX_FIELD|}569|654|}
{2010212001|XXGvertex_oport_oport|1034|0|1688|0|{0|out|}654|655|}
{2010213001|XXGoport_dst_flow|1035|0|1690|0|{0|}655|576|}
{2010211001|XXGvertex_iport_iport|1036|0|1691|0|{0|in|}654|656|}
{2010214001|XXGiport_src_flow|1037|0|1693|0|{0|}656|574|}
{2010006001|XXGobject_psameas_object|1038|0|1694|0|{Layout|Layout|0|0|}654|45|}
{2010006001|XXGobject_psameas_object|1039|0|1695|0|{in_metadata|in_metadata|0|0|}654|53|}
{2010006001|XXGobject_psameas_object|1040|0|1696|0|{out_metadata|in_metadata|0|0|}654|53|}
{2010601001|XXGgraph_vertex_vertex|1041|0|1697|0|{Write_Date_wise_ICFFs_for_additional_index|}569|657|}
{2010212001|XXGvertex_oport_oport|1042|0|1699|0|{0|reject|}657|658|}
{2010212001|XXGvertex_oport_oport|1043|0|1701|0|{1|error|}657|659|}
{2010212001|XXGvertex_oport_oport|1044|0|1703|0|{2|log|}657|660|}
{2010212001|XXGvertex_oport_oport|1045|0|1705|0|{3|address|}657|661|}
{2010211001|XXGvertex_iport_iport|1046|0|1707|0|{0|in|}657|662|}
{2010214001|XXGiport_src_flow|1047|0|1709|0|{0|}662|576|}
{2010006001|XXGobject_psameas_object|1048|0|1710|0|{Layout|Layout|0|0|}657|45|}
{2010006001|XXGobject_psameas_object|1049|0|1711|0|{in_metadata|in_metadata|0|0|}657|53|}
{2010006001|XXGobject_psameas_object|1050|0|1712|0|{reject_metadata|in_metadata|0|0|}657|53|}
{2010601001|XXGgraph_vertex_vertex|1051|0|1713|0|{Write_Multiple_Files|}569|663|}
{2010212001|XXGvertex_oport_oport|1052|0|1715|0|{0|reject|}663|664|}
{2010212001|XXGvertex_oport_oport|1053|0|1717|0|{1|error|}663|665|}
{2010212001|XXGvertex_oport_oport|1054|0|1719|0|{2|log|}663|666|}
{2010211001|XXGvertex_iport_iport|1055|0|1721|0|{0|in|}663|667|}
{2010214001|XXGiport_src_flow|1056|0|1723|0|{0|}667|55|}
{2010006001|XXGobject_psameas_object|1057|0|1724|0|{Layout|Layout|0|0|}663|45|}
{2010006001|XXGobject_psameas_object|1058|0|1725|0|{in_metadata|out_metadata|0|0|}663|53|}
{2010006001|XXGobject_psameas_object|1059|0|1726|0|{reject_metadata|out_metadata|0|0|}663|53|}
{2010211001|XXGvertex_iport_iport|1060|0|1727|0|{0|in0|}569|668|}
{2010215002|XXGiport_binding_iport|1061|0|1729|0|{.5|.5|{0|}11436|}668|653|}
{2010214001|XXGiport_src_flow|1062|0|1730|0|{0|}668|32|}
{2010007001|XXGobject_proto_object|1063|0|1731|0|{}569|669|}
{2010605001|XXGgraph_legend_legend|1064|0|1733|0|{0|}669|670|}
{2010241001|XXGlegend_face_face|1065|0|1735|0|{}670|671|}
{2010605001|XXGgraph_legend_legend|1066|0|1737|0|{1|}669|672|}
{2010241001|XXGlegend_face_face|1067|0|1739|0|{}672|673|}
{2010604001|XXGgraph_flow_flow|1068|0|1741|0|{Flow_1|}669|674|}
{2010604001|XXGgraph_flow_flow|1069|0|1743|0|{Flow_10|}669|675|}
{2010604001|XXGgraph_flow_flow|1070|0|1745|0|{Flow_14|}669|676|}
{2010604001|XXGgraph_flow_flow|1071|0|1747|0|{Flow_5|}669|677|}
{2010604001|XXGgraph_flow_flow|1072|0|1749|0|{Flow_8|}669|678|}
{2010601001|XXGgraph_vertex_vertex|1073|0|1751|0|{Compute_Multiple_Block_Compressed_Lookups|}669|679|}
{2010212001|XXGvertex_oport_oport|1074|0|1753|0|{0|out|}679|680|}
{2010213001|XXGoport_dst_flow|1075|0|1755|0|{0|}680|678|}
{2010212001|XXGvertex_oport_oport|1076|0|1756|0|{1|reject|}679|681|}
{2010212001|XXGvertex_oport_oport|1077|0|1758|0|{2|error|}679|682|}
{2010212001|XXGvertex_oport_oport|1078|0|1760|0|{3|log|}679|683|}
{2010212001|XXGvertex_oport_oport|1079|0|1762|0|{4|address|}679|684|}
{2010211001|XXGvertex_iport_iport|1080|0|1764|0|{0|in|}679|685|}
{2010214001|XXGiport_src_flow|1081|0|1766|0|{0|}685|674|}
{2010007001|XXGobject_proto_object|1082|0|1767|0|{}679|686|}
{2010212001|XXGvertex_oport_oport|1083|0|1769|0|{0|out|}686|687|}
{2010006001|XXGobject_psameas_object|1084|0|1771|0|{metadata|out_metadata|1|0|}687|686|}
{2010212001|XXGvertex_oport_oport|1085|0|1772|0|{1|reject|}686|688|}
{2010006001|XXGobject_psameas_object|1086|0|1774|0|{metadata|reject_metadata|1|0|}688|686|}
{2010212001|XXGvertex_oport_oport|1087|0|1775|0|{2|error|}686|689|}
{2010006001|XXGobject_psameas_object|1088|0|1777|0|{metadata|error_metadata|1|0|}689|686|}
{2010212001|XXGvertex_oport_oport|1089|0|1778|0|{3|log|}686|690|}
{2010006001|XXGobject_psameas_object|1090|0|1780|0|{metadata|log_metadata|1|0|}690|686|}
{2010212001|XXGvertex_oport_oport|1091|0|1781|0|{4|address|}686|691|}
{2010006001|XXGobject_psameas_object|1092|0|1783|0|{metadata|address_metadata|1|0|}691|686|}
{2010211001|XXGvertex_iport_iport|1093|0|1784|0|{0|in|}686|692|}
{2010006001|XXGobject_psameas_object|1094|0|1786|0|{metadata|in_metadata|1|0|}692|686|}
{2010601001|XXGgraph_vertex_vertex|1095|0|1787|0|{Create_Reduced_Aleternate_Data_Source|}669|693|}
{2010604001|XXGgraph_flow_flow|1096|0|1789|0|{Flow_1|}693|694|}
{2010604001|XXGgraph_flow_flow|1097|0|1791|0|{Flow_2|}693|695|}
{2010604001|XXGgraph_flow_flow|1098|0|1793|0|{Flow_3|}693|696|}
{2010601001|XXGgraph_vertex_vertex|1099|0|1795|0|{Create_Main_Reduced_File|}693|697|}
{2010604001|XXGgraph_flow_flow|1100|0|1797|0|{Flow_1|}697|698|}
{2010604001|XXGgraph_flow_flow|1101|0|1799|0|{Flow_14|}697|699|}
{2010601001|XXGgraph_vertex_vertex|1102|0|1801|0|{Compute_Multiple_Block_Compressed_Lookups_1|}697|700|}
{2010212001|XXGvertex_oport_oport|1103|0|1803|0|{0|out|}700|701|}
{2010213001|XXGoport_dst_flow|1104|0|1805|0|{0|}701|699|}
{2010212001|XXGvertex_oport_oport|1105|0|1806|0|{1|reject|}700|702|}
{2010212001|XXGvertex_oport_oport|1106|0|1808|0|{2|error|}700|703|}
{2010212001|XXGvertex_oport_oport|1107|0|1810|0|{3|log|}700|704|}
{2010212001|XXGvertex_oport_oport|1108|0|1812|0|{4|address|}700|705|}
{2010211001|XXGvertex_iport_iport|1109|0|1814|0|{0|in|}700|706|}
{2010214001|XXGiport_src_flow|1110|0|1816|0|{0|}706|698|}
{2010007001|XXGobject_proto_object|1111|0|1817|0|{}700|707|}
{2010212001|XXGvertex_oport_oport|1112|0|1819|0|{0|out|}707|708|}
{2010006001|XXGobject_psameas_object|1113|0|1821|0|{metadata|out_metadata|1|0|}708|707|}
{2010212001|XXGvertex_oport_oport|1114|0|1822|0|{1|reject|}707|709|}
{2010006001|XXGobject_psameas_object|1115|0|1824|0|{metadata|reject_metadata|1|0|}709|707|}
{2010212001|XXGvertex_oport_oport|1116|0|1825|0|{2|error|}707|710|}
{2010006001|XXGobject_psameas_object|1117|0|1827|0|{metadata|error_metadata|1|0|}710|707|}
{2010212001|XXGvertex_oport_oport|1118|0|1828|0|{3|log|}707|711|}
{2010006001|XXGobject_psameas_object|1119|0|1830|0|{metadata|log_metadata|1|0|}711|707|}
{2010212001|XXGvertex_oport_oport|1120|0|1831|0|{4|address|}707|712|}
{2010006001|XXGobject_psameas_object|1121|0|1833|0|{metadata|address_metadata|1|0|}712|707|}
{2010211001|XXGvertex_iport_iport|1122|0|1834|0|{0|in|}707|713|}
{2010006001|XXGobject_psameas_object|1123|0|1836|0|{metadata|in_metadata|1|0|}713|707|}
{2010601001|XXGgraph_vertex_vertex|1124|0|1837|0|{Drop_columns|}697|714|}
{2010212001|XXGvertex_oport_oport|1125|0|1839|0|{0|out0|}714|715|}
{2010213001|XXGoport_dst_flow|1126|0|1841|0|{0|}715|698|}
{2010212001|XXGvertex_oport_oport|1127|0|1842|0|{1|reject0|}714|716|}
{2010212001|XXGvertex_oport_oport|1128|0|1844|0|{2|error0|}714|717|}
{2010212001|XXGvertex_oport_oport|1129|0|1846|0|{3|log|}714|718|}
{2010211001|XXGvertex_iport_iport|1130|0|1848|0|{0|in|}714|719|}
{2010007001|XXGobject_proto_object|1131|0|1850|0|{}714|720|}
{2010212001|XXGvertex_oport_oport|1132|0|1852|0|{0|out0|}720|721|}
{2010006001|XXGobject_psameas_object|1133|0|1854|0|{metadata|out0_metadata|1|0|}721|720|}
{2010006001|XXGobject_psameas_object|1134|0|1855|0|{transform0|transform0|1|0|}721|720|}
{2010212001|XXGvertex_oport_oport|1135|0|1856|0|{1|reject0|}720|722|}
{2010006001|XXGobject_psameas_object|1136|0|1858|0|{metadata|reject0_metadata|1|0|}722|720|}
{2010212001|XXGvertex_oport_oport|1137|0|1859|0|{2|error0|}720|723|}
{2010006001|XXGobject_psameas_object|1138|0|1861|0|{metadata|error0_metadata|1|0|}723|720|}
{2010212001|XXGvertex_oport_oport|1139|0|1862|0|{3|log|}720|724|}
{2010006001|XXGobject_psameas_object|1140|0|1864|0|{metadata|log_metadata|1|0|}724|720|}
{2010211001|XXGvertex_iport_iport|1141|0|1865|0|{0|in|}720|725|}
{2010006001|XXGobject_psameas_object|1142|0|1867|0|{metadata|in_metadata|1|0|}725|720|}
{2010601001|XXGgraph_vertex_vertex|1143|0|1868|0|{Write_Multiple_Files_1|}697|726|}
{2010212001|XXGvertex_oport_oport|1144|0|1870|0|{0|reject|}726|727|}
{2010212001|XXGvertex_oport_oport|1145|0|1872|0|{1|error|}726|728|}
{2010212001|XXGvertex_oport_oport|1146|0|1874|0|{2|log|}726|729|}
{2010211001|XXGvertex_iport_iport|1147|0|1876|0|{0|in|}726|730|}
{2010214001|XXGiport_src_flow|1148|0|1878|0|{0|}730|699|}
{2010007001|XXGobject_proto_object|1149|0|1879|0|{}726|731|}
{2010212001|XXGvertex_oport_oport|1150|0|1881|0|{0|reject|}731|732|}
{2010006001|XXGobject_psameas_object|1151|0|1883|0|{metadata|reject_metadata|1|0|}732|731|}
{2010212001|XXGvertex_oport_oport|1152|0|1884|0|{1|error|}731|733|}
{2010006001|XXGobject_psameas_object|1153|0|1886|0|{metadata|error_metadata|1|0|}733|731|}
{2010212001|XXGvertex_oport_oport|1154|0|1887|0|{2|log|}731|734|}
{2010006001|XXGobject_psameas_object|1155|0|1889|0|{metadata|log_metadata|1|0|}734|731|}
{2010211001|XXGvertex_iport_iport|1156|0|1890|0|{0|in|}731|735|}
{2010006001|XXGobject_psameas_object|1157|0|1892|0|{metadata|in_metadata|1|0|}735|731|}
{2010211001|XXGvertex_iport_iport|1158|0|1893|0|{0|in0|}697|736|}
{2010215002|XXGiport_binding_iport|1159|0|1895|0|{.5|.5|{0|}11409|}736|719|}
{2010214001|XXGiport_src_flow|1160|0|1896|0|{0|}736|695|}
{2010601001|XXGgraph_vertex_vertex|1161|0|1897|0|{Create_Step2_Reduced_File|}693|737|}
{2010604001|XXGgraph_flow_flow|1162|0|1899|0|{Flow_1|}737|738|}
{2010604001|XXGgraph_flow_flow|1163|0|1901|0|{Flow_14|}737|739|}
{2010601001|XXGgraph_vertex_vertex|1164|0|1903|0|{Compute_Multiple_Block_Compressed_Lookups_1|}737|740|}
{2010212001|XXGvertex_oport_oport|1165|0|1905|0|{0|out|}740|741|}
{2010213001|XXGoport_dst_flow|1166|0|1907|0|{0|}741|739|}
{2010212001|XXGvertex_oport_oport|1167|0|1908|0|{1|reject|}740|742|}
{2010212001|XXGvertex_oport_oport|1168|0|1910|0|{2|error|}740|743|}
{2010212001|XXGvertex_oport_oport|1169|0|1912|0|{3|log|}740|744|}
{2010212001|XXGvertex_oport_oport|1170|0|1914|0|{4|address|}740|745|}
{2010211001|XXGvertex_iport_iport|1171|0|1916|0|{0|in|}740|746|}
{2010214001|XXGiport_src_flow|1172|0|1918|0|{0|}746|738|}
{2010007001|XXGobject_proto_object|1173|0|1919|0|{}740|747|}
{2010212001|XXGvertex_oport_oport|1174|0|1921|0|{0|out|}747|748|}
{2010006001|XXGobject_psameas_object|1175|0|1923|0|{metadata|out_metadata|1|0|}748|747|}
{2010212001|XXGvertex_oport_oport|1176|0|1924|0|{1|reject|}747|749|}
{2010006001|XXGobject_psameas_object|1177|0|1926|0|{metadata|reject_metadata|1|0|}749|747|}
{2010212001|XXGvertex_oport_oport|1178|0|1927|0|{2|error|}747|750|}
{2010006001|XXGobject_psameas_object|1179|0|1929|0|{metadata|error_metadata|1|0|}750|747|}
{2010212001|XXGvertex_oport_oport|1180|0|1930|0|{3|log|}747|751|}
{2010006001|XXGobject_psameas_object|1181|0|1932|0|{metadata|log_metadata|1|0|}751|747|}
{2010212001|XXGvertex_oport_oport|1182|0|1933|0|{4|address|}747|752|}
{2010006001|XXGobject_psameas_object|1183|0|1935|0|{metadata|address_metadata|1|0|}752|747|}
{2010211001|XXGvertex_iport_iport|1184|0|1936|0|{0|in|}747|753|}
{2010006001|XXGobject_psameas_object|1185|0|1938|0|{metadata|in_metadata|1|0|}753|747|}
{2010006001|XXGobject_psameas_object|1186|0|1939|0|{reject_metadata|in_metadata|0|0|}740|740|}
{2010601001|XXGgraph_vertex_vertex|1187|0|1940|0|{Drop_columns|}737|754|}
{2010212001|XXGvertex_oport_oport|1188|0|1942|0|{0|out0|}754|755|}
{2010213001|XXGoport_dst_flow|1189|0|1944|0|{0|}755|738|}
{2010212001|XXGvertex_oport_oport|1190|0|1945|0|{1|reject0|}754|756|}
{2010212001|XXGvertex_oport_oport|1191|0|1947|0|{2|error0|}754|757|}
{2010212001|XXGvertex_oport_oport|1192|0|1949|0|{3|log|}754|758|}
{2010211001|XXGvertex_iport_iport|1193|0|1951|0|{0|in|}754|759|}
{2010007001|XXGobject_proto_object|1194|0|1953|0|{}754|760|}
{2010212001|XXGvertex_oport_oport|1195|0|1955|0|{0|out0|}760|761|}
{2010006001|XXGobject_psameas_object|1196|0|1957|0|{metadata|out0_metadata|1|0|}761|760|}
{2010006001|XXGobject_psameas_object|1197|0|1958|0|{transform0|transform0|1|0|}761|760|}
{2010212001|XXGvertex_oport_oport|1198|0|1959|0|{1|reject0|}760|762|}
{2010006001|XXGobject_psameas_object|1199|0|1961|0|{metadata|reject0_metadata|1|0|}762|760|}
{2010212001|XXGvertex_oport_oport|1200|0|1962|0|{2|error0|}760|763|}
{2010006001|XXGobject_psameas_object|1201|0|1964|0|{metadata|error0_metadata|1|0|}763|760|}
{2010212001|XXGvertex_oport_oport|1202|0|1965|0|{3|log|}760|764|}
{2010006001|XXGobject_psameas_object|1203|0|1967|0|{metadata|log_metadata|1|0|}764|760|}
{2010211001|XXGvertex_iport_iport|1204|0|1968|0|{0|in|}760|765|}
{2010006001|XXGobject_psameas_object|1205|0|1970|0|{metadata|in_metadata|1|0|}765|760|}
{2010601001|XXGgraph_vertex_vertex|1206|0|1971|0|{Write_Multiple_Files_1|}737|766|}
{2010212001|XXGvertex_oport_oport|1207|0|1973|0|{0|reject|}766|767|}
{2010212001|XXGvertex_oport_oport|1208|0|1975|0|{1|error|}766|768|}
{2010212001|XXGvertex_oport_oport|1209|0|1977|0|{2|log|}766|769|}
{2010211001|XXGvertex_iport_iport|1210|0|1979|0|{0|in|}766|770|}
{2010214001|XXGiport_src_flow|1211|0|1981|0|{0|}770|739|}
{2010007001|XXGobject_proto_object|1212|0|1982|0|{}766|771|}
{2010212001|XXGvertex_oport_oport|1213|0|1984|0|{0|reject|}771|772|}
{2010006001|XXGobject_psameas_object|1214|0|1986|0|{metadata|reject_metadata|1|0|}772|771|}
{2010212001|XXGvertex_oport_oport|1215|0|1987|0|{1|error|}771|773|}
{2010006001|XXGobject_psameas_object|1216|0|1989|0|{metadata|error_metadata|1|0|}773|771|}
{2010212001|XXGvertex_oport_oport|1217|0|1990|0|{2|log|}771|774|}
{2010006001|XXGobject_psameas_object|1218|0|1992|0|{metadata|log_metadata|1|0|}774|771|}
{2010211001|XXGvertex_iport_iport|1219|0|1993|0|{0|in|}771|775|}
{2010006001|XXGobject_psameas_object|1220|0|1995|0|{metadata|in_metadata|1|0|}775|771|}
{2010211001|XXGvertex_iport_iport|1221|0|1996|0|{0|in0|}737|776|}
{2010215002|XXGiport_binding_iport|1222|0|1998|0|{.5|.5|{0|}11418|}776|759|}
{2010214001|XXGiport_src_flow|1223|0|1999|0|{0|}776|694|}
{2010601001|XXGgraph_vertex_vertex|1224|0|2000|0|{Create_Step3_Reduced_File|}693|777|}
{2010604001|XXGgraph_flow_flow|1225|0|2002|0|{Flow_1|}777|778|}
{2010604001|XXGgraph_flow_flow|1226|0|2004|0|{Flow_14|}777|779|}
{2010601001|XXGgraph_vertex_vertex|1227|0|2006|0|{Compute_Multiple_Block_Compressed_Lookups_1|}777|780|}
{2010212001|XXGvertex_oport_oport|1228|0|2008|0|{0|out|}780|781|}
{2010213001|XXGoport_dst_flow|1229|0|2010|0|{0|}781|779|}
{2010212001|XXGvertex_oport_oport|1230|0|2011|0|{1|reject|}780|782|}
{2010212001|XXGvertex_oport_oport|1231|0|2013|0|{2|error|}780|783|}
{2010212001|XXGvertex_oport_oport|1232|0|2015|0|{3|log|}780|784|}
{2010212001|XXGvertex_oport_oport|1233|0|2017|0|{4|address|}780|785|}
{2010211001|XXGvertex_iport_iport|1234|0|2019|0|{0|in|}780|786|}
{2010214001|XXGiport_src_flow|1235|0|2021|0|{0|}786|778|}
{2010007001|XXGobject_proto_object|1236|0|2022|0|{}780|787|}
{2010212001|XXGvertex_oport_oport|1237|0|2024|0|{0|out|}787|788|}
{2010006001|XXGobject_psameas_object|1238|0|2026|0|{metadata|out_metadata|1|0|}788|787|}
{2010212001|XXGvertex_oport_oport|1239|0|2027|0|{1|reject|}787|789|}
{2010006001|XXGobject_psameas_object|1240|0|2029|0|{metadata|reject_metadata|1|0|}789|787|}
{2010212001|XXGvertex_oport_oport|1241|0|2030|0|{2|error|}787|790|}
{2010006001|XXGobject_psameas_object|1242|0|2032|0|{metadata|error_metadata|1|0|}790|787|}
{2010212001|XXGvertex_oport_oport|1243|0|2033|0|{3|log|}787|791|}
{2010006001|XXGobject_psameas_object|1244|0|2035|0|{metadata|log_metadata|1|0|}791|787|}
{2010212001|XXGvertex_oport_oport|1245|0|2036|0|{4|address|}787|792|}
{2010006001|XXGobject_psameas_object|1246|0|2038|0|{metadata|address_metadata|1|0|}792|787|}
{2010211001|XXGvertex_iport_iport|1247|0|2039|0|{0|in|}787|793|}
{2010006001|XXGobject_psameas_object|1248|0|2041|0|{metadata|in_metadata|1|0|}793|787|}
{2010006001|XXGobject_psameas_object|1249|0|2042|0|{reject_metadata|in_metadata|0|0|}780|780|}
{2010601001|XXGgraph_vertex_vertex|1250|0|2043|0|{Drop_columns|}777|794|}
{2010212001|XXGvertex_oport_oport|1251|0|2045|0|{0|out0|}794|795|}
{2010213001|XXGoport_dst_flow|1252|0|2047|0|{0|}795|778|}
{2010212001|XXGvertex_oport_oport|1253|0|2048|0|{1|reject0|}794|796|}
{2010212001|XXGvertex_oport_oport|1254|0|2050|0|{2|error0|}794|797|}
{2010212001|XXGvertex_oport_oport|1255|0|2052|0|{3|log|}794|798|}
{2010211001|XXGvertex_iport_iport|1256|0|2054|0|{0|in|}794|799|}
{2010007001|XXGobject_proto_object|1257|0|2056|0|{}794|800|}
{2010212001|XXGvertex_oport_oport|1258|0|2058|0|{0|out0|}800|801|}
{2010006001|XXGobject_psameas_object|1259|0|2060|0|{metadata|out0_metadata|1|0|}801|800|}
{2010006001|XXGobject_psameas_object|1260|0|2061|0|{transform0|transform0|1|0|}801|800|}
{2010212001|XXGvertex_oport_oport|1261|0|2062|0|{1|reject0|}800|802|}
{2010006001|XXGobject_psameas_object|1262|0|2064|0|{metadata|reject0_metadata|1|0|}802|800|}
{2010212001|XXGvertex_oport_oport|1263|0|2065|0|{2|error0|}800|803|}
{2010006001|XXGobject_psameas_object|1264|0|2067|0|{metadata|error0_metadata|1|0|}803|800|}
{2010212001|XXGvertex_oport_oport|1265|0|2068|0|{3|log|}800|804|}
{2010006001|XXGobject_psameas_object|1266|0|2070|0|{metadata|log_metadata|1|0|}804|800|}
{2010211001|XXGvertex_iport_iport|1267|0|2071|0|{0|in|}800|805|}
{2010006001|XXGobject_psameas_object|1268|0|2073|0|{metadata|in_metadata|1|0|}805|800|}
{2010601001|XXGgraph_vertex_vertex|1269|0|2074|0|{Write_Multiple_Files_1|}777|806|}
{2010212001|XXGvertex_oport_oport|1270|0|2076|0|{0|reject|}806|807|}
{2010212001|XXGvertex_oport_oport|1271|0|2078|0|{1|error|}806|808|}
{2010212001|XXGvertex_oport_oport|1272|0|2080|0|{2|log|}806|809|}
{2010211001|XXGvertex_iport_iport|1273|0|2082|0|{0|in|}806|810|}
{2010214001|XXGiport_src_flow|1274|0|2084|0|{0|}810|779|}
{2010007001|XXGobject_proto_object|1275|0|2085|0|{}806|811|}
{2010212001|XXGvertex_oport_oport|1276|0|2087|0|{0|reject|}811|812|}
{2010006001|XXGobject_psameas_object|1277|0|2089|0|{metadata|reject_metadata|1|0|}812|811|}
{2010212001|XXGvertex_oport_oport|1278|0|2090|0|{1|error|}811|813|}
{2010006001|XXGobject_psameas_object|1279|0|2092|0|{metadata|error_metadata|1|0|}813|811|}
{2010212001|XXGvertex_oport_oport|1280|0|2093|0|{2|log|}811|814|}
{2010006001|XXGobject_psameas_object|1281|0|2095|0|{metadata|log_metadata|1|0|}814|811|}
{2010211001|XXGvertex_iport_iport|1282|0|2096|0|{0|in|}811|815|}
{2010006001|XXGobject_psameas_object|1283|0|2098|0|{metadata|in_metadata|1|0|}815|811|}
{2010211001|XXGvertex_iport_iport|1284|0|2099|0|{0|in0|}777|816|}
{2010215002|XXGiport_binding_iport|1285|0|2101|0|{.5|.5|{0|}11428|}816|799|}
{2010214001|XXGiport_src_flow|1286|0|2102|0|{0|}816|696|}
{2010601001|XXGgraph_vertex_vertex|1287|0|2103|0|{Replicate|}693|817|}
{2010212001|XXGvertex_oport_oport|1288|0|2105|0|{0|out|}817|818|}
{2010213001|XXGoport_dst_flow|1289|0|2107|0|{0|}818|695|}
{2010213001|XXGoport_dst_flow|1290|0|2108|0|{1|}818|694|}
{2010213001|XXGoport_dst_flow|1291|0|2109|0|{2|}818|696|}
{2010211001|XXGvertex_iport_iport|1292|0|2110|0|{0|in|}817|819|}
{2010007001|XXGobject_proto_object|1293|0|2112|0|{}817|820|}
{2010212001|XXGvertex_oport_oport|1294|0|2114|0|{0|out|}820|821|}
{2010006001|XXGobject_psameas_object|1295|0|2116|0|{metadata|out_metadata|1|0|}821|820|}
{2010211001|XXGvertex_iport_iport|1296|0|2117|0|{0|in|}820|822|}
{2010006001|XXGobject_psameas_object|1297|0|2119|0|{metadata|in_metadata|1|0|}822|820|}
{2010211001|XXGvertex_iport_iport|1298|0|2120|0|{0|in0|}693|823|}
{2010215002|XXGiport_binding_iport|1299|0|2122|0|{.5|.5|{0|}11432|}823|819|}
{2010214001|XXGiport_src_flow|1300|0|2123|0|{0|}823|676|}
{2010601001|XXGgraph_vertex_vertex|1301|0|2124|0|{Replicate|}669|824|}
{2010212001|XXGvertex_oport_oport|1302|0|2126|0|{0|out|}824|825|}
{2010213001|XXGoport_dst_flow|1303|0|2128|0|{0|}825|674|}
{2010213001|XXGoport_dst_flow|1304|0|2129|0|{1|}825|675|}
{2010213001|XXGoport_dst_flow|1305|0|2130|0|{2|}825|676|}
{2010211001|XXGvertex_iport_iport|1306|0|2131|0|{0|in|}824|826|}
{2010007001|XXGobject_proto_object|1307|0|2133|0|{}824|827|}
{2010212001|XXGvertex_oport_oport|1308|0|2135|0|{0|out|}827|828|}
{2010006001|XXGobject_psameas_object|1309|0|2137|0|{metadata|out_metadata|1|0|}828|827|}
{2010211001|XXGvertex_iport_iport|1310|0|2138|0|{0|in|}827|829|}
{2010006001|XXGobject_psameas_object|1311|0|2140|0|{metadata|in_metadata|1|0|}829|827|}
{2010601001|XXGgraph_vertex_vertex|1312|0|2141|0|{Sort_on_INDEX_FIELD|}669|830|}
{2010212001|XXGvertex_oport_oport|1313|0|2143|0|{0|out|}830|831|}
{2010213001|XXGoport_dst_flow|1314|0|2145|0|{0|}831|677|}
{2010211001|XXGvertex_iport_iport|1315|0|2146|0|{0|in|}830|832|}
{2010214001|XXGiport_src_flow|1316|0|2148|0|{0|}832|675|}
{2010007001|XXGobject_proto_object|1317|0|2149|0|{}830|833|}
{2010212001|XXGvertex_oport_oport|1318|0|2151|0|{0|out|}833|834|}
{2010006001|XXGobject_psameas_object|1319|0|2153|0|{metadata|out_metadata|1|0|}834|833|}
{2010211001|XXGvertex_iport_iport|1320|0|2154|0|{0|in|}833|835|}
{2010006001|XXGobject_psameas_object|1321|0|2156|0|{metadata|in_metadata|1|0|}835|833|}
{2010601001|XXGgraph_vertex_vertex|1322|0|2157|0|{Write_Date_wise_ICFFs_for_additional_index|}669|836|}
{2010212001|XXGvertex_oport_oport|1323|0|2159|0|{0|reject|}836|837|}
{2010212001|XXGvertex_oport_oport|1324|0|2161|0|{1|error|}836|838|}
{2010212001|XXGvertex_oport_oport|1325|0|2163|0|{2|log|}836|839|}
{2010212001|XXGvertex_oport_oport|1326|0|2165|0|{3|address|}836|840|}
{2010211001|XXGvertex_iport_iport|1327|0|2167|0|{0|in|}836|841|}
{2010214001|XXGiport_src_flow|1328|0|2169|0|{0|}841|677|}
{2010007001|XXGobject_proto_object|1329|0|2170|0|{}836|842|}
{2010212001|XXGvertex_oport_oport|1330|0|2172|0|{0|reject|}842|843|}
{2010006001|XXGobject_psameas_object|1331|0|2174|0|{metadata|reject_metadata|1|0|}843|842|}
{2010212001|XXGvertex_oport_oport|1332|0|2175|0|{1|error|}842|844|}
{2010006001|XXGobject_psameas_object|1333|0|2177|0|{metadata|error_metadata|1|0|}844|842|}
{2010212001|XXGvertex_oport_oport|1334|0|2178|0|{2|log|}842|845|}
{2010006001|XXGobject_psameas_object|1335|0|2180|0|{metadata|log_metadata|1|0|}845|842|}
{2010212001|XXGvertex_oport_oport|1336|0|2181|0|{3|address|}842|846|}
{2010006001|XXGobject_psameas_object|1337|0|2183|0|{metadata|address_metadata|1|0|}846|842|}
{2010211001|XXGvertex_iport_iport|1338|0|2184|0|{0|in|}842|847|}
{2010006001|XXGobject_psameas_object|1339|0|2186|0|{metadata|in_metadata|1|0|}847|842|}
{2010601001|XXGgraph_vertex_vertex|1340|0|2187|0|{Write_Multiple_Files|}669|848|}
{2010212001|XXGvertex_oport_oport|1341|0|2189|0|{0|reject|}848|849|}
{2010212001|XXGvertex_oport_oport|1342|0|2191|0|{1|error|}848|850|}
{2010212001|XXGvertex_oport_oport|1343|0|2193|0|{2|log|}848|851|}
{2010211001|XXGvertex_iport_iport|1344|0|2195|0|{0|in|}848|852|}
{2010214001|XXGiport_src_flow|1345|0|2197|0|{0|}852|678|}
{2010007001|XXGobject_proto_object|1346|0|2198|0|{}848|853|}
{2010212001|XXGvertex_oport_oport|1347|0|2200|0|{0|reject|}853|854|}
{2010006001|XXGobject_psameas_object|1348|0|2202|0|{metadata|reject_metadata|1|0|}854|853|}
{2010212001|XXGvertex_oport_oport|1349|0|2203|0|{1|error|}853|855|}
{2010006001|XXGobject_psameas_object|1350|0|2205|0|{metadata|error_metadata|1|0|}855|853|}
{2010212001|XXGvertex_oport_oport|1351|0|2206|0|{2|log|}853|856|}
{2010006001|XXGobject_psameas_object|1352|0|2208|0|{metadata|log_metadata|1|0|}856|853|}
{2010211001|XXGvertex_iport_iport|1353|0|2209|0|{0|in|}853|857|}
{2010006001|XXGobject_psameas_object|1354|0|2211|0|{metadata|in_metadata|1|0|}857|853|}
{2010211001|XXGvertex_iport_iport|1355|0|2212|0|{0|in0|}669|858|}
{2010215002|XXGiport_binding_iport|1356|0|2214|0|{.5|.5|{0|}11428|}858|826|}
{2010109001|XXGobject_property_value|1357|0|2215|0|{0|TrackingThumbprint|72|}1|859|}
