@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|859|rel_count|1341|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.4.1|3|9|P|@{0|}}
{30001002|XXparameter|_____Intermediate_Pset_Parameters_________|@3|9|K|@{0|}}
{30001002|XXparameter|AI_DML|$AI_DML|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_SERIAL_TEMP|$AI_SERIAL_TEMP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_MFS_TEMP|$AI_MFS_TEMP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_MFS|$AI_MFS|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_SERIAL|$AI_SERIAL|3|9|FK|@{0|}}
{30001002|XXparameter|AI_SERIAL_LOOKUP|$AI_SERIAL_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_MFS_LOOKUP|$AI_MFS_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|AI_SERIAL_LOG|$AI_SERIAL_LOG|3|9|EFK|@{0|}}
{30001002|XXparameter|REMOTE_MFS|$[REMOTE_MFS]|3|9|RFK|The MFS System to write to : Default is RMEOTE_MFS as the graph is supposed to write to Query>It box from ETL Box. However, if the need be, switch it to AI_MFS in PSETs and you can write to ETL Box. Note that the components downstream of Partitioning will use this as a LAYOUT.|{0|}}
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
{30001002|XXparameter|OUTPUT_FILE__copy__|$[ if (OUTPUT_DATASET_TYPE == 'REFERENCE'  )
string_concat(AI_MFS_LOOKUP ,'/' , CLEAN_OUT_FILE_FOR_NAME , '.dat')
else if ( OUTPUT_DATASET_TYPE == 'TRANSACTION' && CREATE_ICFF && WRITE_MULTIPLE_ICFF  )
string_concat(AI_MFS ,'/' ,MULTIPLE_ICFF_SUB_DIR, '/', CLEAN_OUT_FILE_FOR_NAME , '.dat.gz')

else if ( OUTPUT_DATASET_TYPE == 'TRANSACTION' && CREATE_ICFF  )

string_concat(AI_MFS ,'/' , CLEAN_OUT_FILE_FOR_NAME , '.dat.gz')
else 
string_concat(AI_MFS ,'/' , CLEAN_OUT_FILE_FOR_NAME , '.dat')
]|3|9|RK|Location of query it target dataset|{0|}}
{30001002|XXparameter|OUTPUT_FILE|$[ if( OUTPUT_DATASET_TYPE == 'REFERENCE')
     string_concat( REMOTE_MFS_LOOKUP, '/', CLEAN_OUT_FILE_FOR_NAME, '.dat')
   else 
     if( OUTPUT_DATASET_TYPE == 'TRANSACTION' && CREATE_ICFF && WRITE_MULTIPLE_ICFF)
       string_concat( REMOTE_MFS, '/', MULTIPLE_ICFF_SUB_DIR, '/', CLEAN_OUT_FILE_FOR_NAME, '.dat.gz')
     else 
       if( OUTPUT_DATASET_TYPE == 'TRANSACTION' && CREATE_ICFF)
         string_concat( REMOTE_MFS, '/', CLEAN_OUT_FILE_FOR_NAME, '.dat.gz')
       else
         string_concat( REMOTE_MFS, '/', CLEAN_OUT_FILE_FOR_NAME, '.dat')
]|3|9|RFK|Location of query it target dataset|{0|}}
{30001002|XXparameter|INDEX_FILE|$[if(string_index(OUTPUT_FILE ,".dat.gz"))
string_replace(OUTPUT_FILE, ".dat.gz", ".idx")
else
string_replace(OUTPUT_FILE, ".dat", ".idx")
]|3|9|K|Create name of index file from Output file |{0|}}
{30001002|XXparameter|CHECK_MULTIPLE_ICFF_DIR|$[if(is_blank(MULTIPLE_ICFF_SUB_DIR) and WRITE_MULTIPLE_ICFF) force_abort("If You want to create multiple ICFF , please provide subdirectory") else 0]|3|9|K|@{0|}}
{30001002|XXparameter|FIRST_FILE|$[first_without_error(INPUT_FILE_LOCATION + directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)[0]  , "NO_Matching_File" )]|3|9|K|A indicator first file to view data of file , In case of multiple file matching pattern only one file will be visible here|{0|}}
{30001002|XXparameter|XREF_FILE|file:$\{AI_SERIAL_LOOKUP\}/$\{MULTIPLE_ICFF_SUB_DIR\}/$\{CLEAN_OUT_FILE_FOR_NAME\}_xref.$KEY.$INDEX_FIELD.dat|3|9|K|@{0|}}
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
{30001002|XXparameter|PARTITIONING_METHOD|$[ 

/*
PBKS :: $[!is_blank(KEY) && not USE_DEFAULT_PARTITION ]
Replicate :: $[USE_DEFAULT_PARTITION ]
PBRR :: $[is_blank(KEY) && not USE_DEFAULT_PARTITION ]
*/
//The partitioning scheme for the data : can be PBKS, PBRR or replicate ( No Sort No Partitioning : NSNP) )
//if the data needs to be partitioined on a key, PBKS is used, otherwise, PBRR is used unless the input data is already partitioned and has the same depth as the output.
( USE_DEFAULT_PARTITION)? ( ( length_of( multifile_information( INPUT_FILE_LOCATION).paths) == length_of( multifile_information( OUTPUT_FILE).paths))? 'NSNP':'PBRR'): ( is_blank( KEY) ? 'PBRR': 'PBKS')
]|3|9|RFK|How to partition the data - can be 'NSNP', 'PBRR' or 'PBKS'.|{0|}}
{30001002|XXparameter|PARTITIONING_LAYOUT|$[ INPUT_FILE_LOCATION]|3|9|FK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|Comment___Layout__Parameters|### Parameters to Decide the Layout of the Components|3|9|K|@{0|}}
{30001002|XXparameter|LOCAL_SERIAL_LAYOUT|$AI_SERIAL|3|9|RFK|LOCAL_SERIAL_LAYOUT : Default LOCAL_SERIAL_LAYOUT from project pset|{0|}}
{30001002|XXparameter|LOCAL_MFS_LAYOUT|$AI_MFS|3|9|RFK|LOCAL_MFS_LAYOUT : default LOCAL_MFS_LAYOUT from project.pset|{0|}}
{30001002|XXparameter|LOCAL_MFS_24WAY_LAYOUT|@3|9|FK|@{0|}}
{30001002|XXparameter|REMOTE_SERIAL_LAYOUT|$REMOTE_SERIAL|3|9|RFK|REMOTE_SERIAL_LAYOUT : default REMOTE_SERIAL_LAYOUT from .project.pset|{0|}}
{30001002|XXparameter|REMOTE_MFS_LAYOUT|$REMOTE_MFS|3|9|RFK|REMOTE_MFS_LAYOUT : default REMOTE_MFS_LAYOUT from project.pset|{0|}}
{30001002|XXparameter|LOCAL_INPUT_COMPONENT_LAYOUT||3|9|RFK|@{0|}}
{30001002|XXparameter|LOCAL_OUTPUT_COMPONENT_LAYOUT||3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|bkp_create_data_source|bfisher|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1989000|743000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|0|0|}Job 'create_data_source' Execution Status Report

||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Egvd_Normal||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@$[!is_blank(KEY) &&
 PARTITIONING_METHOD == 'PBKS'|954000|254000|0|0|0|0|11830|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@
PARTITIONING_METHOD == 'PBRR'|964000|584000|0|0|0|0|11950|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Disabled input file component to view data of first file|16000|676000|36000|51000|315000|64000|11784|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@
Generic graph to create output data source for query it ,This
graph will create 3 type of output file based on input conditions specified:

1.MFS Output file
2.Single ICFF
3.Multiple ICFF 
4.In flow 3 itself , write Xref file along with Multiple ICFF file in specified subdirectory
|216000|26000|36000|51000|315000|64000|11899|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@Only one output flow will be enabled
 based on specified condition|1248000|255000|36000|51000|315000|64000|11755|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|15|0|29|0|{@{}@Condition:
$[not CREATE_ICFF and  not WRITE_MULTIPLE_ICFF]|1654000|204000|0|0|0|0|11953|}}
{2010242002|XXGface|16|0|31|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|17|0|33|0|{@{}@condition:
$[CREATE_ICFF && not WRITE_MULTIPLE_ICFF ]|1639000|429000|0|0|0|0|11954|}}
{2010242002|XXGface|18|0|35|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|19|0|37|0|{@{}@condition:
$[CREATE_ICFF && WRITE_MULTIPLE_ICFF ]|1634000|689000|0|0|0|0|11754|}}
{2010242002|XXGface|20|0|39|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|21|0|41|0|{@{}@$AI_SERIAL_LOG : 
Count detail|799000|689000|0|0|0|0|11793|}}
{2010242002|XXGface|22|0|43|0|{@{}@Arial|32768|110|0|}}
{2010240003|XXGlegend|23|0|45|0|{@{}@
PARTITIONING_METHOD == 'NSNP'|949000|436000|0|0|0|0|11946|}}
{2010242002|XXGface|24|0|47|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}11957|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}11947|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}11941|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}11797|531|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}11795|529|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}11951|529|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}11924|17|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{0|}11958|17|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.5|{0|}11920|529|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}11955|17|}}
{2010210004|XXGflow|35|0|69|0|{@{}@384|.5|.5|{0|}11943|529|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}11937|529|}}
{2010210004|XXGflow|37|0|73|0|{@{}@384|.5|.5|{0|}11948|529|}}
{2010501005|XXGpvertex|38|0|75|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
}}@0|@1324000|665000|0|0|0|0|11785|Dummy - Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32833|1|{1|0|}}}
{2010203004|XXGoport|39|0|77|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|40|0|79|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|41|0|81|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|42|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|43|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|44|0|89|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@749000|355000|0|0|0|0|11945|Dummy- Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|45|0|91|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|46|0|96|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|47|0|99|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|48|0|101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|49|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|50|0|107|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|51|0|109|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010210004|XXGflow|52|0|111|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}8|20|}}
{2010202004|XXGiport|53|0|113|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|54|0|115|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@254000|10000|0|0|0|0|11446|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|55|0|117|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|56|0|119|0|{@{}@384|.5|.5|{0|}11447|17|}}
{2010203004|XXGoport|57|0|121|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|58|0|123|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|59|0|125|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|60|0|127|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|61|0|129|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|62|0|131|0|{@{}@384|.5|.5|{0|}11444|17|}}
{2010501005|XXGpvertex|63|0|137|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1368000|354500|0|0|0|0|11919|Dummy Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|139|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|65|0|144|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|66|0|149|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|67|0|151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|68|0|154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|69|0|157|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@285000|131000|0|0|0|0|10675|ICFF Data|Ab Initio Software|@1|1000|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|70|0|159|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|71|0|161|0|{@{}@384|.5|.5|{0|}10674|2065|}}
{2010202004|XXGiport|72|0|163|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|73|0|165|0|{@{}@384|.5|.5|{0|}10677|17|}}
{2010503005|XXGfvertex|74|0|167|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|75|0|169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|76|0|172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|77|0|179|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|DATA_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|@450000|476500|0|0|0|0|11798|Get Log|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|78|0|181|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|79|0|184|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|80|0|186|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|81|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|82|0|191|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|83|0|194|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_group|DATA_SOURCE|3|2|$|@{0|}}
{30001002|XXparameter|transform0|$DEFAULT_XFR|3|9||@{0|}}
{30001002|XXparameter|select|$FINAL_SELECT|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@446000|330000|0|0|0|0|11902|Trim Strings|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|84|0|196|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|85|0|199|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|86|0|201|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|87|0|203|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|88|0|205|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|89|0|208|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|90|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|91|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|92|0|217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|93|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|94|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|95|0|227|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@421000|334500|0|0|0|0|2249|Read All Matching Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|96|0|229|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|97|0|231|0|{@{}@384|.5|.5|{0|}2250|1041|}}
{2010203004|XXGoport|98|0|233|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|99|0|235|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|100|0|237|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|101|0|239|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|102|0|241|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|103|0|243|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|104|0|245|0|{@{}@384|.5|.5|{0|}2248|18|}}
{2010501005|XXGpvertex|105|0|247|0|{|{}@0|@65000|424000|0|0|0|0|2224|List Files|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|106|0|249|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|107|0|251|0|{@{}@384|.5|.5|{0|}2225|17|}}
{2010203004|XXGoport|108|0|253|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|109|0|255|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|110|0|261|0|{Subgraph created from graph "enrich"|{}@0|@576250|587250|0|0|0|0|11796|Get Record count|Mukesh.Singh|Created 8/21/2015 9:18:26 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|490000|163000|3|}}
{2010210004|XXGflow|111|0|263|0|{@{}@384|.5|.5|{0|}11110|17|}}
{2010243001|XXGwatcher|112|0|265|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|113|0|267|0|{@{}@384|.5|.5|{0|}11104|17|}}
{2010243001|XXGwatcher|114|0|269|0|{@{}@1|100|0||0|}}
{2010501005|XXGpvertex|115|0|271|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
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
{2010203004|XXGoport|116|0|273|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|117|0|275|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|118|0|277|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|119|0|279|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|120|0|281|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|121|0|284|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|122|0|286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|123|0|289|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|124|0|292|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|125|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|126|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|127|0|301|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/audit_count_computed_source.dml|3|2|f$|@{0|}}
}}@0|@815000|611500|0|0|0|0|11794|Output File|Ab Initio Software|@1|1000|0|@6||33025|-1|-1|}}
{2010202004|XXGiport|128|0|303|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|129|0|306|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|130|0|308|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|131|0|311|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
{2010203004|XXGoport|132|0|313|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|133|0|316|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|134|0|318|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|135|0|320|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|136|0|322|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|137|0|325|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|138|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|139|0|331|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|140|0|334|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|141|0|337|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|142|0|340|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|143|0|348|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@52000|65000|0|0|0|0|11081|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|144|0|350|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|145|0|353|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|146|0|355|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|147|0|357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|148|0|360|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010203004|XXGoport|149|0|367|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|150|0|371|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|151|0|375|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[CREATE_ICFF && not WRITE_MULTIPLE_ICFF ]|3|9|F||{0|}}
}}@0|@1700500|327500|0|0|0|0|11921|ICFF Output|Mukesh.Singh|Created 7/28/2015 6:06:47 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|564000|372000|3|}}
{2010210004|XXGflow|152|0|378|0|{@{}@384|.5|.5|{0|}10678|17|}}
{2010503005|XXGfvertex|153|0|382|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@290000|246000|0|0|0|0|10659|ICFF Index|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|154|0|384|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|155|0|387|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|156|0|389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|157|0|392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$KEY|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|block_size|104857|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@70000|120000|0|0|0|0|10679|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|158|0|394|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|159|0|397|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|160|0|400|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|161|0|402|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|162|0|404|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|163|0|406|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|164|0|409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|165|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|166|0|415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|167|0|421|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@427000|110500|0|0|0|0|10668|To Enable View Data|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32833|1|{1|0|}}}
{2010202004|XXGiport|168|0|423|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|169|0|426|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|170|0|428|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|171|0|433|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010503005|XXGfvertex|172|0|437|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FIRST_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$FIRST_FILE|3|2|$|@{0|}}
}}@0|@105000|603500|0|0|0|0|11783|Input File|Ab Initio Software|@1|100|-1|@6||33089|-1|-1|}}
{2010203004|XXGoport|173|0|439|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|174|0|441|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|175|0|443|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|176|0|446|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ PARTITIONING_METHOD == 'NSNP'
//$[USE_DEFAULT_PARTITION ]
]|3|9|F||{0|}}
}}@0|@949000|320500|0|0|0|0|11938|No-Sort-No-Partition|bfisher|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|137000|134000|7|}}
{2010501005|XXGpvertex|177|0|448|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@52000|63000|0|0|0|0|11589|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|178|0|450|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|179|0|452|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|180|0|454|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|181|0|456|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|182|0|459|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|183|0|465|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|184|0|469|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|185|0|473|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||7|9|Fs||{0|}}
{30001002|XXparameter|condition|$[not CREATE_ICFF and  not WRITE_MULTIPLE_ICFF]|3|9|F||{0|}}
}}@0|@1701000|74000|0|0|0|0|11952|Non-ICFF Outputs|Mukesh.Singh|Created 7/28/2015 6:06:53 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|655000|392000|3|}}
{2010240003|XXGlegend|186|0|475|0|{@{}@Always disabled|-1050000|-159000|0|0|0|0|10538|}}
{2010242002|XXGface|187|0|477|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|188|0|479|0|{@{}@Condition:
$[not is_blank(KEY)]|-1050000|-159000|0|0|0|0|10560|}}
{2010242002|XXGface|189|0|481|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|190|0|483|0|{@{}@Always disabled|-1050000|-159000|0|0|0|0|10592|}}
{2010242002|XXGface|191|0|485|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|192|0|487|0|{@{}@Condition:
$[is_blank(KEY)]|-1050000|-159000|0|0|0|0|10595|}}
{2010242002|XXGface|193|0|489|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|194|0|491|0|{@{}@384|.5|.5|{0|}10630|1041|}}
{2010210004|XXGflow|195|0|493|0|{@{}@384|.5|.5|{0|}10631|17|}}
{2010210004|XXGflow|196|0|495|0|{@{}@384|.5|.5|{0|}10597|17|}}
{2010210004|XXGflow|197|0|497|0|{@{}@384|.5|.5|{0|}10635|17|}}
{2010210004|XXGflow|198|0|499|0|{@{}@384|.5|.5|{0|}10633|17|}}
{2010210004|XXGflow|199|0|501|0|{@{}@384|.5|.5|{0|}10634|1041|}}
{2010501005|XXGpvertex|200|0|503|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@387000|107500|0|0|0|0|10632|Dummy Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|201|0|505|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|202|0|508|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|203|0|512|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|204|0|514|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|205|0|517|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|206|0|520|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$OUTPUT_DML_FILE|3|2|f$|@{0|}}
}}@0|@534000|101000|0|0|0|0|10626|Extracted File|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|207|0|522|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|208|0|525|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|209|0|527|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|210|0|532|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@59000|111000|0|0|0|0|10598|Dummy Replicate 1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|211|0|534|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|212|0|538|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|213|0|540|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|214|0|542|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|215|0|545|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|216|0|548|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INDEX_FILE|3|2|$|@{0|}}
}}@0|@538000|231000|0|0|0|0|10628|Index|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|217|0|550|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|218|0|553|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|219|0|555|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|220|0|558|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key0|$\{KEY\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@203000|201000|0|0|0|0|10636|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|221|0|560|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|222|0|563|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|223|0|566|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|224|0|569|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{2010203004|XXGoport|225|0|571|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|226|0|574|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|227|0|578|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|228|0|586|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[is_blank(KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@233000|104500|0|0|0|0|10585|Dummy Replicate 2|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|229|0|588|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|230|0|591|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|231|0|594|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|232|0|596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|233|0|599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|234|0|608|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|235|0|614|0|{Subgraph created from graph "unload_lookup"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ PARTITIONING_METHOD == 'PBRR'
//$[is_blank(KEY) && not USE_DEFAULT_PARTITION ]
]|3|9|F||{0|}}
}}@0|@959500|494000|0|0|0|0|11949|PBRR|Mukesh.Singh|Created 6/9/2015 5:59:58 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|326000|160000|3|}}
{2010210004|XXGflow|236|0|616|0|{@{}@384|.5|.5|{0|}9951|20|}}
{2010501005|XXGpvertex|237|0|618|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@225000|83000|0|0|0|0|9952|Gather|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|238|0|620|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|239|0|622|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|240|0|625|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|241|0|627|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|242|0|630|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|243|0|636|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@80000|83000|0|0|0|0|9948|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|244|0|638|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|245|0|641|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|246|0|643|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|247|0|645|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|248|0|648|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|249|0|654|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|250|0|658|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|251|0|662|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_METHOD == 'PBKS'
 //$[!is_blank(KEY) && not USE_DEFAULT_PARTITION ]
]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout|$LOCAL_INPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout|$LOCAL_OUTPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@932000|137000|0|0|481000|303000|11959|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010501005|XXGpvertex|252|0|666|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|9|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|253|0|668|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|254|0|670|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|255|0|675|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|256|0|679|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|257|0|683|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|258|0|685|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|259|0|687|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|260|0|689|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|261|0|692|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|262|0|694|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|263|0|696|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|264|0|699|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|265|0|704|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|266|0|706|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|267|0|708|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|268|0|711|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|269|0|713|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|270|0|716|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|271|0|722|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|272|0|725|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|273|0|728|0|{Subgraph created from graph "enrich"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|/app01/abinitio/sand/msingh/datahub/components/read_files_by_pattern.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION|$INPUT_FILE_LOCATION|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|$INPUT_FILE_PATTERN|3|9||@{0|}}
}}@0|@101000|339000|0|0|0|0|11956|Read File(s)||@1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|857000|1343000|1|}}
{2010240003|XXGlegend|274|0|730|0|{@{}@Expand the list of files
based on the provided
pattern|16000|333500|0|0|0|0|2211|}}
{2010242002|XXGface|275|0|732|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|276|0|734|0|{@{}@Skips header records
from each file|426000|393500|0|0|0|0|2218|}}
{2010242002|XXGface|277|0|736|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|278|0|738|0|{@{}@[ Always disabled ]|144000|461000|0|0|0|0|2215|}}
{2010242002|XXGface|279|0|740|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|280|0|742|0|{@{}@[ Always disabled ]|679000|451000|0|0|0|0|2235|}}
{2010242002|XXGface|281|0|744|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|282|0|746|0|{@{}@[ These components run in case the input is MFS ]|349000|641000|0|0|0|0|2217|}}
{2010242002|XXGface|283|0|748|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|284|0|750|0|{@{}@[ This component runs in
case the input is serial ]|429000|271000|0|0|0|0|2212|}}
{2010242002|XXGface|285|0|752|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|286|0|754|0|{@{}@Reads multi- or serial files by pattern. Output flow
is in the same layout as the source files.

The log and error files are created with names derived
from the calling graph name and the file pattern.

Author: Anwar.Parvez\@catamaranrx.com (Exusia)|10000|64000|0|0|0|0|2199|}}
{2010242002|XXGface|287|0|756|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|288|0|759|0|{@{}@384|.5|.5|{0|}2205|1043|}}
{2010210004|XXGflow|289|0|761|0|{@{}@384|.5|.5|{0|}2233|531|}}
{2010210004|XXGflow|290|0|763|0|{@{}@384|.5|.5|{0|}2226|17|}}
{2010210004|XXGflow|291|0|767|0|{@{}@384|.5|.5|{0|}2251|1041|}}
{2010210004|XXGflow|292|0|769|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}2231|530|}}
{2010210004|XXGflow|293|0|771|0|{@{}@384|.5|.5|{0|}2207|17|}}
{2010210004|XXGflow|294|0|773|0|{@{}@384|.5|.5|{0|}2209|17|}}
{2010210004|XXGflow|295|0|775|0|{@{}@384|.5|.5|{0|}2202|17|}}
{2010501005|XXGpvertex|296|0|777|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@355000|537500|723000|204000|54000|41000|2222|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|297|0|779|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|298|0|782|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|299|0|788|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@264000|908000|0|0|0|0|2203|Collect Read Errors MFS|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|300|0|790|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|301|0|792|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|302|0|795|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|303|0|797|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|304|0|799|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@266000|1089500|0|0|0|0|2201|Read Errors MFS|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|305|0|801|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|306|0|807|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@124000|908000|0|0|0|0|2200|Collect Read Errors - Serial|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|307|0|809|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|308|0|811|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|309|0|814|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|310|0|816|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|311|0|818|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@126000|1089500|0|0|0|0|2210|Read Errors Serial|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|312|0|820|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|313|0|826|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
}}@0|@472000|909000|0|0|0|0|2204|Collect Read File(s) Log|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|314|0|828|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|315|0|831|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|316|0|834|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@504000|1109000|0|0|0|0|2206|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|317|0|836|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|318|0|839|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|319|0|842|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@491000|1200500|0|0|0|0|2208|Read File(s) Log|Ab Initio Software|@1|1000|-1|@6||164225|-1|-1|}}
{2010202004|XXGiport|320|0|844|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|321|0|850|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@752000|439500|0|0|0|0|2252|Dummy Concat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|322|0|852|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|323|0|854|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|324|0|861|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@224000|439500|0|0|0|0|2227|Dummy Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|325|0|863|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|326|0|868|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|327|0|874|0|{Subgraph created from graph "read_files_by_pattern"|{}@0|@242000|664750|0|0|0|0|2234|Log the List of Files|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|189000|283000|3|}}
{2010210004|XXGflow|328|0|876|0|{@{}@384|.5|.5|{0|}2203|17|}}
{2010501005|XXGpvertex|329|0|878|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@40000|30000|0|0|0|0|2204|Build Full Path|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|330|0|880|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|331|0|883|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|332|0|885|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|333|0|887|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|334|0|889|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|335|0|891|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@52000|168500|0|0|0|0|2201|File List|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|336|0|893|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|337|0|901|0|{@{}@0|0|0|0|in0|.5|@@@12816|0|}}
{2010501005|XXGpvertex|338|0|906|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@476000|510500|0|0|0|0|2232|Read All Matching Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|339|0|908|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|340|0|911|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|341|0|913|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|342|0|915|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|343|0|917|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|344|0|919|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|345|0|921|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|346|0|930|0|{@{}@0|0|0|0|out0|.4744094488188976|@@@14352|0|}}
{2010600005|XXGgraph|347|0|934|0|{Subgraph created from graph "enrich"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_FILE_LOCATION||3|9|RFK|Directory where files are to be read from|{0|}}
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
{2010240003|XXGlegend|348|0|936|0|{@{}@Expand the list of files
based on the provided
pattern|16000|333500|0|0|0|0|2211|}}
{2010242002|XXGface|349|0|938|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|350|0|940|0|{@{}@Skips header records
from each file|426000|393500|0|0|0|0|2218|}}
{2010242002|XXGface|351|0|942|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|352|0|944|0|{@{}@[ Always disabled ]|144000|461000|0|0|0|0|2215|}}
{2010242002|XXGface|353|0|946|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|354|0|948|0|{@{}@[ Always disabled ]|679000|451000|0|0|0|0|2216|}}
{2010242002|XXGface|355|0|950|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|356|0|952|0|{@{}@[ These components run in case the input is MFS ]|349000|641000|0|0|0|0|2217|}}
{2010242002|XXGface|357|0|954|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|358|0|956|0|{@{}@[ This component runs in
case the input is serial ]|429000|271000|0|0|0|0|2212|}}
{2010242002|XXGface|359|0|958|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|360|0|960|0|{@{}@Reads multi- or serial files by pattern. Output flow
is in the same layout as the source files.

The log and error files are created with names derived
from the calling graph name and the file pattern.

Author: Anwar.Parvez\@catamaranrx.com (Exusia)|10000|64000|0|0|0|0|2199|}}
{2010242002|XXGface|361|0|962|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|362|0|964|0|{@{}@384|.5|.5|{0|}2219|17|}}
{2010210004|XXGflow|363|0|966|0|{@{}@384|.5|.5|{0|}2205|1043|}}
{2010210004|XXGflow|364|0|968|0|{@{}@384|.5|.5|{0|}2232|531|}}
{2010210004|XXGflow|365|0|970|0|{@{}@384|.5|.5|{0|}2221|17|}}
{2010210004|XXGflow|366|0|972|0|{@{}@384|.5|.5|{0|}2228|18|}}
{2010210004|XXGflow|367|0|974|0|{@{}@384|.5|.5|{0|}2229|1041|}}
{2010210004|XXGflow|368|0|976|0|{@{}@384|.5|.5|{0|}2224|1041|}}
{2010210004|XXGflow|369|0|978|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}2223|530|}}
{2010210004|XXGflow|370|0|980|0|{@{}@384|.5|.5|{0|}2207|17|}}
{2010210004|XXGflow|371|0|982|0|{@{}@384|.5|.5|{0|}2209|17|}}
{2010210004|XXGflow|372|0|984|0|{@{}@384|.5|.5|{0|}2202|17|}}
{2010501005|XXGpvertex|373|0|986|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@355000|537500|723000|204000|54000|41000|2222|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|374|0|988|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|375|0|991|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|376|0|994|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|377|0|996|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|378|0|999|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|379|0|1002|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_MFS|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
}}@0|@264000|908000|0|0|0|0|2203|Collect Read Errors MFS|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|380|0|1004|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|381|0|1006|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|382|0|1009|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|383|0|1011|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|384|0|1013|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
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
{2010203004|XXGoport|385|0|1015|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|386|0|1018|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|387|0|1021|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|388|0|1024|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|389|0|1027|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
}}@0|@124000|908000|0|0|0|0|2200|Collect Read Errors - Serial|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|390|0|1029|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|391|0|1031|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|392|0|1034|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|393|0|1036|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|394|0|1038|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
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
{2010203004|XXGoport|395|0|1040|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|396|0|1043|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|397|0|1046|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|398|0|1049|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|399|0|1052|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_group|READ_FILES_LOG_GROUP|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
}}@0|@472000|909000|0|0|0|0|2204|Collect Read File(s) Log|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|400|0|1054|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|401|0|1057|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|402|0|1059|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|403|0|1061|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|404|0|1064|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|405|0|1067|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
}}@0|@504000|1109000|0|0|0|0|2206|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|406|0|1069|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|407|0|1072|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|408|0|1075|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|409|0|1077|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|410|0|1080|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|411|0|1083|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
}}@0|@752000|439500|0|0|0|0|2214|Dummy Concat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|412|0|1085|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|413|0|1087|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|414|0|1091|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|415|0|1093|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|416|0|1096|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|417|0|1099|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|@224000|439500|0|0|0|0|2213|Dummy Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|418|0|1101|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|419|0|1106|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|420|0|1109|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|421|0|1111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|422|0|1114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|423|0|1117|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
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
{2010203004|XXGoport|424|0|1119|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|425|0|1122|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|426|0|1124|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|427|0|1126|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|428|0|1128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|429|0|1131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|430|0|1134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|431|0|1138|0|{Subgraph created from graph "read_files_by_pattern"|{}@0|@242000|664750|0|0|0|0|2233|Log the List of Files|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|189000|283000|3|}}
{2010210004|XXGflow|432|0|1140|0|{@{}@384|.5|.5|{0|}2200|17|}}
{2010501005|XXGpvertex|433|0|1142|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|out::reformat(in)=
begin
  out.file :: $"INPUT_FILE_LOCATION" + in.file;
end;|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
}}@0|@40000|30000|0|0|0|0|2198|Build Full Path|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|434|0|1144|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|435|0|1147|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|436|0|1149|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|437|0|1151|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|438|0|1153|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|439|0|1155|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|440|0|1157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|441|0|1161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|442|0|1164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|443|0|1167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|444|0|1170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|445|0|1173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$\{PROCESSED_LIST_LOG_FILENAME\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/$\{PROCESSED_LIST_LOG_FILENAME\}|3|2|$|@{0|}}
}}@0|@52000|168500|0|0|0|0|2201|File List|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|446|0|1175|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|447|0|1178|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|448|0|1180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|449|0|1183|0|{@{}@0|0|0|0|in0|.5|@@@12816|0|}}
{2010501005|XXGpvertex|450|0|1187|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{2010203004|XXGoport|451|0|1189|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|452|0|1192|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|453|0|1194|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|454|0|1196|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|455|0|1198|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|456|0|1200|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|457|0|1202|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|458|0|1205|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|459|0|1207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|460|0|1210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|461|0|1213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|462|0|1216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|463|0|1219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|464|0|1222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|465|0|1225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|466|0|1228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{2010203004|XXGoport|467|0|1230|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|468|0|1233|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|469|0|1235|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|470|0|1237|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|471|0|1239|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|472|0|1241|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|473|0|1243|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|474|0|1246|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|475|0|1248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|476|0|1251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|477|0|1254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|478|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|479|0|1260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|480|0|1263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|481|0|1266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|482|0|1269|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
}}@0|@266000|1089500|0|0|0|0|2201|Read Errors MFS|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|483|0|1271|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|484|0|1274|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|485|0|1276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|486|0|1279|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
}}@0|@126000|1089500|0|0|0|0|2210|Read Errors Serial|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|487|0|1281|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|488|0|1284|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|489|0|1286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|490|0|1289|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log|3|2|$|@{0|}}
}}@0|@491000|1200500|0|0|0|0|2208|Read File(s) Log|Ab Initio Software|@1|1000|-1|@6||164225|-1|-1|}}
{2010202004|XXGiport|491|0|1291|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|492|0|1294|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|493|0|1296|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010203004|XXGoport|494|0|1299|0|{@{}@0|0|0|0|out0|.4744094488188976|@@@14352|0|}}
{2010600005|XXGgraph|495|0|1303|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@30000|45000|0|0|0|0|11839|Version Log|Mukesh.singh|Created 8/21/2015 9:17:18 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|731000|533000|3|}}
{2010240003|XXGlegend|496|0|1305|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|497|0|1307|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|498|0|1309|0|{@{}@Author|197000|66000|0|0|0|0|25|}}
{2010242002|XXGface|499|0|1311|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|500|0|1313|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|501|0|1315|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|502|0|1317|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|503|0|1319|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|504|0|1321|0|{@{}@1.0|17000|88000|0|0|0|0|14|}}
{2010242002|XXGface|505|0|1323|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|506|0|1325|0|{@{}@Jun 15 2015|82000|88000|0|0|0|0|34|}}
{2010242002|XXGface|507|0|1327|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|508|0|1329|0|{@{}@Mukesh Singh (Exusia)|192000|88000|0|0|0|0|36|}}
{2010242002|XXGface|509|0|1331|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|510|0|1333|0|{@{}@This Graph was created as part of Cogs Jun 
30 ,2015 Project and later was made as common
 graph to be used across multiple project . 
|412000|83000|0|0|0|0|29|}}
{2010242002|XXGface|511|0|1335|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|512|0|1337|0|{@{}@1.0.1|17000|178000|0|0|0|0|40|}}
{2010242002|XXGface|513|0|1339|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|514|0|1341|0|{@{}@June 25 2015|82000|178000|0|0|0|0|91|}}
{2010242002|XXGface|515|0|1343|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|516|0|1345|0|{@{}@Anwar Parvez (exusia)|192000|178000|0|0|0|0|92|}}
{2010242002|XXGface|517|0|1347|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|518|0|1349|0|{@{}@Added ICCF flow(2) to write ICFF in append mode|412000|178000|0|0|0|0|93|}}
{2010242002|XXGface|519|0|1351|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|520|0|1353|0|{@{}@July 10 2015|82000|213000|0|0|0|0|88|}}
{2010242002|XXGface|521|0|1355|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|522|0|1357|0|{@{}@Mukesh Singh (exusia)|192000|213000|0|0|0|0|89|}}
{2010242002|XXGface|523|0|1359|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|524|0|1361|0|{@{}@Added Compute and write multiple ICFF flow (3)|412000|213000|0|0|0|0|94|}}
{2010242002|XXGface|525|0|1363|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|526|0|1365|0|{@{}@1.0.2|17000|213000|0|0|0|0|95|}}
{2010242002|XXGface|527|0|1367|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|528|0|1369|0|{@{}@1.0.4|17000|303000|0|0|0|0|97|}}
{2010242002|XXGface|529|0|1371|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|530|0|1373|0|{@{}@Aug 17 2015|82000|303000|0|0|0|0|86|}}
{2010242002|XXGface|531|0|1375|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|532|0|1377|0|{@{}@Anwar Parvez (exusia)|192000|303000|0|0|0|0|80|}}
{2010242002|XXGface|533|0|1379|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|534|0|1381|0|{@{}@Added Logic to compute X-ref count|412000|303000|0|0|0|0|78|}}
{2010242002|XXGface|535|0|1383|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|536|0|1385|0|{@{}@1.0.5|17000|343000|0|0|0|0|105|}}
{2010242002|XXGface|537|0|1387|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|538|0|1389|0|{@{}@Aug 20 2015|82000|343000|0|0|0|0|107|}}
{2010242002|XXGface|539|0|1391|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|540|0|1393|0|{@{}@Mukesh Singh (exusia)|192000|343000|0|0|0|0|109|}}
{2010242002|XXGface|541|0|1395|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|542|0|1397|0|{@{}@Added Handle Log to Compute record count|412000|343000|0|0|0|0|111|}}
{2010242002|XXGface|543|0|1399|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|544|0|1401|0|{@{}@1.0.3|17000|258000|0|0|0|0|96|}}
{2010242002|XXGface|545|0|1403|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|546|0|1405|0|{@{}@Added Intermediate pset parameters and re-organized pset|412000|258000|0|0|0|0|83|}}
{2010242002|XXGface|547|0|1407|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|548|0|1409|0|{@{}@Aug 12 2015|82000|258000|0|0|0|0|85|}}
{2010242002|XXGface|549|0|1411|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|550|0|1413|0|{@{}@Mukesh Singh (exusia)|192000|258000|0|0|0|0|84|}}
{2010242002|XXGface|551|0|1415|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|552|0|1417|0|{@{}@1.0.6|17000|378000|0|0|0|0|121|}}
{2010242002|XXGface|553|0|1419|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|554|0|1421|0|{@{}@Oct 02, 2015|82000|378000|0|0|0|0|116|}}
{2010242002|XXGface|555|0|1423|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|556|0|1425|0|{@{}@Mukesh Singh (exusia)|192000|378000|0|0|0|0|118|}}
{2010242002|XXGface|557|0|1427|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|558|0|1429|0|{@{}@Added an additional flow in write multiple ICFF file to 
create reduced , alternate dataset|412000|383000|0|0|0|0|119|}}
{2010242002|XXGface|559|0|1431|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|560|0|1433|0|{@{}@1.0.7|22000|448000|0|0|0|0|122|}}
{2010242002|XXGface|561|0|1435|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|562|0|1437|0|{@{}@Oct 07, 2015|97000|443000|0|0|0|0|123|}}
{2010242002|XXGface|563|0|1439|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|564|0|1441|0|{@{}@Mukesh Singh (exusia)|187000|438000|0|0|0|0|124|}}
{2010242002|XXGface|565|0|1443|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|566|0|1445|0|{@{}@Added a flow for No-Sort, No repartition|407000|423000|0|0|0|0|125|}}
{2010242002|XXGface|567|0|1447|0|{@{}@Arial Narrow|0|100|0|}}
{2010600005|XXGgraph|568|0|1449|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DATAHUB_COMPONENTS/write_daily_icff_and_xref.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|AI_MFS|$REMOTE_MFS|3|9||@{0|}}
{30001002|XXparameter|INPUT_COMPONENT_LAYOUT|$REMOTE_MFS|3|9||@{0|}}
{30001002|XXparameter|OUTPUT_COMPONENT_LAYOUT|$REMOTE_MFS|3|9||@{0|}}
}}@0|@1698000|542250|0|0|0|0|11925|Write Daily ICFFs and Xref|||1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|708000|1|}}
{2010240003|XXGlegend|569|0|1451|0|{@{}@Condition:
not is_blank(INDEX_FIELD)|543000|209000|0|0|0|0|11044|}}
{2010242002|XXGface|570|0|1453|0|{@{}@Arial|8421504|120|0|}}
{2010240003|XXGlegend|571|0|1455|0|{@{}@______________________________ Create Alternate reduced dataset   ______________________________|16000|483000|0|0|0|0|11426|}}
{2010242002|XXGface|572|0|1457|0|{@{}@Arial|8421504|120|0|}}
{2010210004|XXGflow|573|0|1460|0|{@{}@384|.5|.5|{0|}11452|17|}}
{2010210004|XXGflow|574|0|1462|0|{@{}@384|.5|.5|{0|}11437|17|}}
{2010210004|XXGflow|575|0|1464|0|{@{}@384|.5|.5|{0|}11453|17|}}
{2010600005|XXGgraph|576|0|1468|0|{Subgraph created from graph "Write Daily ICFFs and Xref"|{}@0|@487000|555000|0|0|0|0|11438|Create Reduced Aleternate Data Source|Mukesh.Singh|Created 10/2/2015 9:42:25 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|907000|1019000|3|}}
{2010210004|XXGflow|577|0|1470|0|{@{}@384|.5|.5|{0|}11442|17|}}
{2010210004|XXGflow|578|0|1472|0|{@{}@384|.5|.5|{0|}11444|529|}}
{2010210004|XXGflow|579|0|1474|0|{@{}@384|.5|.5|{0|}11440|17|}}
{2010600005|XXGgraph|580|0|1476|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|62500|0|0|0|0|11445|Create Main Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|581|0|1478|0|{@{}@384|.5|.5|{0|}11415|17|}}
{2010210004|XXGflow|582|0|1480|0|{@{}@384|.5|.5|{0|}11416|17|}}
{2010501005|XXGpvertex|583|0|1482|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@283000|17000|0|0|0|0|11417|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|584|0|1484|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|585|0|1487|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|586|0|1489|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|587|0|1491|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|588|0|1493|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|589|0|1495|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|590|0|1499|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@45000|45000|0|0|0|0|11408|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|591|0|1501|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|592|0|1504|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|593|0|1506|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|594|0|1508|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|595|0|1510|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|596|0|1516|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@638000|42000|0|0|0|0|11414|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|597|0|1518|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|598|0|1520|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|599|0|1522|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|600|0|1524|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|601|0|1529|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|602|0|1533|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|242500|0|0|0|0|11443|Create Step2 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|603|0|1535|0|{@{}@384|.5|.5|{0|}11423|17|}}
{2010210004|XXGflow|604|0|1537|0|{@{}@384|.5|.5|{0|}11426|17|}}
{2010501005|XXGpvertex|605|0|1539|0|{|{}@0|@283000|22000|0|0|0|0|11425|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|606|0|1541|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|607|0|1544|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|608|0|1546|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|609|0|1548|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|610|0|1550|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|611|0|1552|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|612|0|1555|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@45000|45000|0|0|0|0|11417|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|613|0|1557|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|614|0|1560|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|615|0|1562|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|616|0|1564|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|617|0|1566|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|618|0|1571|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@638000|47000|0|0|0|0|11427|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|619|0|1573|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|620|0|1575|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|621|0|1577|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|622|0|1579|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|623|0|1584|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|624|0|1588|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|422500|0|0|0|0|11441|Create Step3 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|625|0|1590|0|{@{}@384|.5|.5|{0|}11434|17|}}
{2010210004|XXGflow|626|0|1592|0|{@{}@384|.5|.5|{0|}11435|17|}}
{2010501005|XXGpvertex|627|0|1594|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@283000|22000|0|0|0|0|11436|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|628|0|1596|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|629|0|1599|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|630|0|1601|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|631|0|1603|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|632|0|1605|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|633|0|1607|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|634|0|1610|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@45000|45000|0|0|0|0|11427|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|635|0|1612|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|636|0|1615|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|637|0|1617|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|638|0|1619|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|639|0|1621|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|640|0|1627|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@638000|47000|0|0|0|0|11433|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|641|0|1629|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|642|0|1631|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|643|0|1633|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|644|0|1635|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|645|0|1640|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010501005|XXGpvertex|646|0|1644|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@83000|195000|0|0|0|0|11390|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|647|0|1646|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|648|0|1651|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|649|0|1656|0|{@{}@0|0|0|0|in0|.514792899408284|@@@13840|0|}}
{2010501005|XXGpvertex|650|0|1660|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@78000|213500|0|0|0|0|11362|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|651|0|1662|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|652|0|1667|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|653|0|1672|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@272000|280000|0|0|0|0|11454|Sort on INDEX_FIELD|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32833|1|{1|0|}}}
{2010203004|XXGoport|654|0|1674|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|655|0|1677|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|656|0|1682|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@546000|253000|0|0|0|0|11450|Write Date-wise ICFFs for additional index|Ab Initio Software|Built-in 2.14.97:|1|100|0|@6|@32833|1|{1|0|}}}
{2010203004|XXGoport|657|0|1684|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|658|0|1686|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|659|0|1688|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|660|0|1690|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|661|0|1692|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|662|0|1697|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@574000|27000|0|0|0|0|11448|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|663|0|1699|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|664|0|1701|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|665|0|1703|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|666|0|1705|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|667|0|1710|0|{@{}@0|0|0|0|in0|.4911894273127753|@@@13840|0|}}
{2010600005|XXGgraph|668|0|1714|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[CREATE_ICFF && WRITE_MULTIPLE_ICFF ]|3|9|F||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|KEY|$KEY|3|9|RFK|@{0|}}
{30001002|XXparameter|INDEX_KEY|$ICFF_KEY|3|9|RFK|@{0|}}
{30001002|XXparameter|CREATE_REDUCED_DATASET|$CREATE_REDUCED_DATASET|3|9|RFK|@{0|}}
{30001002|XXparameter|USE_STEP2_REDUCTION|$USE_STEP2_REDUCTION|3|9|RFK|@{0|}}
{30001002|XXparameter|USE_STEP3_REDUCTION|$USE_STEP3_REDUCTION|3|9|RFK|@{0|}}
{30001002|XXparameter|mpcmodtime|1467811732|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|AI_MFS|$AI_MFS|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_COMPONENT_LAYOUT|$AI_MFS|3|9|FK|@{0|}}
{30001002|XXparameter|OUTPUT_COMPONENT_LAYOUT|$AI_MFS|3|9|FK|@{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@1418000|542250|0|0|0|0|11713|Write Daily ICFFs and Xref|||1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|708000|3|}}
{2010240003|XXGlegend|669|0|1716|0|{@{}@Condition:
not is_blank(INDEX_FIELD)|543000|209000|0|0|0|0|11044|}}
{2010242002|XXGface|670|0|1718|0|{@{}@Arial|8421504|120|0|}}
{2010240003|XXGlegend|671|0|1720|0|{@{}@______________________________ Create Alternate reduced dataset   ______________________________|16000|483000|0|0|0|0|11426|}}
{2010242002|XXGface|672|0|1722|0|{@{}@Arial|8421504|120|0|}}
{2010210004|XXGflow|673|0|1724|0|{@{}@384|.5|.5|{0|}11444|17|}}
{2010210004|XXGflow|674|0|1726|0|{@{}@384|.5|.5|{0|}11452|17|}}
{2010210004|XXGflow|675|0|1728|0|{@{}@384|.5|.5|{0|}11437|17|}}
{2010210004|XXGflow|676|0|1730|0|{@{}@384|.5|.5|{0|}11453|17|}}
{2010210004|XXGflow|677|0|1732|0|{@{}@384|.5|.5|{0|}11447|17|}}
{2010501005|XXGpvertex|678|0|1734|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$INPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@254000|10000|0|0|0|0|11446|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|679|0|1736|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|680|0|1739|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|681|0|1741|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|682|0|1743|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|683|0|1745|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|684|0|1747|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|685|0|1750|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|686|0|1752|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|687|0|1755|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|688|0|1758|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|689|0|1761|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|690|0|1764|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|691|0|1767|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|692|0|1770|0|{Subgraph created from graph "Write Daily ICFFs and Xref"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[CREATE_REDUCED_DATASET =="Y" ]|3|9|F||{0|}}
}}@0|@487000|555000|0|0|0|0|11438|Create Reduced Aleternate Data Source|Mukesh.Singh|Created 10/2/2015 9:42:25 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|907000|1019000|3|}}
{2010210004|XXGflow|693|0|1772|0|{@{}@384|.5|.5|{0|}11442|17|}}
{2010210004|XXGflow|694|0|1774|0|{@{}@384|.5|.5|{0|}11444|529|}}
{2010210004|XXGflow|695|0|1776|0|{@{}@384|.5|.5|{0|}11440|17|}}
{2010600005|XXGgraph|696|0|1778|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{}@0|@279500|62500|0|0|0|0|11445|Create Main Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|697|0|1780|0|{@{}@384|.5|.5|{0|}11415|17|}}
{2010210004|XXGflow|698|0|1782|0|{@{}@384|.5|.5|{0|}11416|17|}}
{2010501005|XXGpvertex|699|0|1784|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$INPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@283000|17000|0|0|0|0|11417|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|700|0|1786|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|701|0|1789|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|702|0|1791|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|703|0|1793|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|704|0|1795|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|705|0|1797|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|706|0|1800|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|707|0|1802|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|708|0|1805|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|709|0|1808|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|710|0|1811|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|711|0|1814|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|712|0|1817|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|713|0|1820|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
}}@0|@45000|45000|0|0|0|0|11408|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|714|0|1822|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|715|0|1825|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|716|0|1827|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|717|0|1829|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|718|0|1831|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|719|0|1833|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|720|0|1835|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|721|0|1839|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|722|0|1842|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|723|0|1845|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|724|0|1848|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|725|0|1851|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$OUTPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@638000|42000|0|0|0|0|11414|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|726|0|1853|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|727|0|1855|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|728|0|1857|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|729|0|1859|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|730|0|1862|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|731|0|1864|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|732|0|1867|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|733|0|1870|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|734|0|1873|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|735|0|1876|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|736|0|1880|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_STEP2_REDUCTION=="Y"]|3|9|F||{0|}}
}}@0|@279500|242500|0|0|0|0|11443|Create Step2 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|737|0|1882|0|{@{}@384|.5|.5|{0|}11423|17|}}
{2010210004|XXGflow|738|0|1884|0|{@{}@384|.5|.5|{0|}11426|17|}}
{2010501005|XXGpvertex|739|0|1886|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$INPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@283000|22000|0|0|0|0|11425|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|740|0|1888|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|741|0|1891|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|742|0|1893|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|743|0|1895|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|744|0|1897|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|745|0|1899|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|746|0|1902|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|747|0|1904|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|748|0|1907|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|749|0|1910|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|750|0|1913|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|751|0|1916|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|752|0|1919|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|753|0|1923|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out0_metadata|$OUTPUT_STEP2_REDUCED_DML|3|2|f$|@{0|}}
}}@0|@45000|45000|0|0|0|0|11417|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|754|0|1925|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|755|0|1928|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|756|0|1930|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|757|0|1932|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|758|0|1934|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|759|0|1936|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|760|0|1938|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|761|0|1942|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|762|0|1945|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|763|0|1948|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|764|0|1951|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|765|0|1954|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$OUTPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@638000|47000|0|0|0|0|11427|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|766|0|1956|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|767|0|1958|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|768|0|1960|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|769|0|1962|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|770|0|1965|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|771|0|1967|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|772|0|1970|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|773|0|1973|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|774|0|1976|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|775|0|1979|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|776|0|1983|0|{Subgraph created from graph "Create Reduced Aleternate Data Source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_STEP3_REDUCTION=="Y"]|3|9|F||{0|}}
}}@0|@279500|422500|0|0|0|0|11441|Create Step3 Reduced File|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|828000|243000|3|}}
{2010210004|XXGflow|777|0|1985|0|{@{}@384|.5|.5|{0|}11434|17|}}
{2010210004|XXGflow|778|0|1987|0|{@{}@384|.5|.5|{0|}11435|17|}}
{2010501005|XXGpvertex|779|0|1989|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$INPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@283000|22000|0|0|0|0|11436|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|780|0|1991|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|781|0|1994|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|782|0|1996|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|783|0|1998|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|784|0|2000|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|785|0|2002|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|786|0|2005|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|787|0|2007|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|788|0|2010|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|789|0|2013|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|790|0|2016|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|791|0|2019|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|792|0|2022|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|793|0|2026|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out0_metadata|$OUTPUT_STEP3_REDUCED_DML|3|2|f$|@{0|}}
}}@0|@45000|45000|0|0|0|0|11427|Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|794|0|2028|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|795|0|2031|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|796|0|2033|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|797|0|2035|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|798|0|2037|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|799|0|2039|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|800|0|2041|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|801|0|2045|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|802|0|2048|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|803|0|2051|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|804|0|2054|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|805|0|2057|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$OUTPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@638000|47000|0|0|0|0|11433|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|806|0|2059|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|807|0|2061|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|808|0|2063|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|809|0|2065|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|810|0|2068|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|811|0|2070|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|812|0|2073|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|813|0|2076|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|814|0|2079|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|815|0|2082|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010501005|XXGpvertex|816|0|2086|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@83000|195000|0|0|0|0|11390|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|817|0|2088|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|818|0|2093|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|819|0|2095|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|820|0|2097|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|821|0|2100|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|822|0|2103|0|{@{}@0|0|0|0|in0|.514792899408284|@@@13840|0|}}
{2010501005|XXGpvertex|823|0|2107|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@78000|213500|0|0|0|0|11362|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|824|0|2109|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|825|0|2114|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|826|0|2116|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|827|0|2118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|828|0|2121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|829|0|2124|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$INDEX_FIELD|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$INPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@272000|280000|0|0|0|0|11454|Sort on INDEX_FIELD|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32833|1|{1|0|}}}
{2010203004|XXGoport|830|0|2126|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|831|0|2129|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|832|0|2132|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|833|0|2134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|834|0|2137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|835|0|2140|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$OUTPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@546000|253000|0|0|0|0|11450|Write Date-wise ICFFs for additional index|Ab Initio Software|Built-in 2.14.97:|1|100|0|@6|@32833|1|{1|0|}}}
{2010203004|XXGoport|836|0|2142|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|837|0|2144|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|838|0|2146|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|839|0|2148|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|840|0|2150|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|841|0|2153|0|{Writes records to a set of output files and indexes them as block-compressed lookups.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|842|0|2155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|843|0|2158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|844|0|2161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|845|0|2164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|846|0|2167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|847|0|2170|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout|$OUTPUT_COMPONENT_LAYOUT|3|2|$|@{0|}}
}}@0|@574000|27000|0|0|0|0|11448|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|848|0|2172|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|849|0|2174|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|850|0|2176|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|851|0|2178|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|852|0|2181|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|853|0|2183|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|854|0|2186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|855|0|2189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|856|0|2192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|857|0|2195|0|{@{}@0|0|0|0|in0|.4911894273127753|@@@13840|0|}}
{2010110002|XXGconstant|858|0|2198|0|{@{}@{1|6818006|}}}
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
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_13|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_14|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_2|}1|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_3|}1|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_4|}1|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_5|}1|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_6|}1|34|}
{2010604001|XXGgraph_flow_flow|34|0|68|0|{Flow_7|}1|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_8|}1|36|}
{2010604001|XXGgraph_flow_flow|36|0|72|0|{Flow_9|}1|37|}
{2010601001|XXGgraph_vertex_vertex|37|0|74|0|{Dummy_Replicate_for_flow|}1|38|}
{2010212001|XXGvertex_oport_oport|38|0|76|0|{0|out|}38|39|}
{2010211001|XXGvertex_iport_iport|39|0|78|0|{0|in|}38|40|}
{2010007001|XXGobject_proto_object|40|0|80|0|{}38|41|}
{2010212001|XXGvertex_oport_oport|41|0|82|0|{0|out|}41|42|}
{2010006001|XXGobject_psameas_object|42|0|84|0|{metadata|out_metadata|1|0|}42|41|}
{2010211001|XXGvertex_iport_iport|43|0|85|0|{0|in|}41|43|}
{2010006001|XXGobject_psameas_object|44|0|87|0|{metadata|in_metadata|1|0|}43|41|}
{2010601001|XXGgraph_vertex_vertex|45|0|88|0|{Dummy_Replicate_for_flow_1|}1|44|}
{2010212001|XXGvertex_oport_oport|46|0|90|0|{0|out|}44|45|}
{2010213001|XXGoport_dst_flow|47|0|92|0|{0|}45|25|}
{2010213001|XXGoport_dst_flow|48|0|93|0|{1|}45|35|}
{2010213001|XXGoport_dst_flow|49|0|94|0|{2|}45|26|}
{2010211001|XXGvertex_iport_iport|50|0|95|0|{0|in|}44|46|}
{2010214001|XXGiport_src_flow|51|0|97|0|{0|}46|27|}
{2010007001|XXGobject_proto_object|52|0|98|0|{}44|47|}
{2010212001|XXGvertex_oport_oport|53|0|100|0|{0|out|}47|48|}
{2010006001|XXGobject_psameas_object|54|0|102|0|{metadata|out_metadata|1|0|}48|47|}
{2010211001|XXGvertex_iport_iport|55|0|103|0|{0|in|}47|49|}
{2010006001|XXGobject_psameas_object|56|0|105|0|{metadata|in_metadata|1|0|}49|47|}
{2010006001|XXGobject_psameas_object|57|0|106|0|{Layout|Layout|0|0|}44|50|}
{2010212001|XXGvertex_oport_oport|58|0|108|0|{0|out|}50|51|}
{2010213001|XXGoport_dst_flow|59|0|110|0|{0|}51|52|}
{2010211001|XXGvertex_iport_iport|60|0|112|0|{0|in|}50|53|}
{2010006001|XXGobject_psameas_object|61|0|114|0|{in_metadata|in_metadata|0|0|}50|54|}
{2010212001|XXGvertex_oport_oport|62|0|116|0|{0|out|}54|55|}
{2010213001|XXGoport_dst_flow|63|0|118|0|{0|}55|56|}
{2010212001|XXGvertex_oport_oport|64|0|120|0|{1|reject|}54|57|}
{2010212001|XXGvertex_oport_oport|65|0|122|0|{2|error|}54|58|}
{2010212001|XXGvertex_oport_oport|66|0|124|0|{3|log|}54|59|}
{2010212001|XXGvertex_oport_oport|67|0|126|0|{4|address|}54|60|}
{2010211001|XXGvertex_iport_iport|68|0|128|0|{0|in|}54|61|}
{2010214001|XXGiport_src_flow|69|0|130|0|{0|}61|62|}
{2010006001|XXGobject_psameas_object|70|0|132|0|{reject_metadata|in_metadata|0|0|}54|54|}
{2010006001|XXGobject_psameas_object|71|0|133|0|{out_metadata|in_metadata|0|0|}50|54|}
{2010006001|XXGobject_psameas_object|72|0|134|0|{in_metadata|in_metadata|0|0|}44|54|}
{2010006001|XXGobject_psameas_object|73|0|135|0|{out_metadata|in_metadata|0|0|}44|54|}
{2010601001|XXGgraph_vertex_vertex|74|0|136|0|{Dummy_Replicate_for_flow_2|}1|63|}
{2010212001|XXGvertex_oport_oport|75|0|138|0|{0|out|}63|64|}
{2010213001|XXGoport_dst_flow|76|0|140|0|{0|}64|30|}
{2010213001|XXGoport_dst_flow|77|0|141|0|{1|}64|33|}
{2010213001|XXGoport_dst_flow|78|0|142|0|{2|}64|31|}
{2010211001|XXGvertex_iport_iport|79|0|143|0|{0|in|}63|65|}
{2010214001|XXGiport_src_flow|80|0|145|0|{0|}65|32|}
{2010214001|XXGiport_src_flow|81|0|146|0|{1|}65|36|}
{2010214001|XXGiport_src_flow|82|0|147|0|{2|}65|37|}
{2010007001|XXGobject_proto_object|83|0|148|0|{}63|66|}
{2010212001|XXGvertex_oport_oport|84|0|150|0|{0|out|}66|67|}
{2010006001|XXGobject_psameas_object|85|0|152|0|{metadata|out_metadata|1|0|}67|66|}
{2010211001|XXGvertex_iport_iport|86|0|153|0|{0|in|}66|68|}
{2010006001|XXGobject_psameas_object|87|0|155|0|{metadata|in_metadata|1|0|}68|66|}
{2010006001|XXGobject_psameas_object|88|0|156|0|{Layout|Layout|0|0|}63|69|}
{2010212001|XXGvertex_oport_oport|89|0|158|0|{0|read|}69|70|}
{2010213001|XXGoport_dst_flow|90|0|160|0|{0|}70|71|}
{2010211001|XXGvertex_iport_iport|91|0|162|0|{0|write|}69|72|}
{2010214001|XXGiport_src_flow|92|0|164|0|{0|}72|73|}
{2010007001|XXGobject_proto_object|93|0|166|0|{}69|74|}
{2010212001|XXGvertex_oport_oport|94|0|168|0|{0|read|}74|75|}
{2010006001|XXGobject_psameas_object|95|0|170|0|{metadata|read_metadata|1|0|}75|74|}
{2010211001|XXGvertex_iport_iport|96|0|171|0|{0|write|}74|76|}
{2010006001|XXGobject_psameas_object|97|0|173|0|{metadata|write_metadata|1|0|}76|74|}
{2010006001|XXGobject_psameas_object|98|0|174|0|{read_metadata|in_metadata|0|0|}69|54|}
{2010006001|XXGobject_psameas_object|99|0|175|0|{write_metadata|in_metadata|0|0|}69|54|}
{2010006001|XXGobject_psameas_object|100|0|176|0|{in_metadata|in_metadata|0|0|}63|54|}
{2010006001|XXGobject_psameas_object|101|0|177|0|{out_metadata|in_metadata|0|0|}63|54|}
{2010601001|XXGgraph_vertex_vertex|102|0|178|0|{Get_Log|}1|77|}
{2010212001|XXGvertex_oport_oport|103|0|180|0|{0|log|}77|78|}
{2010213001|XXGoport_dst_flow|104|0|182|0|{0|}78|28|}
{2010211001|XXGvertex_iport_iport|105|0|183|0|{0|in|}77|79|}
{2010007001|XXGobject_proto_object|106|0|185|0|{}77|80|}
{2010212001|XXGvertex_oport_oport|107|0|187|0|{0|log|}80|81|}
{2010006001|XXGobject_psameas_object|108|0|189|0|{metadata|log_metadata|1|0|}81|80|}
{2010211001|XXGvertex_iport_iport|109|0|190|0|{0|in|}80|82|}
{2010006001|XXGobject_psameas_object|110|0|192|0|{metadata|in_metadata|1|0|}82|80|}
{2010006001|XXGobject_psameas_object|111|0|193|0|{Layout|Layout|0|0|}77|83|}
{2010212001|XXGvertex_oport_oport|112|0|195|0|{0|out0|}83|84|}
{2010213001|XXGoport_dst_flow|113|0|197|0|{0|}84|27|}
{2010212001|XXGvertex_oport_oport|114|0|198|0|{1|reject0|}83|85|}
{2010212001|XXGvertex_oport_oport|115|0|200|0|{2|error0|}83|86|}
{2010212001|XXGvertex_oport_oport|116|0|202|0|{3|log|}83|87|}
{2010211001|XXGvertex_iport_iport|117|0|204|0|{0|in|}83|88|}
{2010214001|XXGiport_src_flow|118|0|206|0|{0|}88|34|}
{2010007001|XXGobject_proto_object|119|0|207|0|{}83|89|}
{2010212001|XXGvertex_oport_oport|120|0|209|0|{0|out0|}89|90|}
{2010006001|XXGobject_psameas_object|121|0|211|0|{metadata|out0_metadata|1|0|}90|89|}
{2010006001|XXGobject_psameas_object|122|0|212|0|{transform0|transform0|1|0|}90|89|}
{2010212001|XXGvertex_oport_oport|123|0|213|0|{1|reject0|}89|91|}
{2010006001|XXGobject_psameas_object|124|0|215|0|{metadata|reject0_metadata|1|0|}91|89|}
{2010212001|XXGvertex_oport_oport|125|0|216|0|{2|error0|}89|92|}
{2010006001|XXGobject_psameas_object|126|0|218|0|{metadata|error0_metadata|1|0|}92|89|}
{2010212001|XXGvertex_oport_oport|127|0|219|0|{3|log|}89|93|}
{2010006001|XXGobject_psameas_object|128|0|221|0|{metadata|log_metadata|1|0|}93|89|}
{2010211001|XXGvertex_iport_iport|129|0|222|0|{0|in|}89|94|}
{2010006001|XXGobject_psameas_object|130|0|224|0|{metadata|in_metadata|1|0|}94|89|}
{2010006001|XXGobject_psameas_object|131|0|225|0|{Layout|Layout|0|0|}83|50|}
{2010006001|XXGobject_psameas_object|132|0|226|0|{in_metadata|out_metadata|0|0|}83|95|}
{2010212001|XXGvertex_oport_oport|133|0|228|0|{0|out|}95|96|}
{2010213001|XXGoport_dst_flow|134|0|230|0|{0|}96|97|}
{2010212001|XXGvertex_oport_oport|135|0|232|0|{1|filereject|}95|98|}
{2010212001|XXGvertex_oport_oport|136|0|234|0|{2|fileerror|}95|99|}
{2010212001|XXGvertex_oport_oport|137|0|236|0|{3|reject|}95|100|}
{2010212001|XXGvertex_oport_oport|138|0|238|0|{4|error|}95|101|}
{2010212001|XXGvertex_oport_oport|139|0|240|0|{5|log|}95|102|}
{2010211001|XXGvertex_iport_iport|140|0|242|0|{0|in|}95|103|}
{2010214001|XXGiport_src_flow|141|0|244|0|{0|}103|104|}
{2010006001|XXGobject_psameas_object|142|0|246|0|{filereject_metadata|out_metadata|0|0|}95|105|}
{2010212001|XXGvertex_oport_oport|143|0|248|0|{0|out|}105|106|}
{2010213001|XXGoport_dst_flow|144|0|250|0|{0|}106|107|}
{2010212001|XXGvertex_oport_oport|145|0|252|0|{1|error|}105|108|}
{2010212001|XXGvertex_oport_oport|146|0|254|0|{2|log|}105|109|}
{2010006001|XXGobject_psameas_object|147|0|256|0|{in_metadata|out_metadata|0|0|}95|105|}
{2010006001|XXGobject_psameas_object|148|0|257|0|{out0_metadata|in_metadata|0|0|}83|54|}
{2010006001|XXGobject_psameas_object|149|0|258|0|{reject0_metadata|out_metadata|0|0|}83|95|}
{2010006001|XXGobject_psameas_object|150|0|259|0|{log_metadata|in_metadata|0|0|}77|77|}
{2010601001|XXGgraph_vertex_vertex|151|0|260|0|{Get_Record_count|}1|110|}
{2010604001|XXGgraph_flow_flow|152|0|262|0|{Flow_15|}110|111|}
{2010244001|XXGflow_watcher_watcher|153|0|264|0|{}111|112|}
{2010604001|XXGgraph_flow_flow|154|0|266|0|{Flow_16|}110|113|}
{2010244001|XXGflow_watcher_watcher|155|0|268|0|{}113|114|}
{2010601001|XXGgraph_vertex_vertex|156|0|270|0|{Count_Local|}110|115|}
{2010212001|XXGvertex_oport_oport|157|0|272|0|{0|out|}115|116|}
{2010212001|XXGvertex_oport_oport|158|0|274|0|{1|reject|}115|117|}
{2010212001|XXGvertex_oport_oport|159|0|276|0|{2|error|}115|118|}
{2010212001|XXGvertex_oport_oport|160|0|278|0|{3|log|}115|119|}
{2010211001|XXGvertex_iport_iport|161|0|280|0|{0|in|}115|120|}
{2010214001|XXGiport_src_flow|162|0|282|0|{0|}120|111|}
{2010007001|XXGobject_proto_object|163|0|283|0|{}115|121|}
{2010212001|XXGvertex_oport_oport|164|0|285|0|{0|out|}121|122|}
{2010006001|XXGobject_psameas_object|165|0|287|0|{metadata|out_metadata|1|0|}122|121|}
{2010212001|XXGvertex_oport_oport|166|0|288|0|{1|reject|}121|123|}
{2010006001|XXGobject_psameas_object|167|0|290|0|{metadata|reject_metadata|1|0|}123|121|}
{2010212001|XXGvertex_oport_oport|168|0|291|0|{2|error|}121|124|}
{2010006001|XXGobject_psameas_object|169|0|293|0|{metadata|error_metadata|1|0|}124|121|}
{2010212001|XXGvertex_oport_oport|170|0|294|0|{3|log|}121|125|}
{2010006001|XXGobject_psameas_object|171|0|296|0|{metadata|log_metadata|1|0|}125|121|}
{2010211001|XXGvertex_iport_iport|172|0|297|0|{0|in|}121|126|}
{2010006001|XXGobject_psameas_object|173|0|299|0|{metadata|in_metadata|1|0|}126|121|}
{2010006001|XXGobject_psameas_object|174|0|300|0|{Layout|Layout|0|0|}115|127|}
{2010211001|XXGvertex_iport_iport|175|0|302|0|{0|write|}127|128|}
{2010214001|XXGiport_src_flow|176|0|304|0|{0|}128|29|}
{2010007001|XXGobject_proto_object|177|0|305|0|{}127|129|}
{2010211001|XXGvertex_iport_iport|178|0|307|0|{0|write|}129|130|}
{2010006001|XXGobject_psameas_object|179|0|309|0|{metadata|write_metadata|1|0|}130|129|}
{2010006001|XXGobject_psameas_object|180|0|310|0|{in_metadata|out0_metadata|0|0|}115|131|}
{2010212001|XXGvertex_oport_oport|181|0|312|0|{0|out0|}131|132|}
{2010213001|XXGoport_dst_flow|182|0|314|0|{0|}132|111|}
{2010212001|XXGvertex_oport_oport|183|0|315|0|{1|reject0|}131|133|}
{2010212001|XXGvertex_oport_oport|184|0|317|0|{2|error0|}131|134|}
{2010212001|XXGvertex_oport_oport|185|0|319|0|{3|log|}131|135|}
{2010211001|XXGvertex_iport_iport|186|0|321|0|{0|in|}131|136|}
{2010214001|XXGiport_src_flow|187|0|323|0|{0|}136|113|}
{2010007001|XXGobject_proto_object|188|0|324|0|{}131|137|}
{2010212001|XXGvertex_oport_oport|189|0|326|0|{0|out0|}137|138|}
{2010006001|XXGobject_psameas_object|190|0|328|0|{metadata|out0_metadata|1|0|}138|137|}
{2010006001|XXGobject_psameas_object|191|0|329|0|{transform0|transform0|1|0|}138|137|}
{2010212001|XXGvertex_oport_oport|192|0|330|0|{1|reject0|}137|139|}
{2010006001|XXGobject_psameas_object|193|0|332|0|{metadata|reject0_metadata|1|0|}139|137|}
{2010212001|XXGvertex_oport_oport|194|0|333|0|{2|error0|}137|140|}
{2010006001|XXGobject_psameas_object|195|0|335|0|{metadata|error0_metadata|1|0|}140|137|}
{2010212001|XXGvertex_oport_oport|196|0|336|0|{3|log|}137|141|}
{2010006001|XXGobject_psameas_object|197|0|338|0|{metadata|log_metadata|1|0|}141|137|}
{2010211001|XXGvertex_iport_iport|198|0|339|0|{0|in|}137|142|}
{2010006001|XXGobject_psameas_object|199|0|341|0|{metadata|in_metadata|1|0|}142|137|}
{2010006001|XXGobject_psameas_object|200|0|342|0|{Layout|Layout|0|0|}131|127|}
{2010006001|XXGobject_psameas_object|201|0|343|0|{in_metadata|in_metadata|0|0|}131|77|}
{2010006001|XXGobject_psameas_object|202|0|344|0|{reject0_metadata|in_metadata|0|0|}131|77|}
{2010006001|XXGobject_psameas_object|203|0|345|0|{out_metadata|write_metadata|0|0|}115|127|}
{2010006001|XXGobject_psameas_object|204|0|346|0|{reject_metadata|out0_metadata|0|0|}115|131|}
{2010601001|XXGgraph_vertex_vertex|205|0|347|0|{Gather_1|}110|143|}
{2010212001|XXGvertex_oport_oport|206|0|349|0|{0|out|}143|144|}
{2010213001|XXGoport_dst_flow|207|0|351|0|{0|}144|113|}
{2010211001|XXGvertex_iport_iport|208|0|352|0|{0|in|}143|145|}
{2010007001|XXGobject_proto_object|209|0|354|0|{}143|146|}
{2010212001|XXGvertex_oport_oport|210|0|356|0|{0|out|}146|147|}
{2010006001|XXGobject_psameas_object|211|0|358|0|{metadata|out_metadata|1|0|}147|146|}
{2010211001|XXGvertex_iport_iport|212|0|359|0|{0|in|}146|148|}
{2010006001|XXGobject_psameas_object|213|0|361|0|{metadata|in_metadata|1|0|}148|146|}
{2010006001|XXGobject_psameas_object|214|0|362|0|{Layout|Layout|0|0|}143|127|}
{2010006001|XXGobject_psameas_object|215|0|363|0|{in_metadata|in_metadata|0|0|}143|77|}
{2010006001|XXGobject_psameas_object|216|0|364|0|{out_metadata|in_metadata|0|0|}143|77|}
{2010601001|XXGgraph_vertex_vertex|217|0|365|0|{Parse_Log|}110|131|}
{2010212001|XXGvertex_oport_oport|218|0|366|0|{0|out0|}110|149|}
{2010216002|XXGoport_binding_oport|219|0|368|0|{.5|.5|{0|}11113|}149|116|}
{2010213001|XXGoport_dst_flow|220|0|369|0|{0|}149|29|}
{2010211001|XXGvertex_iport_iport|221|0|370|0|{0|in0|}110|150|}
{2010215002|XXGiport_binding_iport|222|0|372|0|{.5|.5|{0|}11112|}150|145|}
{2010214001|XXGiport_src_flow|223|0|373|0|{0|}150|28|}
{2010601001|XXGgraph_vertex_vertex|224|0|374|0|{ICFF_Output|}1|151|}
{2010604001|XXGgraph_flow_flow|225|0|376|0|{Flow_1|}151|71|}
{2010604001|XXGgraph_flow_flow|226|0|377|0|{Flow_10|}151|152|}
{2010604001|XXGgraph_flow_flow|227|0|379|0|{Flow_8|}151|73|}
{2010601001|XXGgraph_vertex_vertex|228|0|380|0|{ICFF_Data|}151|69|}
{2010601001|XXGgraph_vertex_vertex|229|0|381|0|{ICFF_Index|}151|153|}
{2010211001|XXGvertex_iport_iport|230|0|383|0|{0|write|}153|154|}
{2010214001|XXGiport_src_flow|231|0|385|0|{0|}154|152|}
{2010007001|XXGobject_proto_object|232|0|386|0|{}153|155|}
{2010211001|XXGvertex_iport_iport|233|0|388|0|{0|write|}155|156|}
{2010006001|XXGobject_psameas_object|234|0|390|0|{metadata|write_metadata|1|0|}156|155|}
{2010006001|XXGobject_psameas_object|235|0|391|0|{write_metadata|index_metadata|0|0|}153|157|}
{2010212001|XXGvertex_oport_oport|236|0|393|0|{0|out|}157|158|}
{2010213001|XXGoport_dst_flow|237|0|395|0|{0|}158|73|}
{2010212001|XXGvertex_oport_oport|238|0|396|0|{1|index|}157|159|}
{2010213001|XXGoport_dst_flow|239|0|398|0|{0|}159|152|}
{2010212001|XXGvertex_oport_oport|240|0|399|0|{2|address|}157|160|}
{2010211001|XXGvertex_iport_iport|241|0|401|0|{0|in|}157|161|}
{2010007001|XXGobject_proto_object|242|0|403|0|{}157|162|}
{2010212001|XXGvertex_oport_oport|243|0|405|0|{0|out|}162|163|}
{2010006001|XXGobject_psameas_object|244|0|407|0|{metadata|out_metadata|1|0|}163|162|}
{2010212001|XXGvertex_oport_oport|245|0|408|0|{1|index|}162|164|}
{2010006001|XXGobject_psameas_object|246|0|410|0|{metadata|index_metadata|1|0|}164|162|}
{2010212001|XXGvertex_oport_oport|247|0|411|0|{2|address|}162|165|}
{2010006001|XXGobject_psameas_object|248|0|413|0|{metadata|address_metadata|1|0|}165|162|}
{2010211001|XXGvertex_iport_iport|249|0|414|0|{0|in|}162|166|}
{2010006001|XXGobject_psameas_object|250|0|416|0|{metadata|in_metadata|1|0|}166|162|}
{2010006001|XXGobject_psameas_object|251|0|417|0|{Layout|Layout|0|0|}157|69|}
{2010006001|XXGobject_psameas_object|252|0|418|0|{in_metadata|in_metadata|0|0|}157|54|}
{2010006001|XXGobject_psameas_object|253|0|419|0|{out_metadata|in_metadata|0|0|}157|54|}
{2010601001|XXGgraph_vertex_vertex|254|0|420|0|{To_Enable_View_Data|}151|167|}
{2010211001|XXGvertex_iport_iport|255|0|422|0|{0|in|}167|168|}
{2010214001|XXGiport_src_flow|256|0|424|0|{0|}168|71|}
{2010007001|XXGobject_proto_object|257|0|425|0|{}167|169|}
{2010211001|XXGvertex_iport_iport|258|0|427|0|{0|in|}169|170|}
{2010006001|XXGobject_psameas_object|259|0|429|0|{metadata|in_metadata|1|0|}170|169|}
{2010006001|XXGobject_psameas_object|260|0|430|0|{in_metadata|in_metadata|0|0|}167|54|}
{2010601001|XXGgraph_vertex_vertex|261|0|431|0|{Write_Block_Compressed_Lookup|}151|157|}
{2010211001|XXGvertex_iport_iport|262|0|432|0|{0|in0|}151|171|}
{2010215002|XXGiport_binding_iport|263|0|434|0|{.5|.5|{0|}10676|}171|161|}
{2010214001|XXGiport_src_flow|264|0|435|0|{0|}171|33|}
{2010601001|XXGgraph_vertex_vertex|265|0|436|0|{Input_File|}1|172|}
{2010212001|XXGvertex_oport_oport|266|0|438|0|{0|read|}172|173|}
{2010007001|XXGobject_proto_object|267|0|440|0|{}172|174|}
{2010212001|XXGvertex_oport_oport|268|0|442|0|{0|read|}174|175|}
{2010006001|XXGobject_psameas_object|269|0|444|0|{metadata|read_metadata|1|0|}175|174|}
{2010601001|XXGgraph_vertex_vertex|270|0|445|0|{No_Sort_No_Partition|}1|176|}
{2010601001|XXGgraph_vertex_vertex|271|0|447|0|{Replicate|}176|177|}
{2010212001|XXGvertex_oport_oport|272|0|449|0|{0|out|}177|178|}
{2010211001|XXGvertex_iport_iport|273|0|451|0|{0|in|}177|179|}
{2010007001|XXGobject_proto_object|274|0|453|0|{}177|180|}
{2010212001|XXGvertex_oport_oport|275|0|455|0|{0|out|}180|181|}
{2010006001|XXGobject_psameas_object|276|0|457|0|{metadata|out_metadata|1|0|}181|180|}
{2010211001|XXGvertex_iport_iport|277|0|458|0|{0|in|}180|182|}
{2010006001|XXGobject_psameas_object|278|0|460|0|{metadata|in_metadata|1|0|}182|180|}
{2010006001|XXGobject_psameas_object|279|0|461|0|{Layout|Layout|0|0|}177|69|}
{2010006001|XXGobject_psameas_object|280|0|462|0|{in_metadata|in_metadata|0|0|}177|54|}
{2010006001|XXGobject_psameas_object|281|0|463|0|{out_metadata|in_metadata|0|0|}177|54|}
{2010212001|XXGvertex_oport_oport|282|0|464|0|{0|out0|}176|183|}
{2010216002|XXGoport_binding_oport|283|0|466|0|{.5|.5|{0|}11591|}183|178|}
{2010213001|XXGoport_dst_flow|284|0|467|0|{0|}183|36|}
{2010211001|XXGvertex_iport_iport|285|0|468|0|{0|in0|}176|184|}
{2010215002|XXGiport_binding_iport|286|0|470|0|{.5|.5|{0|}11590|}184|179|}
{2010214001|XXGiport_src_flow|287|0|471|0|{0|}184|35|}
{2010601001|XXGgraph_vertex_vertex|288|0|472|0|{Non_ICFF_Outputs|}1|185|}
{2010605001|XXGgraph_legend_legend|289|0|474|0|{0|}185|186|}
{2010241001|XXGlegend_face_face|290|0|476|0|{}186|187|}
{2010605001|XXGgraph_legend_legend|291|0|478|0|{1|}185|188|}
{2010241001|XXGlegend_face_face|292|0|480|0|{}188|189|}
{2010605001|XXGgraph_legend_legend|293|0|482|0|{2|}185|190|}
{2010241001|XXGlegend_face_face|294|0|484|0|{}190|191|}
{2010605001|XXGgraph_legend_legend|295|0|486|0|{3|}185|192|}
{2010241001|XXGlegend_face_face|296|0|488|0|{}192|193|}
{2010604001|XXGgraph_flow_flow|297|0|490|0|{Flow_10|}185|194|}
{2010604001|XXGgraph_flow_flow|298|0|492|0|{Flow_11|}185|195|}
{2010604001|XXGgraph_flow_flow|299|0|494|0|{Flow_12|}185|196|}
{2010604001|XXGgraph_flow_flow|300|0|496|0|{Flow_5|}185|197|}
{2010604001|XXGgraph_flow_flow|301|0|498|0|{Flow_6|}185|198|}
{2010604001|XXGgraph_flow_flow|302|0|500|0|{Flow_8|}185|199|}
{2010601001|XXGgraph_vertex_vertex|303|0|502|0|{Dummy_Concatenate|}185|200|}
{2010212001|XXGvertex_oport_oport|304|0|504|0|{0|out|}200|201|}
{2010213001|XXGoport_dst_flow|305|0|506|0|{0|}201|195|}
{2010211001|XXGvertex_iport_iport|306|0|507|0|{0|in|}200|202|}
{2010214001|XXGiport_src_flow|307|0|509|0|{0|}202|194|}
{2010214001|XXGiport_src_flow|308|0|510|0|{1|}202|199|}
{2010007001|XXGobject_proto_object|309|0|511|0|{}200|203|}
{2010212001|XXGvertex_oport_oport|310|0|513|0|{0|out|}203|204|}
{2010006001|XXGobject_psameas_object|311|0|515|0|{metadata|out_metadata|1|0|}204|203|}
{2010211001|XXGvertex_iport_iport|312|0|516|0|{0|in|}203|205|}
{2010006001|XXGobject_psameas_object|313|0|518|0|{metadata|in_metadata|1|0|}205|203|}
{2010006001|XXGobject_psameas_object|314|0|519|0|{Layout|Layout|0|0|}200|206|}
{2010211001|XXGvertex_iport_iport|315|0|521|0|{0|write|}206|207|}
{2010214001|XXGiport_src_flow|316|0|523|0|{0|}207|195|}
{2010007001|XXGobject_proto_object|317|0|524|0|{}206|208|}
{2010211001|XXGvertex_iport_iport|318|0|526|0|{0|write|}208|209|}
{2010006001|XXGobject_psameas_object|319|0|528|0|{metadata|write_metadata|1|0|}209|208|}
{2010006001|XXGobject_psameas_object|320|0|529|0|{in_metadata|write_metadata|0|0|}200|206|}
{2010006001|XXGobject_psameas_object|321|0|530|0|{out_metadata|write_metadata|0|0|}200|206|}
{2010601001|XXGgraph_vertex_vertex|322|0|531|0|{Dummy_Replicate_1|}185|210|}
{2010212001|XXGvertex_oport_oport|323|0|533|0|{0|out|}210|211|}
{2010213001|XXGoport_dst_flow|324|0|535|0|{0|}211|196|}
{2010213001|XXGoport_dst_flow|325|0|536|0|{1|}211|198|}
{2010211001|XXGvertex_iport_iport|326|0|537|0|{0|in|}210|212|}
{2010007001|XXGobject_proto_object|327|0|539|0|{}210|213|}
{2010212001|XXGvertex_oport_oport|328|0|541|0|{0|out|}213|214|}
{2010006001|XXGobject_psameas_object|329|0|543|0|{metadata|out_metadata|1|0|}214|213|}
{2010211001|XXGvertex_iport_iport|330|0|544|0|{0|in|}213|215|}
{2010006001|XXGobject_psameas_object|331|0|546|0|{metadata|in_metadata|1|0|}215|213|}
{2010006001|XXGobject_psameas_object|332|0|547|0|{Layout|Layout|0|0|}210|216|}
{2010211001|XXGvertex_iport_iport|333|0|549|0|{0|write|}216|217|}
{2010214001|XXGiport_src_flow|334|0|551|0|{0|}217|197|}
{2010007001|XXGobject_proto_object|335|0|552|0|{}216|218|}
{2010211001|XXGvertex_iport_iport|336|0|554|0|{0|write|}218|219|}
{2010006001|XXGobject_psameas_object|337|0|556|0|{metadata|write_metadata|1|0|}219|218|}
{2010006001|XXGobject_psameas_object|338|0|557|0|{write_metadata|index0_metadata|0|0|}216|220|}
{2010212001|XXGvertex_oport_oport|339|0|559|0|{0|out|}220|221|}
{2010213001|XXGoport_dst_flow|340|0|561|0|{0|}221|199|}
{2010212001|XXGvertex_oport_oport|341|0|562|0|{1|index0|}220|222|}
{2010213001|XXGoport_dst_flow|342|0|564|0|{0|}222|197|}
{2010211001|XXGvertex_iport_iport|343|0|565|0|{0|in|}220|223|}
{2010214001|XXGiport_src_flow|344|0|567|0|{0|}223|198|}
{2010007001|XXGobject_proto_object|345|0|568|0|{}220|224|}
{2010212001|XXGvertex_oport_oport|346|0|570|0|{0|out|}224|225|}
{2010006001|XXGobject_psameas_object|347|0|572|0|{metadata|out_metadata|1|0|}225|224|}
{2010212001|XXGvertex_oport_oport|348|0|573|0|{1|index0|}224|226|}
{2010006001|XXGobject_psameas_object|349|0|575|0|{key0|key0|1|0|}226|224|}
{2010006001|XXGobject_psameas_object|350|0|576|0|{metadata|index0_metadata|1|0|}226|224|}
{2010211001|XXGvertex_iport_iport|351|0|577|0|{0|in|}224|227|}
{2010006001|XXGobject_psameas_object|352|0|579|0|{metadata|in_metadata|1|0|}227|224|}
{2010006001|XXGobject_psameas_object|353|0|580|0|{Layout|Layout|0|0|}220|216|}
{2010006001|XXGobject_psameas_object|354|0|581|0|{in_metadata|write_metadata|0|0|}220|206|}
{2010006001|XXGobject_psameas_object|355|0|582|0|{out_metadata|write_metadata|0|0|}220|206|}
{2010006001|XXGobject_psameas_object|356|0|583|0|{in_metadata|in_metadata|0|0|}210|54|}
{2010006001|XXGobject_psameas_object|357|0|584|0|{out_metadata|in_metadata|0|0|}210|54|}
{2010601001|XXGgraph_vertex_vertex|358|0|585|0|{Dummy_Replicate_2|}185|228|}
{2010212001|XXGvertex_oport_oport|359|0|587|0|{0|out|}228|229|}
{2010213001|XXGoport_dst_flow|360|0|589|0|{0|}229|194|}
{2010211001|XXGvertex_iport_iport|361|0|590|0|{0|in|}228|230|}
{2010214001|XXGiport_src_flow|362|0|592|0|{0|}230|196|}
{2010007001|XXGobject_proto_object|363|0|593|0|{}228|231|}
{2010212001|XXGvertex_oport_oport|364|0|595|0|{0|out|}231|232|}
{2010006001|XXGobject_psameas_object|365|0|597|0|{metadata|out_metadata|1|0|}232|231|}
{2010211001|XXGvertex_iport_iport|366|0|598|0|{0|in|}231|233|}
{2010006001|XXGobject_psameas_object|367|0|600|0|{metadata|in_metadata|1|0|}233|231|}
{2010006001|XXGobject_psameas_object|368|0|601|0|{Layout|Layout|0|0|}228|206|}
{2010006001|XXGobject_psameas_object|369|0|602|0|{in_metadata|write_metadata|0|0|}228|206|}
{2010006001|XXGobject_psameas_object|370|0|603|0|{out_metadata|write_metadata|0|0|}228|206|}
{2010601001|XXGgraph_vertex_vertex|371|0|604|0|{Extracted_File|}185|206|}
{2010601001|XXGgraph_vertex_vertex|372|0|605|0|{Index|}185|216|}
{2010601001|XXGgraph_vertex_vertex|373|0|606|0|{Write_Lookup|}185|220|}
{2010211001|XXGvertex_iport_iport|374|0|607|0|{0|in0|}185|234|}
{2010215002|XXGiport_binding_iport|375|0|609|0|{.5|.5|{0|}10629|}234|212|}
{2010214001|XXGiport_src_flow|376|0|610|0|{0|}234|30|}
{2010006001|XXGobject_psameas_object|377|0|611|0|{metadata|in0_metadata|1|0|}234|185|}
{2010601001|XXGgraph_vertex_vertex|378|0|612|0|{Output_File|}1|127|}
{2010601001|XXGgraph_vertex_vertex|379|0|613|0|{PBRR|}1|235|}
{2010604001|XXGgraph_flow_flow|380|0|615|0|{Flow_8|}235|236|}
{2010601001|XXGgraph_vertex_vertex|381|0|617|0|{Gather|}235|237|}
{2010212001|XXGvertex_oport_oport|382|0|619|0|{0|out|}237|238|}
{2010211001|XXGvertex_iport_iport|383|0|621|0|{0|in|}237|239|}
{2010214001|XXGiport_src_flow|384|0|623|0|{0|}239|236|}
{2010007001|XXGobject_proto_object|385|0|624|0|{}237|240|}
{2010212001|XXGvertex_oport_oport|386|0|626|0|{0|out|}240|241|}
{2010006001|XXGobject_psameas_object|387|0|628|0|{metadata|out_metadata|1|0|}241|240|}
{2010211001|XXGvertex_iport_iport|388|0|629|0|{0|in|}240|242|}
{2010006001|XXGobject_psameas_object|389|0|631|0|{metadata|in_metadata|1|0|}242|240|}
{2010006001|XXGobject_psameas_object|390|0|632|0|{Layout|Layout|0|0|}237|69|}
{2010006001|XXGobject_psameas_object|391|0|633|0|{in_metadata|in_metadata|0|0|}237|54|}
{2010006001|XXGobject_psameas_object|392|0|634|0|{out_metadata|in_metadata|0|0|}237|54|}
{2010601001|XXGgraph_vertex_vertex|393|0|635|0|{Partition_by_Round_robin|}235|243|}
{2010212001|XXGvertex_oport_oport|394|0|637|0|{0|out|}243|244|}
{2010213001|XXGoport_dst_flow|395|0|639|0|{0|}244|236|}
{2010211001|XXGvertex_iport_iport|396|0|640|0|{0|in|}243|245|}
{2010007001|XXGobject_proto_object|397|0|642|0|{}243|246|}
{2010212001|XXGvertex_oport_oport|398|0|644|0|{0|out|}246|247|}
{2010006001|XXGobject_psameas_object|399|0|646|0|{metadata|out_metadata|1|0|}247|246|}
{2010211001|XXGvertex_iport_iport|400|0|647|0|{0|in|}246|248|}
{2010006001|XXGobject_psameas_object|401|0|649|0|{metadata|in_metadata|1|0|}248|246|}
{2010006001|XXGobject_psameas_object|402|0|650|0|{Layout|Layout|0|0|}243|50|}
{2010006001|XXGobject_psameas_object|403|0|651|0|{in_metadata|in_metadata|0|0|}243|54|}
{2010006001|XXGobject_psameas_object|404|0|652|0|{out_metadata|in_metadata|0|0|}243|54|}
{2010212001|XXGvertex_oport_oport|405|0|653|0|{0|out0|}235|249|}
{2010216002|XXGoport_binding_oport|406|0|655|0|{.5|.5|{0|}9950|}249|238|}
{2010213001|XXGoport_dst_flow|407|0|656|0|{0|}249|37|}
{2010211001|XXGvertex_iport_iport|408|0|657|0|{0|in0|}235|250|}
{2010215002|XXGiport_binding_iport|409|0|659|0|{.5|.5|{0|}9949|}250|245|}
{2010214001|XXGiport_src_flow|410|0|660|0|{0|}250|26|}
{2010601001|XXGgraph_vertex_vertex|411|0|661|0|{Partition_by_Key_and_Sort|}1|251|}
{2010604001|XXGgraph_flow_flow|412|0|663|0|{Flow_1|}251|52|}
{2010601001|XXGgraph_vertex_vertex|413|0|664|0|{Partition_by_Key|}251|50|}
{2010601001|XXGgraph_vertex_vertex|414|0|665|0|{Sort|}251|252|}
{2010212001|XXGvertex_oport_oport|415|0|667|0|{0|out|}252|253|}
{2010211001|XXGvertex_iport_iport|416|0|669|0|{0|in|}252|254|}
{2010214001|XXGiport_src_flow|417|0|671|0|{0|}254|52|}
{2010006001|XXGobject_psameas_object|418|0|672|0|{in_metadata|in_metadata|0|0|}252|54|}
{2010006001|XXGobject_psameas_object|419|0|673|0|{out_metadata|in_metadata|0|0|}252|54|}
{2010212001|XXGvertex_oport_oport|420|0|674|0|{0|out0|}251|255|}
{2010216002|XXGoport_binding_oport|421|0|676|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}255|253|}
{2010213001|XXGoport_dst_flow|422|0|677|0|{0|}255|32|}
{2010211001|XXGvertex_iport_iport|423|0|678|0|{0|in0|}251|256|}
{2010215002|XXGiport_binding_iport|424|0|680|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}256|53|}
{2010214001|XXGiport_src_flow|425|0|681|0|{0|}256|25|}
{2010007001|XXGobject_proto_object|426|0|682|0|{}251|257|}
{2010604001|XXGgraph_flow_flow|427|0|684|0|{Flow_1|}257|258|}
{2010601001|XXGgraph_vertex_vertex|428|0|686|0|{Partition_by_Key|}257|259|}
{2010212001|XXGvertex_oport_oport|429|0|688|0|{0|out|}259|260|}
{2010213001|XXGoport_dst_flow|430|0|690|0|{0|}260|258|}
{2010211001|XXGvertex_iport_iport|431|0|691|0|{0|in|}259|261|}
{2010007001|XXGobject_proto_object|432|0|693|0|{}259|262|}
{2010212001|XXGvertex_oport_oport|433|0|695|0|{0|out|}262|263|}
{2010006001|XXGobject_psameas_object|434|0|697|0|{metadata|out_metadata|1|0|}263|262|}
{2010211001|XXGvertex_iport_iport|435|0|698|0|{0|in|}262|264|}
{2010006001|XXGobject_psameas_object|436|0|700|0|{metadata|in_metadata|1|0|}264|262|}
{2010006001|XXGobject_psameas_object|437|0|701|0|{Layout|InputLayout|1|0|}259|257|}
{2010006001|XXGobject_psameas_object|438|0|702|0|{key|Key|1|0|}259|257|}
{2010601001|XXGgraph_vertex_vertex|439|0|703|0|{Sort|}257|265|}
{2010212001|XXGvertex_oport_oport|440|0|705|0|{0|out|}265|266|}
{2010211001|XXGvertex_iport_iport|441|0|707|0|{0|in|}265|267|}
{2010214001|XXGiport_src_flow|442|0|709|0|{0|}267|258|}
{2010007001|XXGobject_proto_object|443|0|710|0|{}265|268|}
{2010212001|XXGvertex_oport_oport|444|0|712|0|{0|out|}268|269|}
{2010006001|XXGobject_psameas_object|445|0|714|0|{metadata|out_metadata|1|0|}269|268|}
{2010211001|XXGvertex_iport_iport|446|0|715|0|{0|in|}268|270|}
{2010006001|XXGobject_psameas_object|447|0|717|0|{metadata|in_metadata|1|0|}270|268|}
{2010006001|XXGobject_psameas_object|448|0|718|0|{Layout|OutputLayout|1|0|}265|257|}
{2010006001|XXGobject_psameas_object|449|0|719|0|{key|Key|1|0|}265|257|}
{2010006001|XXGobject_psameas_object|450|0|720|0|{max_core|Max_core|1|0|}265|257|}
{2010212001|XXGvertex_oport_oport|451|0|721|0|{0|out0|}257|271|}
{2010216002|XXGoport_binding_oport|452|0|723|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}271|266|}
{2010211001|XXGvertex_iport_iport|453|0|724|0|{0|in0|}257|272|}
{2010215002|XXGiport_binding_iport|454|0|726|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}272|261|}
{2010601001|XXGgraph_vertex_vertex|455|0|727|0|{Read_File_s_|}1|273|}
{2010605001|XXGgraph_legend_legend|456|0|729|0|{0|}273|274|}
{2010241001|XXGlegend_face_face|457|0|731|0|{}274|275|}
{2010605001|XXGgraph_legend_legend|458|0|733|0|{1|}273|276|}
{2010241001|XXGlegend_face_face|459|0|735|0|{}276|277|}
{2010605001|XXGgraph_legend_legend|460|0|737|0|{2|}273|278|}
{2010241001|XXGlegend_face_face|461|0|739|0|{}278|279|}
{2010605001|XXGgraph_legend_legend|462|0|741|0|{3|}273|280|}
{2010241001|XXGlegend_face_face|463|0|743|0|{}280|281|}
{2010605001|XXGgraph_legend_legend|464|0|745|0|{4|}273|282|}
{2010241001|XXGlegend_face_face|465|0|747|0|{}282|283|}
{2010605001|XXGgraph_legend_legend|466|0|749|0|{5|}273|284|}
{2010241001|XXGlegend_face_face|467|0|751|0|{}284|285|}
{2010605001|XXGgraph_legend_legend|468|0|753|0|{6|}273|286|}
{2010241001|XXGlegend_face_face|469|0|755|0|{}286|287|}
{2010604001|XXGgraph_flow_flow|470|0|757|0|{Flow_1|}273|107|}
{2010604001|XXGgraph_flow_flow|471|0|758|0|{Flow_10|}273|288|}
{2010604001|XXGgraph_flow_flow|472|0|760|0|{Flow_12|}273|289|}
{2010604001|XXGgraph_flow_flow|473|0|762|0|{Flow_2|}273|290|}
{2010604001|XXGgraph_flow_flow|474|0|764|0|{Flow_3|}273|104|}
{2010604001|XXGgraph_flow_flow|475|0|765|0|{Flow_4|}273|97|}
{2010604001|XXGgraph_flow_flow|476|0|766|0|{Flow_5|}273|291|}
{2010604001|XXGgraph_flow_flow|477|0|768|0|{Flow_6|}273|292|}
{2010604001|XXGgraph_flow_flow|478|0|770|0|{Flow_7|}273|293|}
{2010604001|XXGgraph_flow_flow|479|0|772|0|{Flow_8|}273|294|}
{2010604001|XXGgraph_flow_flow|480|0|774|0|{Flow_9|}273|295|}
{2010601001|XXGgraph_vertex_vertex|481|0|776|0|{Broadcast|}273|296|}
{2010212001|XXGvertex_oport_oport|482|0|778|0|{0|out|}296|297|}
{2010213001|XXGoport_dst_flow|483|0|780|0|{0|}297|292|}
{2010211001|XXGvertex_iport_iport|484|0|781|0|{0|in|}296|298|}
{2010214001|XXGiport_src_flow|485|0|783|0|{0|}298|290|}
{2010006001|XXGobject_psameas_object|486|0|784|0|{Layout|Layout|0|0|}296|105|}
{2010006001|XXGobject_psameas_object|487|0|785|0|{in_metadata|out_metadata|0|0|}296|105|}
{2010006001|XXGobject_psameas_object|488|0|786|0|{out_metadata|out_metadata|0|0|}296|105|}
{2010601001|XXGgraph_vertex_vertex|489|0|787|0|{Collect_Read_Errors_MFS|}273|299|}
{2010212001|XXGvertex_oport_oport|490|0|789|0|{0|escalate|}299|300|}
{2010212001|XXGvertex_oport_oport|491|0|791|0|{1|error|}299|301|}
{2010213001|XXGoport_dst_flow|492|0|793|0|{0|}301|295|}
{2010212001|XXGvertex_oport_oport|493|0|794|0|{2|log|}299|302|}
{2010211001|XXGvertex_iport_iport|494|0|796|0|{0|in|}299|303|}
{2010006001|XXGobject_psameas_object|495|0|798|0|{Layout|Layout|0|0|}299|304|}
{2010211001|XXGvertex_iport_iport|496|0|800|0|{0|write|}304|305|}
{2010214001|XXGiport_src_flow|497|0|802|0|{0|}305|295|}
{2010006001|XXGobject_psameas_object|498|0|803|0|{write_metadata|in_metadata|0|0|}304|299|}
{2010006001|XXGobject_psameas_object|499|0|804|0|{error_metadata|in_metadata|0|0|}299|299|}
{2010006001|XXGobject_psameas_object|500|0|805|0|{escalate_metadata|in_metadata|0|0|}299|299|}
{2010601001|XXGgraph_vertex_vertex|501|0|806|0|{Collect_Read_Errors_Serial|}273|306|}
{2010212001|XXGvertex_oport_oport|502|0|808|0|{0|escalate|}306|307|}
{2010212001|XXGvertex_oport_oport|503|0|810|0|{1|error|}306|308|}
{2010213001|XXGoport_dst_flow|504|0|812|0|{0|}308|294|}
{2010212001|XXGvertex_oport_oport|505|0|813|0|{2|log|}306|309|}
{2010211001|XXGvertex_iport_iport|506|0|815|0|{0|in|}306|310|}
{2010006001|XXGobject_psameas_object|507|0|817|0|{Layout|Layout|0|0|}306|311|}
{2010211001|XXGvertex_iport_iport|508|0|819|0|{0|write|}311|312|}
{2010214001|XXGiport_src_flow|509|0|821|0|{0|}312|294|}
{2010006001|XXGobject_psameas_object|510|0|822|0|{write_metadata|in_metadata|0|0|}311|306|}
{2010006001|XXGobject_psameas_object|511|0|823|0|{error_metadata|in_metadata|0|0|}306|306|}
{2010006001|XXGobject_psameas_object|512|0|824|0|{escalate_metadata|in_metadata|0|0|}306|306|}
{2010601001|XXGgraph_vertex_vertex|513|0|825|0|{Collect_Read_File_s_Log|}273|313|}
{2010212001|XXGvertex_oport_oport|514|0|827|0|{0|log|}313|314|}
{2010213001|XXGoport_dst_flow|515|0|829|0|{0|}314|288|}
{2010211001|XXGvertex_iport_iport|516|0|830|0|{0|in|}313|315|}
{2010006001|XXGobject_psameas_object|517|0|832|0|{log_metadata|in_metadata|0|0|}313|313|}
{2010601001|XXGgraph_vertex_vertex|518|0|833|0|{Concatenate|}273|316|}
{2010212001|XXGvertex_oport_oport|519|0|835|0|{0|out|}316|317|}
{2010213001|XXGoport_dst_flow|520|0|837|0|{0|}317|293|}
{2010211001|XXGvertex_iport_iport|521|0|838|0|{0|in|}316|318|}
{2010214001|XXGiport_src_flow|522|0|840|0|{0|}318|288|}
{2010006001|XXGobject_psameas_object|523|0|841|0|{Layout|Layout|0|0|}316|319|}
{2010211001|XXGvertex_iport_iport|524|0|843|0|{0|write|}319|320|}
{2010214001|XXGiport_src_flow|525|0|845|0|{0|}320|293|}
{2010006001|XXGobject_psameas_object|526|0|846|0|{write_metadata|in_metadata|0|0|}319|313|}
{2010006001|XXGobject_psameas_object|527|0|847|0|{in_metadata|in_metadata|0|0|}316|313|}
{2010006001|XXGobject_psameas_object|528|0|848|0|{out_metadata|in_metadata|0|0|}316|313|}
{2010601001|XXGgraph_vertex_vertex|529|0|849|0|{Dummy_Concat|}273|321|}
{2010212001|XXGvertex_oport_oport|530|0|851|0|{0|out|}321|322|}
{2010211001|XXGvertex_iport_iport|531|0|853|0|{0|in|}321|323|}
{2010214001|XXGiport_src_flow|532|0|855|0|{0|}323|97|}
{2010214001|XXGiport_src_flow|533|0|856|0|{1|}323|291|}
{2010006001|XXGobject_psameas_object|534|0|857|0|{Layout|Layout|0|0|}321|50|}
{2010006001|XXGobject_psameas_object|535|0|858|0|{in_metadata|out_metadata|0|0|}321|95|}
{2010006001|XXGobject_psameas_object|536|0|859|0|{out_metadata|out_metadata|0|0|}321|95|}
{2010601001|XXGgraph_vertex_vertex|537|0|860|0|{Dummy_Replicate|}273|324|}
{2010212001|XXGvertex_oport_oport|538|0|862|0|{0|out|}324|325|}
{2010213001|XXGoport_dst_flow|539|0|864|0|{0|}325|104|}
{2010213001|XXGoport_dst_flow|540|0|865|0|{1|}325|290|}
{2010213001|XXGoport_dst_flow|541|0|866|0|{2|}325|289|}
{2010211001|XXGvertex_iport_iport|542|0|867|0|{0|in|}324|326|}
{2010214001|XXGiport_src_flow|543|0|869|0|{0|}326|107|}
{2010006001|XXGobject_psameas_object|544|0|870|0|{in_metadata|out_metadata|0|0|}324|105|}
{2010006001|XXGobject_psameas_object|545|0|871|0|{out_metadata|out_metadata|0|0|}324|105|}
{2010601001|XXGgraph_vertex_vertex|546|0|872|0|{List_Files|}273|105|}
{2010601001|XXGgraph_vertex_vertex|547|0|873|0|{Log_the_List_of_Files|}273|327|}
{2010604001|XXGgraph_flow_flow|548|0|875|0|{Flow_11|}327|328|}
{2010601001|XXGgraph_vertex_vertex|549|0|877|0|{Build_Full_Path|}327|329|}
{2010212001|XXGvertex_oport_oport|550|0|879|0|{0|out0|}329|330|}
{2010213001|XXGoport_dst_flow|551|0|881|0|{0|}330|328|}
{2010212001|XXGvertex_oport_oport|552|0|882|0|{1|reject0|}329|331|}
{2010212001|XXGvertex_oport_oport|553|0|884|0|{2|error0|}329|332|}
{2010212001|XXGvertex_oport_oport|554|0|886|0|{3|log|}329|333|}
{2010211001|XXGvertex_iport_iport|555|0|888|0|{0|in|}329|334|}
{2010006001|XXGobject_psameas_object|556|0|890|0|{Layout|Layout|0|0|}329|335|}
{2010211001|XXGvertex_iport_iport|557|0|892|0|{0|write|}335|336|}
{2010214001|XXGiport_src_flow|558|0|894|0|{0|}336|328|}
{2010006001|XXGobject_psameas_object|559|0|895|0|{write_metadata|out_metadata|0|0|}335|105|}
{2010006001|XXGobject_psameas_object|560|0|896|0|{in_metadata|out_metadata|0|0|}329|105|}
{2010006001|XXGobject_psameas_object|561|0|897|0|{out0_metadata|out_metadata|0|0|}329|105|}
{2010006001|XXGobject_psameas_object|562|0|898|0|{reject0_metadata|out_metadata|0|0|}329|105|}
{2010601001|XXGgraph_vertex_vertex|563|0|899|0|{File_List|}327|335|}
{2010211001|XXGvertex_iport_iport|564|0|900|0|{0|in0|}327|337|}
{2010215002|XXGiport_binding_iport|565|0|902|0|{.5|.5|{0|}2205|}337|334|}
{2010214001|XXGiport_src_flow|566|0|903|0|{0|}337|289|}
{2010601001|XXGgraph_vertex_vertex|567|0|904|0|{Read_All_Matching_Files|}273|95|}
{2010601001|XXGgraph_vertex_vertex|568|0|905|0|{Read_All_Matching_Files_1|}273|338|}
{2010212001|XXGvertex_oport_oport|569|0|907|0|{0|out|}338|339|}
{2010213001|XXGoport_dst_flow|570|0|909|0|{0|}339|291|}
{2010212001|XXGvertex_oport_oport|571|0|910|0|{1|filereject|}338|340|}
{2010212001|XXGvertex_oport_oport|572|0|912|0|{2|fileerror|}338|341|}
{2010212001|XXGvertex_oport_oport|573|0|914|0|{3|reject|}338|342|}
{2010212001|XXGvertex_oport_oport|574|0|916|0|{4|error|}338|343|}
{2010212001|XXGvertex_oport_oport|575|0|918|0|{5|log|}338|344|}
{2010211001|XXGvertex_iport_iport|576|0|920|0|{0|in|}338|345|}
{2010214001|XXGiport_src_flow|577|0|922|0|{0|}345|292|}
{2010006001|XXGobject_psameas_object|578|0|923|0|{filereject_metadata|out_metadata|0|0|}338|105|}
{2010006001|XXGobject_psameas_object|579|0|924|0|{in_metadata|out_metadata|0|0|}338|105|}
{2010006001|XXGobject_psameas_object|580|0|925|0|{out_metadata|out_metadata|0|0|}338|95|}
{2010601001|XXGgraph_vertex_vertex|581|0|926|0|{Read_Errors_MFS|}273|304|}
{2010601001|XXGgraph_vertex_vertex|582|0|927|0|{Read_Errors_Serial|}273|311|}
{2010601001|XXGgraph_vertex_vertex|583|0|928|0|{Read_File_s_Log|}273|319|}
{2010212001|XXGvertex_oport_oport|584|0|929|0|{0|out0|}273|346|}
{2010216002|XXGoport_binding_oport|585|0|931|0|{.5|.5|{0|}2247|}346|322|}
{2010213001|XXGoport_dst_flow|586|0|932|0|{0|}346|34|}
{2010007001|XXGobject_proto_object|587|0|933|0|{}273|347|}
{2010605001|XXGgraph_legend_legend|588|0|935|0|{0|}347|348|}
{2010241001|XXGlegend_face_face|589|0|937|0|{}348|349|}
{2010605001|XXGgraph_legend_legend|590|0|939|0|{1|}347|350|}
{2010241001|XXGlegend_face_face|591|0|941|0|{}350|351|}
{2010605001|XXGgraph_legend_legend|592|0|943|0|{2|}347|352|}
{2010241001|XXGlegend_face_face|593|0|945|0|{}352|353|}
{2010605001|XXGgraph_legend_legend|594|0|947|0|{3|}347|354|}
{2010241001|XXGlegend_face_face|595|0|949|0|{}354|355|}
{2010605001|XXGgraph_legend_legend|596|0|951|0|{4|}347|356|}
{2010241001|XXGlegend_face_face|597|0|953|0|{}356|357|}
{2010605001|XXGgraph_legend_legend|598|0|955|0|{5|}347|358|}
{2010241001|XXGlegend_face_face|599|0|957|0|{}358|359|}
{2010605001|XXGgraph_legend_legend|600|0|959|0|{6|}347|360|}
{2010241001|XXGlegend_face_face|601|0|961|0|{}360|361|}
{2010604001|XXGgraph_flow_flow|602|0|963|0|{Flow_1|}347|362|}
{2010604001|XXGgraph_flow_flow|603|0|965|0|{Flow_10|}347|363|}
{2010604001|XXGgraph_flow_flow|604|0|967|0|{Flow_12|}347|364|}
{2010604001|XXGgraph_flow_flow|605|0|969|0|{Flow_2|}347|365|}
{2010604001|XXGgraph_flow_flow|606|0|971|0|{Flow_3|}347|366|}
{2010604001|XXGgraph_flow_flow|607|0|973|0|{Flow_4|}347|367|}
{2010604001|XXGgraph_flow_flow|608|0|975|0|{Flow_5|}347|368|}
{2010604001|XXGgraph_flow_flow|609|0|977|0|{Flow_6|}347|369|}
{2010604001|XXGgraph_flow_flow|610|0|979|0|{Flow_7|}347|370|}
{2010604001|XXGgraph_flow_flow|611|0|981|0|{Flow_8|}347|371|}
{2010604001|XXGgraph_flow_flow|612|0|983|0|{Flow_9|}347|372|}
{2010601001|XXGgraph_vertex_vertex|613|0|985|0|{Broadcast|}347|373|}
{2010212001|XXGvertex_oport_oport|614|0|987|0|{0|out|}373|374|}
{2010213001|XXGoport_dst_flow|615|0|989|0|{0|}374|369|}
{2010211001|XXGvertex_iport_iport|616|0|990|0|{0|in|}373|375|}
{2010214001|XXGiport_src_flow|617|0|992|0|{0|}375|365|}
{2010007001|XXGobject_proto_object|618|0|993|0|{}373|376|}
{2010212001|XXGvertex_oport_oport|619|0|995|0|{0|out|}376|377|}
{2010006001|XXGobject_psameas_object|620|0|997|0|{metadata|out_metadata|1|0|}377|376|}
{2010211001|XXGvertex_iport_iport|621|0|998|0|{0|in|}376|378|}
{2010006001|XXGobject_psameas_object|622|0|1000|0|{metadata|in_metadata|1|0|}378|376|}
{2010601001|XXGgraph_vertex_vertex|623|0|1001|0|{Collect_Read_Errors_MFS|}347|379|}
{2010212001|XXGvertex_oport_oport|624|0|1003|0|{0|escalate|}379|380|}
{2010212001|XXGvertex_oport_oport|625|0|1005|0|{1|error|}379|381|}
{2010213001|XXGoport_dst_flow|626|0|1007|0|{0|}381|372|}
{2010212001|XXGvertex_oport_oport|627|0|1008|0|{2|log|}379|382|}
{2010211001|XXGvertex_iport_iport|628|0|1010|0|{0|in|}379|383|}
{2010007001|XXGobject_proto_object|629|0|1012|0|{}379|384|}
{2010212001|XXGvertex_oport_oport|630|0|1014|0|{0|escalate|}384|385|}
{2010006001|XXGobject_psameas_object|631|0|1016|0|{metadata|escalate_metadata|1|0|}385|384|}
{2010212001|XXGvertex_oport_oport|632|0|1017|0|{1|error|}384|386|}
{2010006001|XXGobject_psameas_object|633|0|1019|0|{metadata|error_metadata|1|0|}386|384|}
{2010212001|XXGvertex_oport_oport|634|0|1020|0|{2|log|}384|387|}
{2010006001|XXGobject_psameas_object|635|0|1022|0|{metadata|log_metadata|1|0|}387|384|}
{2010211001|XXGvertex_iport_iport|636|0|1023|0|{0|in|}384|388|}
{2010006001|XXGobject_psameas_object|637|0|1025|0|{metadata|in_metadata|1|0|}388|384|}
{2010601001|XXGgraph_vertex_vertex|638|0|1026|0|{Collect_Read_Errors_Serial|}347|389|}
{2010212001|XXGvertex_oport_oport|639|0|1028|0|{0|escalate|}389|390|}
{2010212001|XXGvertex_oport_oport|640|0|1030|0|{1|error|}389|391|}
{2010213001|XXGoport_dst_flow|641|0|1032|0|{0|}391|371|}
{2010212001|XXGvertex_oport_oport|642|0|1033|0|{2|log|}389|392|}
{2010211001|XXGvertex_iport_iport|643|0|1035|0|{0|in|}389|393|}
{2010007001|XXGobject_proto_object|644|0|1037|0|{}389|394|}
{2010212001|XXGvertex_oport_oport|645|0|1039|0|{0|escalate|}394|395|}
{2010006001|XXGobject_psameas_object|646|0|1041|0|{metadata|escalate_metadata|1|0|}395|394|}
{2010212001|XXGvertex_oport_oport|647|0|1042|0|{1|error|}394|396|}
{2010006001|XXGobject_psameas_object|648|0|1044|0|{metadata|error_metadata|1|0|}396|394|}
{2010212001|XXGvertex_oport_oport|649|0|1045|0|{2|log|}394|397|}
{2010006001|XXGobject_psameas_object|650|0|1047|0|{metadata|log_metadata|1|0|}397|394|}
{2010211001|XXGvertex_iport_iport|651|0|1048|0|{0|in|}394|398|}
{2010006001|XXGobject_psameas_object|652|0|1050|0|{metadata|in_metadata|1|0|}398|394|}
{2010601001|XXGgraph_vertex_vertex|653|0|1051|0|{Collect_Read_File_s_Log|}347|399|}
{2010212001|XXGvertex_oport_oport|654|0|1053|0|{0|log|}399|400|}
{2010213001|XXGoport_dst_flow|655|0|1055|0|{0|}400|363|}
{2010211001|XXGvertex_iport_iport|656|0|1056|0|{0|in|}399|401|}
{2010007001|XXGobject_proto_object|657|0|1058|0|{}399|402|}
{2010212001|XXGvertex_oport_oport|658|0|1060|0|{0|log|}402|403|}
{2010006001|XXGobject_psameas_object|659|0|1062|0|{metadata|log_metadata|1|0|}403|402|}
{2010211001|XXGvertex_iport_iport|660|0|1063|0|{0|in|}402|404|}
{2010006001|XXGobject_psameas_object|661|0|1065|0|{metadata|in_metadata|1|0|}404|402|}
{2010601001|XXGgraph_vertex_vertex|662|0|1066|0|{Concatenate|}347|405|}
{2010212001|XXGvertex_oport_oport|663|0|1068|0|{0|out|}405|406|}
{2010213001|XXGoport_dst_flow|664|0|1070|0|{0|}406|370|}
{2010211001|XXGvertex_iport_iport|665|0|1071|0|{0|in|}405|407|}
{2010214001|XXGiport_src_flow|666|0|1073|0|{0|}407|363|}
{2010007001|XXGobject_proto_object|667|0|1074|0|{}405|408|}
{2010212001|XXGvertex_oport_oport|668|0|1076|0|{0|out|}408|409|}
{2010006001|XXGobject_psameas_object|669|0|1078|0|{metadata|out_metadata|1|0|}409|408|}
{2010211001|XXGvertex_iport_iport|670|0|1079|0|{0|in|}408|410|}
{2010006001|XXGobject_psameas_object|671|0|1081|0|{metadata|in_metadata|1|0|}410|408|}
{2010601001|XXGgraph_vertex_vertex|672|0|1082|0|{Dummy_Concat|}347|411|}
{2010212001|XXGvertex_oport_oport|673|0|1084|0|{0|out|}411|412|}
{2010211001|XXGvertex_iport_iport|674|0|1086|0|{0|in|}411|413|}
{2010214001|XXGiport_src_flow|675|0|1088|0|{0|}413|367|}
{2010214001|XXGiport_src_flow|676|0|1089|0|{1|}413|368|}
{2010007001|XXGobject_proto_object|677|0|1090|0|{}411|414|}
{2010212001|XXGvertex_oport_oport|678|0|1092|0|{0|out|}414|415|}
{2010006001|XXGobject_psameas_object|679|0|1094|0|{metadata|out_metadata|1|0|}415|414|}
{2010211001|XXGvertex_iport_iport|680|0|1095|0|{0|in|}414|416|}
{2010006001|XXGobject_psameas_object|681|0|1097|0|{metadata|in_metadata|1|0|}416|414|}
{2010601001|XXGgraph_vertex_vertex|682|0|1098|0|{Dummy_Replicate|}347|417|}
{2010212001|XXGvertex_oport_oport|683|0|1100|0|{0|out|}417|418|}
{2010213001|XXGoport_dst_flow|684|0|1102|0|{0|}418|366|}
{2010213001|XXGoport_dst_flow|685|0|1103|0|{1|}418|365|}
{2010213001|XXGoport_dst_flow|686|0|1104|0|{2|}418|364|}
{2010211001|XXGvertex_iport_iport|687|0|1105|0|{0|in|}417|419|}
{2010214001|XXGiport_src_flow|688|0|1107|0|{0|}419|362|}
{2010007001|XXGobject_proto_object|689|0|1108|0|{}417|420|}
{2010212001|XXGvertex_oport_oport|690|0|1110|0|{0|out|}420|421|}
{2010006001|XXGobject_psameas_object|691|0|1112|0|{metadata|out_metadata|1|0|}421|420|}
{2010211001|XXGvertex_iport_iport|692|0|1113|0|{0|in|}420|422|}
{2010006001|XXGobject_psameas_object|693|0|1115|0|{metadata|in_metadata|1|0|}422|420|}
{2010006001|XXGobject_psameas_object|694|0|1116|0|{Layout|Layout|0|0|}417|423|}
{2010212001|XXGvertex_oport_oport|695|0|1118|0|{0|out|}423|424|}
{2010213001|XXGoport_dst_flow|696|0|1120|0|{0|}424|362|}
{2010212001|XXGvertex_oport_oport|697|0|1121|0|{1|error|}423|425|}
{2010212001|XXGvertex_oport_oport|698|0|1123|0|{2|log|}423|426|}
{2010007001|XXGobject_proto_object|699|0|1125|0|{}423|427|}
{2010212001|XXGvertex_oport_oport|700|0|1127|0|{0|out|}427|428|}
{2010006001|XXGobject_psameas_object|701|0|1129|0|{metadata|out_metadata|1|0|}428|427|}
{2010212001|XXGvertex_oport_oport|702|0|1130|0|{1|error|}427|429|}
{2010006001|XXGobject_psameas_object|703|0|1132|0|{metadata|error_metadata|1|0|}429|427|}
{2010212001|XXGvertex_oport_oport|704|0|1133|0|{2|log|}427|430|}
{2010006001|XXGobject_psameas_object|705|0|1135|0|{metadata|log_metadata|1|0|}430|427|}
{2010601001|XXGgraph_vertex_vertex|706|0|1136|0|{List_Files|}347|423|}
{2010601001|XXGgraph_vertex_vertex|707|0|1137|0|{Log_the_List_of_Files|}347|431|}
{2010604001|XXGgraph_flow_flow|708|0|1139|0|{Flow_11|}431|432|}
{2010601001|XXGgraph_vertex_vertex|709|0|1141|0|{Build_Full_Path|}431|433|}
{2010212001|XXGvertex_oport_oport|710|0|1143|0|{0|out0|}433|434|}
{2010213001|XXGoport_dst_flow|711|0|1145|0|{0|}434|432|}
{2010212001|XXGvertex_oport_oport|712|0|1146|0|{1|reject0|}433|435|}
{2010212001|XXGvertex_oport_oport|713|0|1148|0|{2|error0|}433|436|}
{2010212001|XXGvertex_oport_oport|714|0|1150|0|{3|log|}433|437|}
{2010211001|XXGvertex_iport_iport|715|0|1152|0|{0|in|}433|438|}
{2010007001|XXGobject_proto_object|716|0|1154|0|{}433|439|}
{2010212001|XXGvertex_oport_oport|717|0|1156|0|{0|out0|}439|440|}
{2010006001|XXGobject_psameas_object|718|0|1158|0|{metadata|out0_metadata|1|0|}440|439|}
{2010006001|XXGobject_psameas_object|719|0|1159|0|{transform0|transform0|1|0|}440|439|}
{2010212001|XXGvertex_oport_oport|720|0|1160|0|{1|reject0|}439|441|}
{2010006001|XXGobject_psameas_object|721|0|1162|0|{metadata|reject0_metadata|1|0|}441|439|}
{2010212001|XXGvertex_oport_oport|722|0|1163|0|{2|error0|}439|442|}
{2010006001|XXGobject_psameas_object|723|0|1165|0|{metadata|error0_metadata|1|0|}442|439|}
{2010212001|XXGvertex_oport_oport|724|0|1166|0|{3|log|}439|443|}
{2010006001|XXGobject_psameas_object|725|0|1168|0|{metadata|log_metadata|1|0|}443|439|}
{2010211001|XXGvertex_iport_iport|726|0|1169|0|{0|in|}439|444|}
{2010006001|XXGobject_psameas_object|727|0|1171|0|{metadata|in_metadata|1|0|}444|439|}
{2010601001|XXGgraph_vertex_vertex|728|0|1172|0|{File_List|}431|445|}
{2010211001|XXGvertex_iport_iport|729|0|1174|0|{0|write|}445|446|}
{2010214001|XXGiport_src_flow|730|0|1176|0|{0|}446|432|}
{2010007001|XXGobject_proto_object|731|0|1177|0|{}445|447|}
{2010211001|XXGvertex_iport_iport|732|0|1179|0|{0|write|}447|448|}
{2010006001|XXGobject_psameas_object|733|0|1181|0|{metadata|write_metadata|1|0|}448|447|}
{2010211001|XXGvertex_iport_iport|734|0|1182|0|{0|in0|}431|449|}
{2010215002|XXGiport_binding_iport|735|0|1184|0|{.5|.5|{0|}2199|}449|438|}
{2010214001|XXGiport_src_flow|736|0|1185|0|{0|}449|364|}
{2010601001|XXGgraph_vertex_vertex|737|0|1186|0|{Read_All_Matching_Files|}347|450|}
{2010212001|XXGvertex_oport_oport|738|0|1188|0|{0|out|}450|451|}
{2010213001|XXGoport_dst_flow|739|0|1190|0|{0|}451|367|}
{2010212001|XXGvertex_oport_oport|740|0|1191|0|{1|filereject|}450|452|}
{2010212001|XXGvertex_oport_oport|741|0|1193|0|{2|fileerror|}450|453|}
{2010212001|XXGvertex_oport_oport|742|0|1195|0|{3|reject|}450|454|}
{2010212001|XXGvertex_oport_oport|743|0|1197|0|{4|error|}450|455|}
{2010212001|XXGvertex_oport_oport|744|0|1199|0|{5|log|}450|456|}
{2010211001|XXGvertex_iport_iport|745|0|1201|0|{0|in|}450|457|}
{2010214001|XXGiport_src_flow|746|0|1203|0|{0|}457|366|}
{2010007001|XXGobject_proto_object|747|0|1204|0|{}450|458|}
{2010212001|XXGvertex_oport_oport|748|0|1206|0|{0|out|}458|459|}
{2010006001|XXGobject_psameas_object|749|0|1208|0|{metadata|out_metadata|1|0|}459|458|}
{2010212001|XXGvertex_oport_oport|750|0|1209|0|{1|filereject|}458|460|}
{2010006001|XXGobject_psameas_object|751|0|1211|0|{metadata|filereject_metadata|1|0|}460|458|}
{2010212001|XXGvertex_oport_oport|752|0|1212|0|{2|fileerror|}458|461|}
{2010006001|XXGobject_psameas_object|753|0|1214|0|{metadata|fileerror_metadata|1|0|}461|458|}
{2010212001|XXGvertex_oport_oport|754|0|1215|0|{3|reject|}458|462|}
{2010006001|XXGobject_psameas_object|755|0|1217|0|{metadata|reject_metadata|1|0|}462|458|}
{2010212001|XXGvertex_oport_oport|756|0|1218|0|{4|error|}458|463|}
{2010006001|XXGobject_psameas_object|757|0|1220|0|{metadata|error_metadata|1|0|}463|458|}
{2010212001|XXGvertex_oport_oport|758|0|1221|0|{5|log|}458|464|}
{2010006001|XXGobject_psameas_object|759|0|1223|0|{metadata|log_metadata|1|0|}464|458|}
{2010211001|XXGvertex_iport_iport|760|0|1224|0|{0|in|}458|465|}
{2010006001|XXGobject_psameas_object|761|0|1226|0|{metadata|in_metadata|1|0|}465|458|}
{2010601001|XXGgraph_vertex_vertex|762|0|1227|0|{Read_All_Matching_Files_1|}347|466|}
{2010212001|XXGvertex_oport_oport|763|0|1229|0|{0|out|}466|467|}
{2010213001|XXGoport_dst_flow|764|0|1231|0|{0|}467|368|}
{2010212001|XXGvertex_oport_oport|765|0|1232|0|{1|filereject|}466|468|}
{2010212001|XXGvertex_oport_oport|766|0|1234|0|{2|fileerror|}466|469|}
{2010212001|XXGvertex_oport_oport|767|0|1236|0|{3|reject|}466|470|}
{2010212001|XXGvertex_oport_oport|768|0|1238|0|{4|error|}466|471|}
{2010212001|XXGvertex_oport_oport|769|0|1240|0|{5|log|}466|472|}
{2010211001|XXGvertex_iport_iport|770|0|1242|0|{0|in|}466|473|}
{2010214001|XXGiport_src_flow|771|0|1244|0|{0|}473|369|}
{2010007001|XXGobject_proto_object|772|0|1245|0|{}466|474|}
{2010212001|XXGvertex_oport_oport|773|0|1247|0|{0|out|}474|475|}
{2010006001|XXGobject_psameas_object|774|0|1249|0|{metadata|out_metadata|1|0|}475|474|}
{2010212001|XXGvertex_oport_oport|775|0|1250|0|{1|filereject|}474|476|}
{2010006001|XXGobject_psameas_object|776|0|1252|0|{metadata|filereject_metadata|1|0|}476|474|}
{2010212001|XXGvertex_oport_oport|777|0|1253|0|{2|fileerror|}474|477|}
{2010006001|XXGobject_psameas_object|778|0|1255|0|{metadata|fileerror_metadata|1|0|}477|474|}
{2010212001|XXGvertex_oport_oport|779|0|1256|0|{3|reject|}474|478|}
{2010006001|XXGobject_psameas_object|780|0|1258|0|{metadata|reject_metadata|1|0|}478|474|}
{2010212001|XXGvertex_oport_oport|781|0|1259|0|{4|error|}474|479|}
{2010006001|XXGobject_psameas_object|782|0|1261|0|{metadata|error_metadata|1|0|}479|474|}
{2010212001|XXGvertex_oport_oport|783|0|1262|0|{5|log|}474|480|}
{2010006001|XXGobject_psameas_object|784|0|1264|0|{metadata|log_metadata|1|0|}480|474|}
{2010211001|XXGvertex_iport_iport|785|0|1265|0|{0|in|}474|481|}
{2010006001|XXGobject_psameas_object|786|0|1267|0|{metadata|in_metadata|1|0|}481|474|}
{2010601001|XXGgraph_vertex_vertex|787|0|1268|0|{Read_Errors_MFS|}347|482|}
{2010211001|XXGvertex_iport_iport|788|0|1270|0|{0|write|}482|483|}
{2010214001|XXGiport_src_flow|789|0|1272|0|{0|}483|372|}
{2010007001|XXGobject_proto_object|790|0|1273|0|{}482|484|}
{2010211001|XXGvertex_iport_iport|791|0|1275|0|{0|write|}484|485|}
{2010006001|XXGobject_psameas_object|792|0|1277|0|{metadata|write_metadata|1|0|}485|484|}
{2010601001|XXGgraph_vertex_vertex|793|0|1278|0|{Read_Errors_Serial|}347|486|}
{2010211001|XXGvertex_iport_iport|794|0|1280|0|{0|write|}486|487|}
{2010214001|XXGiport_src_flow|795|0|1282|0|{0|}487|371|}
{2010007001|XXGobject_proto_object|796|0|1283|0|{}486|488|}
{2010211001|XXGvertex_iport_iport|797|0|1285|0|{0|write|}488|489|}
{2010006001|XXGobject_psameas_object|798|0|1287|0|{metadata|write_metadata|1|0|}489|488|}
{2010601001|XXGgraph_vertex_vertex|799|0|1288|0|{Read_File_s_Log|}347|490|}
{2010211001|XXGvertex_iport_iport|800|0|1290|0|{0|write|}490|491|}
{2010214001|XXGiport_src_flow|801|0|1292|0|{0|}491|370|}
{2010007001|XXGobject_proto_object|802|0|1293|0|{}490|492|}
{2010211001|XXGvertex_iport_iport|803|0|1295|0|{0|write|}492|493|}
{2010006001|XXGobject_psameas_object|804|0|1297|0|{metadata|write_metadata|1|0|}493|492|}
{2010212001|XXGvertex_oport_oport|805|0|1298|0|{0|out0|}347|494|}
{2010216002|XXGoport_binding_oport|806|0|1300|0|{.5|.5|{0|}2231|}494|412|}
{2010601001|XXGgraph_vertex_vertex|807|0|1301|0|{Trim_Strings|}1|83|}
{2010601001|XXGgraph_vertex_vertex|808|0|1302|0|{Version_Log|}1|495|}
{2010605001|XXGgraph_legend_legend|809|0|1304|0|{0|}495|496|}
{2010241001|XXGlegend_face_face|810|0|1306|0|{}496|497|}
{2010605001|XXGgraph_legend_legend|811|0|1308|0|{1|}495|498|}
{2010241001|XXGlegend_face_face|812|0|1310|0|{}498|499|}
{2010605001|XXGgraph_legend_legend|813|0|1312|0|{2|}495|500|}
{2010241001|XXGlegend_face_face|814|0|1314|0|{}500|501|}
{2010605001|XXGgraph_legend_legend|815|0|1316|0|{3|}495|502|}
{2010241001|XXGlegend_face_face|816|0|1318|0|{}502|503|}
{2010605001|XXGgraph_legend_legend|817|0|1320|0|{4|}495|504|}
{2010241001|XXGlegend_face_face|818|0|1322|0|{}504|505|}
{2010605001|XXGgraph_legend_legend|819|0|1324|0|{5|}495|506|}
{2010241001|XXGlegend_face_face|820|0|1326|0|{}506|507|}
{2010605001|XXGgraph_legend_legend|821|0|1328|0|{6|}495|508|}
{2010241001|XXGlegend_face_face|822|0|1330|0|{}508|509|}
{2010605001|XXGgraph_legend_legend|823|0|1332|0|{7|}495|510|}
{2010241001|XXGlegend_face_face|824|0|1334|0|{}510|511|}
{2010605001|XXGgraph_legend_legend|825|0|1336|0|{8|}495|512|}
{2010241001|XXGlegend_face_face|826|0|1338|0|{}512|513|}
{2010605001|XXGgraph_legend_legend|827|0|1340|0|{9|}495|514|}
{2010241001|XXGlegend_face_face|828|0|1342|0|{}514|515|}
{2010605001|XXGgraph_legend_legend|829|0|1344|0|{10|}495|516|}
{2010241001|XXGlegend_face_face|830|0|1346|0|{}516|517|}
{2010605001|XXGgraph_legend_legend|831|0|1348|0|{11|}495|518|}
{2010241001|XXGlegend_face_face|832|0|1350|0|{}518|519|}
{2010605001|XXGgraph_legend_legend|833|0|1352|0|{12|}495|520|}
{2010241001|XXGlegend_face_face|834|0|1354|0|{}520|521|}
{2010605001|XXGgraph_legend_legend|835|0|1356|0|{13|}495|522|}
{2010241001|XXGlegend_face_face|836|0|1358|0|{}522|523|}
{2010605001|XXGgraph_legend_legend|837|0|1360|0|{14|}495|524|}
{2010241001|XXGlegend_face_face|838|0|1362|0|{}524|525|}
{2010605001|XXGgraph_legend_legend|839|0|1364|0|{15|}495|526|}
{2010241001|XXGlegend_face_face|840|0|1366|0|{}526|527|}
{2010605001|XXGgraph_legend_legend|841|0|1368|0|{16|}495|528|}
{2010241001|XXGlegend_face_face|842|0|1370|0|{}528|529|}
{2010605001|XXGgraph_legend_legend|843|0|1372|0|{17|}495|530|}
{2010241001|XXGlegend_face_face|844|0|1374|0|{}530|531|}
{2010605001|XXGgraph_legend_legend|845|0|1376|0|{18|}495|532|}
{2010241001|XXGlegend_face_face|846|0|1378|0|{}532|533|}
{2010605001|XXGgraph_legend_legend|847|0|1380|0|{19|}495|534|}
{2010241001|XXGlegend_face_face|848|0|1382|0|{}534|535|}
{2010605001|XXGgraph_legend_legend|849|0|1384|0|{20|}495|536|}
{2010241001|XXGlegend_face_face|850|0|1386|0|{}536|537|}
{2010605001|XXGgraph_legend_legend|851|0|1388|0|{21|}495|538|}
{2010241001|XXGlegend_face_face|852|0|1390|0|{}538|539|}
{2010605001|XXGgraph_legend_legend|853|0|1392|0|{22|}495|540|}
{2010241001|XXGlegend_face_face|854|0|1394|0|{}540|541|}
{2010605001|XXGgraph_legend_legend|855|0|1396|0|{23|}495|542|}
{2010241001|XXGlegend_face_face|856|0|1398|0|{}542|543|}
{2010605001|XXGgraph_legend_legend|857|0|1400|0|{24|}495|544|}
{2010241001|XXGlegend_face_face|858|0|1402|0|{}544|545|}
{2010605001|XXGgraph_legend_legend|859|0|1404|0|{25|}495|546|}
{2010241001|XXGlegend_face_face|860|0|1406|0|{}546|547|}
{2010605001|XXGgraph_legend_legend|861|0|1408|0|{26|}495|548|}
{2010241001|XXGlegend_face_face|862|0|1410|0|{}548|549|}
{2010605001|XXGgraph_legend_legend|863|0|1412|0|{27|}495|550|}
{2010241001|XXGlegend_face_face|864|0|1414|0|{}550|551|}
{2010605001|XXGgraph_legend_legend|865|0|1416|0|{28|}495|552|}
{2010241001|XXGlegend_face_face|866|0|1418|0|{}552|553|}
{2010605001|XXGgraph_legend_legend|867|0|1420|0|{29|}495|554|}
{2010241001|XXGlegend_face_face|868|0|1422|0|{}554|555|}
{2010605001|XXGgraph_legend_legend|869|0|1424|0|{30|}495|556|}
{2010241001|XXGlegend_face_face|870|0|1426|0|{}556|557|}
{2010605001|XXGgraph_legend_legend|871|0|1428|0|{31|}495|558|}
{2010241001|XXGlegend_face_face|872|0|1430|0|{}558|559|}
{2010605001|XXGgraph_legend_legend|873|0|1432|0|{32|}495|560|}
{2010241001|XXGlegend_face_face|874|0|1434|0|{}560|561|}
{2010605001|XXGgraph_legend_legend|875|0|1436|0|{33|}495|562|}
{2010241001|XXGlegend_face_face|876|0|1438|0|{}562|563|}
{2010605001|XXGgraph_legend_legend|877|0|1440|0|{34|}495|564|}
{2010241001|XXGlegend_face_face|878|0|1442|0|{}564|565|}
{2010605001|XXGgraph_legend_legend|879|0|1444|0|{35|}495|566|}
{2010241001|XXGlegend_face_face|880|0|1446|0|{}566|567|}
{2010601001|XXGgraph_vertex_vertex|881|0|1448|0|{Write_Daily_ICFFs_and_Xref|}1|568|}
{2010605001|XXGgraph_legend_legend|882|0|1450|0|{0|}568|569|}
{2010241001|XXGlegend_face_face|883|0|1452|0|{}569|570|}
{2010605001|XXGgraph_legend_legend|884|0|1454|0|{1|}568|571|}
{2010241001|XXGlegend_face_face|885|0|1456|0|{}571|572|}
{2010604001|XXGgraph_flow_flow|886|0|1458|0|{Flow_1|}568|62|}
{2010604001|XXGgraph_flow_flow|887|0|1459|0|{Flow_10|}568|573|}
{2010604001|XXGgraph_flow_flow|888|0|1461|0|{Flow_14|}568|574|}
{2010604001|XXGgraph_flow_flow|889|0|1463|0|{Flow_5|}568|575|}
{2010604001|XXGgraph_flow_flow|890|0|1465|0|{Flow_8|}568|56|}
{2010601001|XXGgraph_vertex_vertex|891|0|1466|0|{Compute_Multiple_Block_Compressed_Lookups|}568|54|}
{2010601001|XXGgraph_vertex_vertex|892|0|1467|0|{Create_Reduced_Aleternate_Data_Source|}568|576|}
{2010604001|XXGgraph_flow_flow|893|0|1469|0|{Flow_1|}576|577|}
{2010604001|XXGgraph_flow_flow|894|0|1471|0|{Flow_2|}576|578|}
{2010604001|XXGgraph_flow_flow|895|0|1473|0|{Flow_3|}576|579|}
{2010601001|XXGgraph_vertex_vertex|896|0|1475|0|{Create_Main_Reduced_File|}576|580|}
{2010604001|XXGgraph_flow_flow|897|0|1477|0|{Flow_1|}580|581|}
{2010604001|XXGgraph_flow_flow|898|0|1479|0|{Flow_14|}580|582|}
{2010601001|XXGgraph_vertex_vertex|899|0|1481|0|{Compute_Multiple_Block_Compressed_Lookups|}580|583|}
{2010212001|XXGvertex_oport_oport|900|0|1483|0|{0|out|}583|584|}
{2010213001|XXGoport_dst_flow|901|0|1485|0|{0|}584|582|}
{2010212001|XXGvertex_oport_oport|902|0|1486|0|{1|reject|}583|585|}
{2010212001|XXGvertex_oport_oport|903|0|1488|0|{2|error|}583|586|}
{2010212001|XXGvertex_oport_oport|904|0|1490|0|{3|log|}583|587|}
{2010212001|XXGvertex_oport_oport|905|0|1492|0|{4|address|}583|588|}
{2010211001|XXGvertex_iport_iport|906|0|1494|0|{0|in|}583|589|}
{2010214001|XXGiport_src_flow|907|0|1496|0|{0|}589|581|}
{2010006001|XXGobject_psameas_object|908|0|1497|0|{reject_metadata|in_metadata|0|0|}583|583|}
{2010601001|XXGgraph_vertex_vertex|909|0|1498|0|{Drop_columns|}580|590|}
{2010212001|XXGvertex_oport_oport|910|0|1500|0|{0|out0|}590|591|}
{2010213001|XXGoport_dst_flow|911|0|1502|0|{0|}591|581|}
{2010212001|XXGvertex_oport_oport|912|0|1503|0|{1|reject0|}590|592|}
{2010212001|XXGvertex_oport_oport|913|0|1505|0|{2|error0|}590|593|}
{2010212001|XXGvertex_oport_oport|914|0|1507|0|{3|log|}590|594|}
{2010211001|XXGvertex_iport_iport|915|0|1509|0|{0|in|}590|595|}
{2010006001|XXGobject_psameas_object|916|0|1511|0|{Layout|Layout|0|0|}590|583|}
{2010006001|XXGobject_psameas_object|917|0|1512|0|{in_metadata|in_metadata|0|0|}590|54|}
{2010006001|XXGobject_psameas_object|918|0|1513|0|{out0_metadata|in_metadata|0|0|}590|583|}
{2010006001|XXGobject_psameas_object|919|0|1514|0|{reject0_metadata|in_metadata|0|0|}590|54|}
{2010601001|XXGgraph_vertex_vertex|920|0|1515|0|{Write_Multiple_Files|}580|596|}
{2010212001|XXGvertex_oport_oport|921|0|1517|0|{0|reject|}596|597|}
{2010212001|XXGvertex_oport_oport|922|0|1519|0|{1|error|}596|598|}
{2010212001|XXGvertex_oport_oport|923|0|1521|0|{2|log|}596|599|}
{2010211001|XXGvertex_iport_iport|924|0|1523|0|{0|in|}596|600|}
{2010214001|XXGiport_src_flow|925|0|1525|0|{0|}600|582|}
{2010006001|XXGobject_psameas_object|926|0|1526|0|{in_metadata|out_metadata|0|0|}596|583|}
{2010006001|XXGobject_psameas_object|927|0|1527|0|{reject_metadata|out_metadata|0|0|}596|583|}
{2010211001|XXGvertex_iport_iport|928|0|1528|0|{0|in0|}580|601|}
{2010215002|XXGiport_binding_iport|929|0|1530|0|{.5|.5|{0|}11418|}601|595|}
{2010214001|XXGiport_src_flow|930|0|1531|0|{0|}601|578|}
{2010601001|XXGgraph_vertex_vertex|931|0|1532|0|{Create_Step2_Reduced_File|}576|602|}
{2010604001|XXGgraph_flow_flow|932|0|1534|0|{Flow_1|}602|603|}
{2010604001|XXGgraph_flow_flow|933|0|1536|0|{Flow_14|}602|604|}
{2010601001|XXGgraph_vertex_vertex|934|0|1538|0|{Compute_Multiple_Block_Compressed_Lookups|}602|605|}
{2010212001|XXGvertex_oport_oport|935|0|1540|0|{0|out|}605|606|}
{2010213001|XXGoport_dst_flow|936|0|1542|0|{0|}606|604|}
{2010212001|XXGvertex_oport_oport|937|0|1543|0|{1|reject|}605|607|}
{2010212001|XXGvertex_oport_oport|938|0|1545|0|{2|error|}605|608|}
{2010212001|XXGvertex_oport_oport|939|0|1547|0|{3|log|}605|609|}
{2010212001|XXGvertex_oport_oport|940|0|1549|0|{4|address|}605|610|}
{2010211001|XXGvertex_iport_iport|941|0|1551|0|{0|in|}605|611|}
{2010214001|XXGiport_src_flow|942|0|1553|0|{0|}611|603|}
{2010601001|XXGgraph_vertex_vertex|943|0|1554|0|{Drop_columns|}602|612|}
{2010212001|XXGvertex_oport_oport|944|0|1556|0|{0|out0|}612|613|}
{2010213001|XXGoport_dst_flow|945|0|1558|0|{0|}613|603|}
{2010212001|XXGvertex_oport_oport|946|0|1559|0|{1|reject0|}612|614|}
{2010212001|XXGvertex_oport_oport|947|0|1561|0|{2|error0|}612|615|}
{2010212001|XXGvertex_oport_oport|948|0|1563|0|{3|log|}612|616|}
{2010211001|XXGvertex_iport_iport|949|0|1565|0|{0|in|}612|617|}
{2010006001|XXGobject_psameas_object|950|0|1567|0|{Layout|Layout|0|0|}612|605|}
{2010006001|XXGobject_psameas_object|951|0|1568|0|{in_metadata|in_metadata|0|0|}612|54|}
{2010006001|XXGobject_psameas_object|952|0|1569|0|{reject0_metadata|in_metadata|0|0|}612|54|}
{2010601001|XXGgraph_vertex_vertex|953|0|1570|0|{Write_Multiple_Files|}602|618|}
{2010212001|XXGvertex_oport_oport|954|0|1572|0|{0|reject|}618|619|}
{2010212001|XXGvertex_oport_oport|955|0|1574|0|{1|error|}618|620|}
{2010212001|XXGvertex_oport_oport|956|0|1576|0|{2|log|}618|621|}
{2010211001|XXGvertex_iport_iport|957|0|1578|0|{0|in|}618|622|}
{2010214001|XXGiport_src_flow|958|0|1580|0|{0|}622|604|}
{2010006001|XXGobject_psameas_object|959|0|1581|0|{in_metadata|out_metadata|0|0|}618|605|}
{2010006001|XXGobject_psameas_object|960|0|1582|0|{reject_metadata|out_metadata|0|0|}618|605|}
{2010211001|XXGvertex_iport_iport|961|0|1583|0|{0|in0|}602|623|}
{2010215002|XXGiport_binding_iport|962|0|1585|0|{.5|.5|{0|}11428|}623|617|}
{2010214001|XXGiport_src_flow|963|0|1586|0|{0|}623|577|}
{2010601001|XXGgraph_vertex_vertex|964|0|1587|0|{Create_Step3_Reduced_File|}576|624|}
{2010604001|XXGgraph_flow_flow|965|0|1589|0|{Flow_1|}624|625|}
{2010604001|XXGgraph_flow_flow|966|0|1591|0|{Flow_14|}624|626|}
{2010601001|XXGgraph_vertex_vertex|967|0|1593|0|{Compute_Multiple_Block_Compressed_Lookups|}624|627|}
{2010212001|XXGvertex_oport_oport|968|0|1595|0|{0|out|}627|628|}
{2010213001|XXGoport_dst_flow|969|0|1597|0|{0|}628|626|}
{2010212001|XXGvertex_oport_oport|970|0|1598|0|{1|reject|}627|629|}
{2010212001|XXGvertex_oport_oport|971|0|1600|0|{2|error|}627|630|}
{2010212001|XXGvertex_oport_oport|972|0|1602|0|{3|log|}627|631|}
{2010212001|XXGvertex_oport_oport|973|0|1604|0|{4|address|}627|632|}
{2010211001|XXGvertex_iport_iport|974|0|1606|0|{0|in|}627|633|}
{2010214001|XXGiport_src_flow|975|0|1608|0|{0|}633|625|}
{2010006001|XXGobject_psameas_object|976|0|1609|0|{in_metadata|out0_metadata|0|0|}627|634|}
{2010212001|XXGvertex_oport_oport|977|0|1611|0|{0|out0|}634|635|}
{2010213001|XXGoport_dst_flow|978|0|1613|0|{0|}635|625|}
{2010212001|XXGvertex_oport_oport|979|0|1614|0|{1|reject0|}634|636|}
{2010212001|XXGvertex_oport_oport|980|0|1616|0|{2|error0|}634|637|}
{2010212001|XXGvertex_oport_oport|981|0|1618|0|{3|log|}634|638|}
{2010211001|XXGvertex_iport_iport|982|0|1620|0|{0|in|}634|639|}
{2010006001|XXGobject_psameas_object|983|0|1622|0|{Layout|Layout|0|0|}634|627|}
{2010006001|XXGobject_psameas_object|984|0|1623|0|{in_metadata|in_metadata|0|0|}634|54|}
{2010006001|XXGobject_psameas_object|985|0|1624|0|{reject0_metadata|in_metadata|0|0|}634|54|}
{2010601001|XXGgraph_vertex_vertex|986|0|1625|0|{Drop_columns|}624|634|}
{2010601001|XXGgraph_vertex_vertex|987|0|1626|0|{Write_Multiple_Files|}624|640|}
{2010212001|XXGvertex_oport_oport|988|0|1628|0|{0|reject|}640|641|}
{2010212001|XXGvertex_oport_oport|989|0|1630|0|{1|error|}640|642|}
{2010212001|XXGvertex_oport_oport|990|0|1632|0|{2|log|}640|643|}
{2010211001|XXGvertex_iport_iport|991|0|1634|0|{0|in|}640|644|}
{2010214001|XXGiport_src_flow|992|0|1636|0|{0|}644|626|}
{2010006001|XXGobject_psameas_object|993|0|1637|0|{in_metadata|out_metadata|0|0|}640|627|}
{2010006001|XXGobject_psameas_object|994|0|1638|0|{reject_metadata|out_metadata|0|0|}640|627|}
{2010211001|XXGvertex_iport_iport|995|0|1639|0|{0|in0|}624|645|}
{2010215002|XXGiport_binding_iport|996|0|1641|0|{.5|.5|{0|}11437|}645|639|}
{2010214001|XXGiport_src_flow|997|0|1642|0|{0|}645|579|}
{2010601001|XXGgraph_vertex_vertex|998|0|1643|0|{Replicate|}576|646|}
{2010212001|XXGvertex_oport_oport|999|0|1645|0|{0|out|}646|647|}
{2010213001|XXGoport_dst_flow|1000|0|1647|0|{0|}647|578|}
{2010213001|XXGoport_dst_flow|1001|0|1648|0|{1|}647|577|}
{2010213001|XXGoport_dst_flow|1002|0|1649|0|{2|}647|579|}
{2010211001|XXGvertex_iport_iport|1003|0|1650|0|{0|in|}646|648|}
{2010006001|XXGobject_psameas_object|1004|0|1652|0|{Layout|Layout|0|0|}646|605|}
{2010006001|XXGobject_psameas_object|1005|0|1653|0|{in_metadata|in_metadata|0|0|}646|54|}
{2010006001|XXGobject_psameas_object|1006|0|1654|0|{out_metadata|in_metadata|0|0|}646|54|}
{2010211001|XXGvertex_iport_iport|1007|0|1655|0|{0|in0|}576|649|}
{2010215002|XXGiport_binding_iport|1008|0|1657|0|{.5|.5|{0|}11446|}649|648|}
{2010214001|XXGiport_src_flow|1009|0|1658|0|{0|}649|574|}
{2010601001|XXGgraph_vertex_vertex|1010|0|1659|0|{Replicate|}568|650|}
{2010212001|XXGvertex_oport_oport|1011|0|1661|0|{0|out|}650|651|}
{2010213001|XXGoport_dst_flow|1012|0|1663|0|{0|}651|62|}
{2010213001|XXGoport_dst_flow|1013|0|1664|0|{1|}651|573|}
{2010213001|XXGoport_dst_flow|1014|0|1665|0|{2|}651|574|}
{2010211001|XXGvertex_iport_iport|1015|0|1666|0|{0|in|}650|652|}
{2010006001|XXGobject_psameas_object|1016|0|1668|0|{Layout|Layout|0|0|}650|54|}
{2010006001|XXGobject_psameas_object|1017|0|1669|0|{in_metadata|in_metadata|0|0|}650|54|}
{2010006001|XXGobject_psameas_object|1018|0|1670|0|{out_metadata|in_metadata|0|0|}650|54|}
{2010601001|XXGgraph_vertex_vertex|1019|0|1671|0|{Sort_on_INDEX_FIELD|}568|653|}
{2010212001|XXGvertex_oport_oport|1020|0|1673|0|{0|out|}653|654|}
{2010213001|XXGoport_dst_flow|1021|0|1675|0|{0|}654|575|}
{2010211001|XXGvertex_iport_iport|1022|0|1676|0|{0|in|}653|655|}
{2010214001|XXGiport_src_flow|1023|0|1678|0|{0|}655|573|}
{2010006001|XXGobject_psameas_object|1024|0|1679|0|{in_metadata|in_metadata|0|0|}653|54|}
{2010006001|XXGobject_psameas_object|1025|0|1680|0|{out_metadata|in_metadata|0|0|}653|54|}
{2010601001|XXGgraph_vertex_vertex|1026|0|1681|0|{Write_Date_wise_ICFFs_for_additional_index|}568|656|}
{2010212001|XXGvertex_oport_oport|1027|0|1683|0|{0|reject|}656|657|}
{2010212001|XXGvertex_oport_oport|1028|0|1685|0|{1|error|}656|658|}
{2010212001|XXGvertex_oport_oport|1029|0|1687|0|{2|log|}656|659|}
{2010212001|XXGvertex_oport_oport|1030|0|1689|0|{3|address|}656|660|}
{2010211001|XXGvertex_iport_iport|1031|0|1691|0|{0|in|}656|661|}
{2010214001|XXGiport_src_flow|1032|0|1693|0|{0|}661|575|}
{2010006001|XXGobject_psameas_object|1033|0|1694|0|{in_metadata|in_metadata|0|0|}656|54|}
{2010006001|XXGobject_psameas_object|1034|0|1695|0|{reject_metadata|in_metadata|0|0|}656|54|}
{2010601001|XXGgraph_vertex_vertex|1035|0|1696|0|{Write_Multiple_Files|}568|662|}
{2010212001|XXGvertex_oport_oport|1036|0|1698|0|{0|reject|}662|663|}
{2010212001|XXGvertex_oport_oport|1037|0|1700|0|{1|error|}662|664|}
{2010212001|XXGvertex_oport_oport|1038|0|1702|0|{2|log|}662|665|}
{2010211001|XXGvertex_iport_iport|1039|0|1704|0|{0|in|}662|666|}
{2010214001|XXGiport_src_flow|1040|0|1706|0|{0|}666|56|}
{2010006001|XXGobject_psameas_object|1041|0|1707|0|{in_metadata|out_metadata|0|0|}662|54|}
{2010006001|XXGobject_psameas_object|1042|0|1708|0|{reject_metadata|out_metadata|0|0|}662|54|}
{2010211001|XXGvertex_iport_iport|1043|0|1709|0|{0|in0|}568|667|}
{2010215002|XXGiport_binding_iport|1044|0|1711|0|{.5|.5|{0|}11455|}667|652|}
{2010214001|XXGiport_src_flow|1045|0|1712|0|{0|}667|31|}
{2010007001|XXGobject_proto_object|1046|0|1713|0|{}568|668|}
{2010605001|XXGgraph_legend_legend|1047|0|1715|0|{0|}668|669|}
{2010241001|XXGlegend_face_face|1048|0|1717|0|{}669|670|}
{2010605001|XXGgraph_legend_legend|1049|0|1719|0|{1|}668|671|}
{2010241001|XXGlegend_face_face|1050|0|1721|0|{}671|672|}
{2010604001|XXGgraph_flow_flow|1051|0|1723|0|{Flow_1|}668|673|}
{2010604001|XXGgraph_flow_flow|1052|0|1725|0|{Flow_10|}668|674|}
{2010604001|XXGgraph_flow_flow|1053|0|1727|0|{Flow_14|}668|675|}
{2010604001|XXGgraph_flow_flow|1054|0|1729|0|{Flow_5|}668|676|}
{2010604001|XXGgraph_flow_flow|1055|0|1731|0|{Flow_8|}668|677|}
{2010601001|XXGgraph_vertex_vertex|1056|0|1733|0|{Compute_Multiple_Block_Compressed_Lookups|}668|678|}
{2010212001|XXGvertex_oport_oport|1057|0|1735|0|{0|out|}678|679|}
{2010213001|XXGoport_dst_flow|1058|0|1737|0|{0|}679|677|}
{2010212001|XXGvertex_oport_oport|1059|0|1738|0|{1|reject|}678|680|}
{2010212001|XXGvertex_oport_oport|1060|0|1740|0|{2|error|}678|681|}
{2010212001|XXGvertex_oport_oport|1061|0|1742|0|{3|log|}678|682|}
{2010212001|XXGvertex_oport_oport|1062|0|1744|0|{4|address|}678|683|}
{2010211001|XXGvertex_iport_iport|1063|0|1746|0|{0|in|}678|684|}
{2010214001|XXGiport_src_flow|1064|0|1748|0|{0|}684|673|}
{2010007001|XXGobject_proto_object|1065|0|1749|0|{}678|685|}
{2010212001|XXGvertex_oport_oport|1066|0|1751|0|{0|out|}685|686|}
{2010006001|XXGobject_psameas_object|1067|0|1753|0|{metadata|out_metadata|1|0|}686|685|}
{2010212001|XXGvertex_oport_oport|1068|0|1754|0|{1|reject|}685|687|}
{2010006001|XXGobject_psameas_object|1069|0|1756|0|{metadata|reject_metadata|1|0|}687|685|}
{2010212001|XXGvertex_oport_oport|1070|0|1757|0|{2|error|}685|688|}
{2010006001|XXGobject_psameas_object|1071|0|1759|0|{metadata|error_metadata|1|0|}688|685|}
{2010212001|XXGvertex_oport_oport|1072|0|1760|0|{3|log|}685|689|}
{2010006001|XXGobject_psameas_object|1073|0|1762|0|{metadata|log_metadata|1|0|}689|685|}
{2010212001|XXGvertex_oport_oport|1074|0|1763|0|{4|address|}685|690|}
{2010006001|XXGobject_psameas_object|1075|0|1765|0|{metadata|address_metadata|1|0|}690|685|}
{2010211001|XXGvertex_iport_iport|1076|0|1766|0|{0|in|}685|691|}
{2010006001|XXGobject_psameas_object|1077|0|1768|0|{metadata|in_metadata|1|0|}691|685|}
{2010601001|XXGgraph_vertex_vertex|1078|0|1769|0|{Create_Reduced_Aleternate_Data_Source|}668|692|}
{2010604001|XXGgraph_flow_flow|1079|0|1771|0|{Flow_1|}692|693|}
{2010604001|XXGgraph_flow_flow|1080|0|1773|0|{Flow_2|}692|694|}
{2010604001|XXGgraph_flow_flow|1081|0|1775|0|{Flow_3|}692|695|}
{2010601001|XXGgraph_vertex_vertex|1082|0|1777|0|{Create_Main_Reduced_File|}692|696|}
{2010604001|XXGgraph_flow_flow|1083|0|1779|0|{Flow_1|}696|697|}
{2010604001|XXGgraph_flow_flow|1084|0|1781|0|{Flow_14|}696|698|}
{2010601001|XXGgraph_vertex_vertex|1085|0|1783|0|{Compute_Multiple_Block_Compressed_Lookups|}696|699|}
{2010212001|XXGvertex_oport_oport|1086|0|1785|0|{0|out|}699|700|}
{2010213001|XXGoport_dst_flow|1087|0|1787|0|{0|}700|698|}
{2010212001|XXGvertex_oport_oport|1088|0|1788|0|{1|reject|}699|701|}
{2010212001|XXGvertex_oport_oport|1089|0|1790|0|{2|error|}699|702|}
{2010212001|XXGvertex_oport_oport|1090|0|1792|0|{3|log|}699|703|}
{2010212001|XXGvertex_oport_oport|1091|0|1794|0|{4|address|}699|704|}
{2010211001|XXGvertex_iport_iport|1092|0|1796|0|{0|in|}699|705|}
{2010214001|XXGiport_src_flow|1093|0|1798|0|{0|}705|697|}
{2010007001|XXGobject_proto_object|1094|0|1799|0|{}699|706|}
{2010212001|XXGvertex_oport_oport|1095|0|1801|0|{0|out|}706|707|}
{2010006001|XXGobject_psameas_object|1096|0|1803|0|{metadata|out_metadata|1|0|}707|706|}
{2010212001|XXGvertex_oport_oport|1097|0|1804|0|{1|reject|}706|708|}
{2010006001|XXGobject_psameas_object|1098|0|1806|0|{metadata|reject_metadata|1|0|}708|706|}
{2010212001|XXGvertex_oport_oport|1099|0|1807|0|{2|error|}706|709|}
{2010006001|XXGobject_psameas_object|1100|0|1809|0|{metadata|error_metadata|1|0|}709|706|}
{2010212001|XXGvertex_oport_oport|1101|0|1810|0|{3|log|}706|710|}
{2010006001|XXGobject_psameas_object|1102|0|1812|0|{metadata|log_metadata|1|0|}710|706|}
{2010212001|XXGvertex_oport_oport|1103|0|1813|0|{4|address|}706|711|}
{2010006001|XXGobject_psameas_object|1104|0|1815|0|{metadata|address_metadata|1|0|}711|706|}
{2010211001|XXGvertex_iport_iport|1105|0|1816|0|{0|in|}706|712|}
{2010006001|XXGobject_psameas_object|1106|0|1818|0|{metadata|in_metadata|1|0|}712|706|}
{2010601001|XXGgraph_vertex_vertex|1107|0|1819|0|{Drop_columns|}696|713|}
{2010212001|XXGvertex_oport_oport|1108|0|1821|0|{0|out0|}713|714|}
{2010213001|XXGoport_dst_flow|1109|0|1823|0|{0|}714|697|}
{2010212001|XXGvertex_oport_oport|1110|0|1824|0|{1|reject0|}713|715|}
{2010212001|XXGvertex_oport_oport|1111|0|1826|0|{2|error0|}713|716|}
{2010212001|XXGvertex_oport_oport|1112|0|1828|0|{3|log|}713|717|}
{2010211001|XXGvertex_iport_iport|1113|0|1830|0|{0|in|}713|718|}
{2010007001|XXGobject_proto_object|1114|0|1832|0|{}713|719|}
{2010212001|XXGvertex_oport_oport|1115|0|1834|0|{0|out0|}719|720|}
{2010006001|XXGobject_psameas_object|1116|0|1836|0|{metadata|out0_metadata|1|0|}720|719|}
{2010006001|XXGobject_psameas_object|1117|0|1837|0|{transform0|transform0|1|0|}720|719|}
{2010212001|XXGvertex_oport_oport|1118|0|1838|0|{1|reject0|}719|721|}
{2010006001|XXGobject_psameas_object|1119|0|1840|0|{metadata|reject0_metadata|1|0|}721|719|}
{2010212001|XXGvertex_oport_oport|1120|0|1841|0|{2|error0|}719|722|}
{2010006001|XXGobject_psameas_object|1121|0|1843|0|{metadata|error0_metadata|1|0|}722|719|}
{2010212001|XXGvertex_oport_oport|1122|0|1844|0|{3|log|}719|723|}
{2010006001|XXGobject_psameas_object|1123|0|1846|0|{metadata|log_metadata|1|0|}723|719|}
{2010211001|XXGvertex_iport_iport|1124|0|1847|0|{0|in|}719|724|}
{2010006001|XXGobject_psameas_object|1125|0|1849|0|{metadata|in_metadata|1|0|}724|719|}
{2010601001|XXGgraph_vertex_vertex|1126|0|1850|0|{Write_Multiple_Files|}696|725|}
{2010212001|XXGvertex_oport_oport|1127|0|1852|0|{0|reject|}725|726|}
{2010212001|XXGvertex_oport_oport|1128|0|1854|0|{1|error|}725|727|}
{2010212001|XXGvertex_oport_oport|1129|0|1856|0|{2|log|}725|728|}
{2010211001|XXGvertex_iport_iport|1130|0|1858|0|{0|in|}725|729|}
{2010214001|XXGiport_src_flow|1131|0|1860|0|{0|}729|698|}
{2010007001|XXGobject_proto_object|1132|0|1861|0|{}725|730|}
{2010212001|XXGvertex_oport_oport|1133|0|1863|0|{0|reject|}730|731|}
{2010006001|XXGobject_psameas_object|1134|0|1865|0|{metadata|reject_metadata|1|0|}731|730|}
{2010212001|XXGvertex_oport_oport|1135|0|1866|0|{1|error|}730|732|}
{2010006001|XXGobject_psameas_object|1136|0|1868|0|{metadata|error_metadata|1|0|}732|730|}
{2010212001|XXGvertex_oport_oport|1137|0|1869|0|{2|log|}730|733|}
{2010006001|XXGobject_psameas_object|1138|0|1871|0|{metadata|log_metadata|1|0|}733|730|}
{2010211001|XXGvertex_iport_iport|1139|0|1872|0|{0|in|}730|734|}
{2010006001|XXGobject_psameas_object|1140|0|1874|0|{metadata|in_metadata|1|0|}734|730|}
{2010211001|XXGvertex_iport_iport|1141|0|1875|0|{0|in0|}696|735|}
{2010215002|XXGiport_binding_iport|1142|0|1877|0|{.5|.5|{0|}11418|}735|718|}
{2010214001|XXGiport_src_flow|1143|0|1878|0|{0|}735|694|}
{2010601001|XXGgraph_vertex_vertex|1144|0|1879|0|{Create_Step2_Reduced_File|}692|736|}
{2010604001|XXGgraph_flow_flow|1145|0|1881|0|{Flow_1|}736|737|}
{2010604001|XXGgraph_flow_flow|1146|0|1883|0|{Flow_14|}736|738|}
{2010601001|XXGgraph_vertex_vertex|1147|0|1885|0|{Compute_Multiple_Block_Compressed_Lookups|}736|739|}
{2010212001|XXGvertex_oport_oport|1148|0|1887|0|{0|out|}739|740|}
{2010213001|XXGoport_dst_flow|1149|0|1889|0|{0|}740|738|}
{2010212001|XXGvertex_oport_oport|1150|0|1890|0|{1|reject|}739|741|}
{2010212001|XXGvertex_oport_oport|1151|0|1892|0|{2|error|}739|742|}
{2010212001|XXGvertex_oport_oport|1152|0|1894|0|{3|log|}739|743|}
{2010212001|XXGvertex_oport_oport|1153|0|1896|0|{4|address|}739|744|}
{2010211001|XXGvertex_iport_iport|1154|0|1898|0|{0|in|}739|745|}
{2010214001|XXGiport_src_flow|1155|0|1900|0|{0|}745|737|}
{2010007001|XXGobject_proto_object|1156|0|1901|0|{}739|746|}
{2010212001|XXGvertex_oport_oport|1157|0|1903|0|{0|out|}746|747|}
{2010006001|XXGobject_psameas_object|1158|0|1905|0|{metadata|out_metadata|1|0|}747|746|}
{2010212001|XXGvertex_oport_oport|1159|0|1906|0|{1|reject|}746|748|}
{2010006001|XXGobject_psameas_object|1160|0|1908|0|{metadata|reject_metadata|1|0|}748|746|}
{2010212001|XXGvertex_oport_oport|1161|0|1909|0|{2|error|}746|749|}
{2010006001|XXGobject_psameas_object|1162|0|1911|0|{metadata|error_metadata|1|0|}749|746|}
{2010212001|XXGvertex_oport_oport|1163|0|1912|0|{3|log|}746|750|}
{2010006001|XXGobject_psameas_object|1164|0|1914|0|{metadata|log_metadata|1|0|}750|746|}
{2010212001|XXGvertex_oport_oport|1165|0|1915|0|{4|address|}746|751|}
{2010006001|XXGobject_psameas_object|1166|0|1917|0|{metadata|address_metadata|1|0|}751|746|}
{2010211001|XXGvertex_iport_iport|1167|0|1918|0|{0|in|}746|752|}
{2010006001|XXGobject_psameas_object|1168|0|1920|0|{metadata|in_metadata|1|0|}752|746|}
{2010006001|XXGobject_psameas_object|1169|0|1921|0|{reject_metadata|in_metadata|0|0|}739|739|}
{2010601001|XXGgraph_vertex_vertex|1170|0|1922|0|{Drop_columns|}736|753|}
{2010212001|XXGvertex_oport_oport|1171|0|1924|0|{0|out0|}753|754|}
{2010213001|XXGoport_dst_flow|1172|0|1926|0|{0|}754|737|}
{2010212001|XXGvertex_oport_oport|1173|0|1927|0|{1|reject0|}753|755|}
{2010212001|XXGvertex_oport_oport|1174|0|1929|0|{2|error0|}753|756|}
{2010212001|XXGvertex_oport_oport|1175|0|1931|0|{3|log|}753|757|}
{2010211001|XXGvertex_iport_iport|1176|0|1933|0|{0|in|}753|758|}
{2010007001|XXGobject_proto_object|1177|0|1935|0|{}753|759|}
{2010212001|XXGvertex_oport_oport|1178|0|1937|0|{0|out0|}759|760|}
{2010006001|XXGobject_psameas_object|1179|0|1939|0|{metadata|out0_metadata|1|0|}760|759|}
{2010006001|XXGobject_psameas_object|1180|0|1940|0|{transform0|transform0|1|0|}760|759|}
{2010212001|XXGvertex_oport_oport|1181|0|1941|0|{1|reject0|}759|761|}
{2010006001|XXGobject_psameas_object|1182|0|1943|0|{metadata|reject0_metadata|1|0|}761|759|}
{2010212001|XXGvertex_oport_oport|1183|0|1944|0|{2|error0|}759|762|}
{2010006001|XXGobject_psameas_object|1184|0|1946|0|{metadata|error0_metadata|1|0|}762|759|}
{2010212001|XXGvertex_oport_oport|1185|0|1947|0|{3|log|}759|763|}
{2010006001|XXGobject_psameas_object|1186|0|1949|0|{metadata|log_metadata|1|0|}763|759|}
{2010211001|XXGvertex_iport_iport|1187|0|1950|0|{0|in|}759|764|}
{2010006001|XXGobject_psameas_object|1188|0|1952|0|{metadata|in_metadata|1|0|}764|759|}
{2010601001|XXGgraph_vertex_vertex|1189|0|1953|0|{Write_Multiple_Files|}736|765|}
{2010212001|XXGvertex_oport_oport|1190|0|1955|0|{0|reject|}765|766|}
{2010212001|XXGvertex_oport_oport|1191|0|1957|0|{1|error|}765|767|}
{2010212001|XXGvertex_oport_oport|1192|0|1959|0|{2|log|}765|768|}
{2010211001|XXGvertex_iport_iport|1193|0|1961|0|{0|in|}765|769|}
{2010214001|XXGiport_src_flow|1194|0|1963|0|{0|}769|738|}
{2010007001|XXGobject_proto_object|1195|0|1964|0|{}765|770|}
{2010212001|XXGvertex_oport_oport|1196|0|1966|0|{0|reject|}770|771|}
{2010006001|XXGobject_psameas_object|1197|0|1968|0|{metadata|reject_metadata|1|0|}771|770|}
{2010212001|XXGvertex_oport_oport|1198|0|1969|0|{1|error|}770|772|}
{2010006001|XXGobject_psameas_object|1199|0|1971|0|{metadata|error_metadata|1|0|}772|770|}
{2010212001|XXGvertex_oport_oport|1200|0|1972|0|{2|log|}770|773|}
{2010006001|XXGobject_psameas_object|1201|0|1974|0|{metadata|log_metadata|1|0|}773|770|}
{2010211001|XXGvertex_iport_iport|1202|0|1975|0|{0|in|}770|774|}
{2010006001|XXGobject_psameas_object|1203|0|1977|0|{metadata|in_metadata|1|0|}774|770|}
{2010211001|XXGvertex_iport_iport|1204|0|1978|0|{0|in0|}736|775|}
{2010215002|XXGiport_binding_iport|1205|0|1980|0|{.5|.5|{0|}11428|}775|758|}
{2010214001|XXGiport_src_flow|1206|0|1981|0|{0|}775|693|}
{2010601001|XXGgraph_vertex_vertex|1207|0|1982|0|{Create_Step3_Reduced_File|}692|776|}
{2010604001|XXGgraph_flow_flow|1208|0|1984|0|{Flow_1|}776|777|}
{2010604001|XXGgraph_flow_flow|1209|0|1986|0|{Flow_14|}776|778|}
{2010601001|XXGgraph_vertex_vertex|1210|0|1988|0|{Compute_Multiple_Block_Compressed_Lookups|}776|779|}
{2010212001|XXGvertex_oport_oport|1211|0|1990|0|{0|out|}779|780|}
{2010213001|XXGoport_dst_flow|1212|0|1992|0|{0|}780|778|}
{2010212001|XXGvertex_oport_oport|1213|0|1993|0|{1|reject|}779|781|}
{2010212001|XXGvertex_oport_oport|1214|0|1995|0|{2|error|}779|782|}
{2010212001|XXGvertex_oport_oport|1215|0|1997|0|{3|log|}779|783|}
{2010212001|XXGvertex_oport_oport|1216|0|1999|0|{4|address|}779|784|}
{2010211001|XXGvertex_iport_iport|1217|0|2001|0|{0|in|}779|785|}
{2010214001|XXGiport_src_flow|1218|0|2003|0|{0|}785|777|}
{2010007001|XXGobject_proto_object|1219|0|2004|0|{}779|786|}
{2010212001|XXGvertex_oport_oport|1220|0|2006|0|{0|out|}786|787|}
{2010006001|XXGobject_psameas_object|1221|0|2008|0|{metadata|out_metadata|1|0|}787|786|}
{2010212001|XXGvertex_oport_oport|1222|0|2009|0|{1|reject|}786|788|}
{2010006001|XXGobject_psameas_object|1223|0|2011|0|{metadata|reject_metadata|1|0|}788|786|}
{2010212001|XXGvertex_oport_oport|1224|0|2012|0|{2|error|}786|789|}
{2010006001|XXGobject_psameas_object|1225|0|2014|0|{metadata|error_metadata|1|0|}789|786|}
{2010212001|XXGvertex_oport_oport|1226|0|2015|0|{3|log|}786|790|}
{2010006001|XXGobject_psameas_object|1227|0|2017|0|{metadata|log_metadata|1|0|}790|786|}
{2010212001|XXGvertex_oport_oport|1228|0|2018|0|{4|address|}786|791|}
{2010006001|XXGobject_psameas_object|1229|0|2020|0|{metadata|address_metadata|1|0|}791|786|}
{2010211001|XXGvertex_iport_iport|1230|0|2021|0|{0|in|}786|792|}
{2010006001|XXGobject_psameas_object|1231|0|2023|0|{metadata|in_metadata|1|0|}792|786|}
{2010006001|XXGobject_psameas_object|1232|0|2024|0|{reject_metadata|in_metadata|0|0|}779|779|}
{2010601001|XXGgraph_vertex_vertex|1233|0|2025|0|{Drop_columns|}776|793|}
{2010212001|XXGvertex_oport_oport|1234|0|2027|0|{0|out0|}793|794|}
{2010213001|XXGoport_dst_flow|1235|0|2029|0|{0|}794|777|}
{2010212001|XXGvertex_oport_oport|1236|0|2030|0|{1|reject0|}793|795|}
{2010212001|XXGvertex_oport_oport|1237|0|2032|0|{2|error0|}793|796|}
{2010212001|XXGvertex_oport_oport|1238|0|2034|0|{3|log|}793|797|}
{2010211001|XXGvertex_iport_iport|1239|0|2036|0|{0|in|}793|798|}
{2010007001|XXGobject_proto_object|1240|0|2038|0|{}793|799|}
{2010212001|XXGvertex_oport_oport|1241|0|2040|0|{0|out0|}799|800|}
{2010006001|XXGobject_psameas_object|1242|0|2042|0|{metadata|out0_metadata|1|0|}800|799|}
{2010006001|XXGobject_psameas_object|1243|0|2043|0|{transform0|transform0|1|0|}800|799|}
{2010212001|XXGvertex_oport_oport|1244|0|2044|0|{1|reject0|}799|801|}
{2010006001|XXGobject_psameas_object|1245|0|2046|0|{metadata|reject0_metadata|1|0|}801|799|}
{2010212001|XXGvertex_oport_oport|1246|0|2047|0|{2|error0|}799|802|}
{2010006001|XXGobject_psameas_object|1247|0|2049|0|{metadata|error0_metadata|1|0|}802|799|}
{2010212001|XXGvertex_oport_oport|1248|0|2050|0|{3|log|}799|803|}
{2010006001|XXGobject_psameas_object|1249|0|2052|0|{metadata|log_metadata|1|0|}803|799|}
{2010211001|XXGvertex_iport_iport|1250|0|2053|0|{0|in|}799|804|}
{2010006001|XXGobject_psameas_object|1251|0|2055|0|{metadata|in_metadata|1|0|}804|799|}
{2010601001|XXGgraph_vertex_vertex|1252|0|2056|0|{Write_Multiple_Files|}776|805|}
{2010212001|XXGvertex_oport_oport|1253|0|2058|0|{0|reject|}805|806|}
{2010212001|XXGvertex_oport_oport|1254|0|2060|0|{1|error|}805|807|}
{2010212001|XXGvertex_oport_oport|1255|0|2062|0|{2|log|}805|808|}
{2010211001|XXGvertex_iport_iport|1256|0|2064|0|{0|in|}805|809|}
{2010214001|XXGiport_src_flow|1257|0|2066|0|{0|}809|778|}
{2010007001|XXGobject_proto_object|1258|0|2067|0|{}805|810|}
{2010212001|XXGvertex_oport_oport|1259|0|2069|0|{0|reject|}810|811|}
{2010006001|XXGobject_psameas_object|1260|0|2071|0|{metadata|reject_metadata|1|0|}811|810|}
{2010212001|XXGvertex_oport_oport|1261|0|2072|0|{1|error|}810|812|}
{2010006001|XXGobject_psameas_object|1262|0|2074|0|{metadata|error_metadata|1|0|}812|810|}
{2010212001|XXGvertex_oport_oport|1263|0|2075|0|{2|log|}810|813|}
{2010006001|XXGobject_psameas_object|1264|0|2077|0|{metadata|log_metadata|1|0|}813|810|}
{2010211001|XXGvertex_iport_iport|1265|0|2078|0|{0|in|}810|814|}
{2010006001|XXGobject_psameas_object|1266|0|2080|0|{metadata|in_metadata|1|0|}814|810|}
{2010211001|XXGvertex_iport_iport|1267|0|2081|0|{0|in0|}776|815|}
{2010215002|XXGiport_binding_iport|1268|0|2083|0|{.5|.5|{0|}11437|}815|798|}
{2010214001|XXGiport_src_flow|1269|0|2084|0|{0|}815|695|}
{2010601001|XXGgraph_vertex_vertex|1270|0|2085|0|{Replicate|}692|816|}
{2010212001|XXGvertex_oport_oport|1271|0|2087|0|{0|out|}816|817|}
{2010213001|XXGoport_dst_flow|1272|0|2089|0|{0|}817|694|}
{2010213001|XXGoport_dst_flow|1273|0|2090|0|{1|}817|693|}
{2010213001|XXGoport_dst_flow|1274|0|2091|0|{2|}817|695|}
{2010211001|XXGvertex_iport_iport|1275|0|2092|0|{0|in|}816|818|}
{2010007001|XXGobject_proto_object|1276|0|2094|0|{}816|819|}
{2010212001|XXGvertex_oport_oport|1277|0|2096|0|{0|out|}819|820|}
{2010006001|XXGobject_psameas_object|1278|0|2098|0|{metadata|out_metadata|1|0|}820|819|}
{2010211001|XXGvertex_iport_iport|1279|0|2099|0|{0|in|}819|821|}
{2010006001|XXGobject_psameas_object|1280|0|2101|0|{metadata|in_metadata|1|0|}821|819|}
{2010211001|XXGvertex_iport_iport|1281|0|2102|0|{0|in0|}692|822|}
{2010215002|XXGiport_binding_iport|1282|0|2104|0|{.5|.5|{0|}11446|}822|818|}
{2010214001|XXGiport_src_flow|1283|0|2105|0|{0|}822|675|}
{2010601001|XXGgraph_vertex_vertex|1284|0|2106|0|{Replicate|}668|823|}
{2010212001|XXGvertex_oport_oport|1285|0|2108|0|{0|out|}823|824|}
{2010213001|XXGoport_dst_flow|1286|0|2110|0|{0|}824|673|}
{2010213001|XXGoport_dst_flow|1287|0|2111|0|{1|}824|674|}
{2010213001|XXGoport_dst_flow|1288|0|2112|0|{2|}824|675|}
{2010211001|XXGvertex_iport_iport|1289|0|2113|0|{0|in|}823|825|}
{2010007001|XXGobject_proto_object|1290|0|2115|0|{}823|826|}
{2010212001|XXGvertex_oport_oport|1291|0|2117|0|{0|out|}826|827|}
{2010006001|XXGobject_psameas_object|1292|0|2119|0|{metadata|out_metadata|1|0|}827|826|}
{2010211001|XXGvertex_iport_iport|1293|0|2120|0|{0|in|}826|828|}
{2010006001|XXGobject_psameas_object|1294|0|2122|0|{metadata|in_metadata|1|0|}828|826|}
{2010601001|XXGgraph_vertex_vertex|1295|0|2123|0|{Sort_on_INDEX_FIELD|}668|829|}
{2010212001|XXGvertex_oport_oport|1296|0|2125|0|{0|out|}829|830|}
{2010213001|XXGoport_dst_flow|1297|0|2127|0|{0|}830|676|}
{2010211001|XXGvertex_iport_iport|1298|0|2128|0|{0|in|}829|831|}
{2010214001|XXGiport_src_flow|1299|0|2130|0|{0|}831|674|}
{2010007001|XXGobject_proto_object|1300|0|2131|0|{}829|832|}
{2010212001|XXGvertex_oport_oport|1301|0|2133|0|{0|out|}832|833|}
{2010006001|XXGobject_psameas_object|1302|0|2135|0|{metadata|out_metadata|1|0|}833|832|}
{2010211001|XXGvertex_iport_iport|1303|0|2136|0|{0|in|}832|834|}
{2010006001|XXGobject_psameas_object|1304|0|2138|0|{metadata|in_metadata|1|0|}834|832|}
{2010601001|XXGgraph_vertex_vertex|1305|0|2139|0|{Write_Date_wise_ICFFs_for_additional_index|}668|835|}
{2010212001|XXGvertex_oport_oport|1306|0|2141|0|{0|reject|}835|836|}
{2010212001|XXGvertex_oport_oport|1307|0|2143|0|{1|error|}835|837|}
{2010212001|XXGvertex_oport_oport|1308|0|2145|0|{2|log|}835|838|}
{2010212001|XXGvertex_oport_oport|1309|0|2147|0|{3|address|}835|839|}
{2010211001|XXGvertex_iport_iport|1310|0|2149|0|{0|in|}835|840|}
{2010214001|XXGiport_src_flow|1311|0|2151|0|{0|}840|676|}
{2010007001|XXGobject_proto_object|1312|0|2152|0|{}835|841|}
{2010212001|XXGvertex_oport_oport|1313|0|2154|0|{0|reject|}841|842|}
{2010006001|XXGobject_psameas_object|1314|0|2156|0|{metadata|reject_metadata|1|0|}842|841|}
{2010212001|XXGvertex_oport_oport|1315|0|2157|0|{1|error|}841|843|}
{2010006001|XXGobject_psameas_object|1316|0|2159|0|{metadata|error_metadata|1|0|}843|841|}
{2010212001|XXGvertex_oport_oport|1317|0|2160|0|{2|log|}841|844|}
{2010006001|XXGobject_psameas_object|1318|0|2162|0|{metadata|log_metadata|1|0|}844|841|}
{2010212001|XXGvertex_oport_oport|1319|0|2163|0|{3|address|}841|845|}
{2010006001|XXGobject_psameas_object|1320|0|2165|0|{metadata|address_metadata|1|0|}845|841|}
{2010211001|XXGvertex_iport_iport|1321|0|2166|0|{0|in|}841|846|}
{2010006001|XXGobject_psameas_object|1322|0|2168|0|{metadata|in_metadata|1|0|}846|841|}
{2010601001|XXGgraph_vertex_vertex|1323|0|2169|0|{Write_Multiple_Files|}668|847|}
{2010212001|XXGvertex_oport_oport|1324|0|2171|0|{0|reject|}847|848|}
{2010212001|XXGvertex_oport_oport|1325|0|2173|0|{1|error|}847|849|}
{2010212001|XXGvertex_oport_oport|1326|0|2175|0|{2|log|}847|850|}
{2010211001|XXGvertex_iport_iport|1327|0|2177|0|{0|in|}847|851|}
{2010214001|XXGiport_src_flow|1328|0|2179|0|{0|}851|677|}
{2010007001|XXGobject_proto_object|1329|0|2180|0|{}847|852|}
{2010212001|XXGvertex_oport_oport|1330|0|2182|0|{0|reject|}852|853|}
{2010006001|XXGobject_psameas_object|1331|0|2184|0|{metadata|reject_metadata|1|0|}853|852|}
{2010212001|XXGvertex_oport_oport|1332|0|2185|0|{1|error|}852|854|}
{2010006001|XXGobject_psameas_object|1333|0|2187|0|{metadata|error_metadata|1|0|}854|852|}
{2010212001|XXGvertex_oport_oport|1334|0|2188|0|{2|log|}852|855|}
{2010006001|XXGobject_psameas_object|1335|0|2190|0|{metadata|log_metadata|1|0|}855|852|}
{2010211001|XXGvertex_iport_iport|1336|0|2191|0|{0|in|}852|856|}
{2010006001|XXGobject_psameas_object|1337|0|2193|0|{metadata|in_metadata|1|0|}856|852|}
{2010211001|XXGvertex_iport_iport|1338|0|2194|0|{0|in0|}668|857|}
{2010215002|XXGiport_binding_iport|1339|0|2196|0|{.5|.5|{0|}11451|}857|825|}
{2010109001|XXGobject_property_value|1340|0|2197|0|{0|TrackingThumbprint|72|}1|858|}
