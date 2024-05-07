@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|112|rel_count|189|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/event/file_event_registration.xfr";
include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DB_XFR/distribute.publish_list.xfr";|8|9|RK|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_FILE_INFO|#Logical Target          Local MFS URL          Local Serial URL        Remote MFS URL          Remote Serial URL          DML Directory                //This parameter must be set in interim pset|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_FILE_INFO_VEC|$[get_publish_info_vec(TARGET_FILE_INFO)]|3|9|RK|@{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_DATASET_TYPE|Delta|15|9|FK|@{2|Delta|Full|}}
{30001002|XXparameter|TARGET_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(TARGET_NAME) ]|3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_LOWER, "[.].*", "") ]|3|9|RK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ string_split( TARGET_LOWER, ".") [1]]|3|9|RK|@{0|}}
{30001002|XXparameter|IS_INPUT_IS_JSON|False|13|9|FK|@{0|}}
{30001002|XXparameter|IS_APPLY_CLEANSING|False|13|9|RFK|@{0|}}
{30001002|XXparameter|IS_WRITE_FINAL_EXTRACT|False|13|9|FK|@{0|}}
{30001002|XXparameter|DO_PROCESS_ILM_EVENTS|0|3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_IS_COMPRESSED|False|13|9|RFK|@{0|}}
{30001002|XXparameter|_STANDARD_PUBLISH_PARAMETERS__|/*************************May not be needed ****************/|3|9|K|@{0|}}
{30001002|XXparameter|REGISTRATION_DETAILS_VEC|$[ get_registration_details_for_flat_file(TARGET_SYSTEM, TARGET_ENTITY, DO_PROCESS_ILM_EVENTS) ]|3|9|RK|@{0|}}
{30001002|XXparameter|REGISTRATION_DETAILS|$[
REGISTRATION_DETAILS_VEC[0]
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_LAYOUT|$[REGISTRATION_DETAILS.target_layout]|3|9|RK|@{0|}}
{30001002|XXparameter|PUBLISH_SERVER_TYPE|$[REGISTRATION_DETAILS.publish_server_type]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_FILE_NAME|$[if(TARGET_IS_COMPRESSED) TARGET_LOWER + ".dat.gz" else TARGET_LOWER + ".dat"]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_INFO|$[get_publish_info(TARGET_FILE_INFO_VEC, TARGET_NAME, TARGET_FILE_NAME, PUBLISH_SERVER_TYPE, TARGET_LAYOUT,1)]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML|$[TARGET_INFO.target_dml]|18|9|RK|@{0|}}
{30001002|XXparameter|LR_FILE_NAME|AB_PARAMETER_ENV|18|10|RKd|A vector of shred file names that match both the ILM pattern and the "logical" target table name.|{0|}}
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
{30001002|XXparameter|LR_FILE_DML|$[if(IS_INPUT_IS_JSON) "void(1)" else join_types("record\\n string(1) event_indicator; //Flag that would differentiate the records. I-Insert \| U-Update \| D- Delete\\n end" , read_file(TARGET_DML)) ]|7|9|RK|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.1.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|ETL_APP_ID|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|ETL_APP_ID:eme|APP_ORCA_RXCLAIM|3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID:sandbox|$(whoami)|3|9||@{0|}}
{30001002|XXparameter|EVENT_CONSUMPTION_FILE_PATH|$\{AI_SERIAL\}/cnsm_log/file/cnsm_log.$\{TARGET_SYSTEM\}.$\{TARGET_ENTITY\}.dat|18|9|RK|@{0|}}
{30001002|XXparameter|_SFTP__PARAMETERS________|/*************************Parameters related with XML, Json or other File Formats****************/|3|9|K|@{0|}}
{30001002|XXparameter|SFTP_OPTIONS|-o PreferredAuthentications=password -o PubkeyAuthentication=no -o ServerAliveInterval=60|3|9|K|@{0|}}
{30001002|XXparameter|SFTP_HOST|AI_PHASE|3|10|FKd|Provide SFTP Host details|{0|}}
{30001002|XXparameter|SFTP_USER|AI_PHASE|3|10|FKd|ECG user id |{0|}}
{30001002|XXparameter|SFTP_ENCRYPTED_PASSWORD|AI_PHASE|3|10|FKd|Encrypted password|{0|}}
{30001002|XXparameter|ADD_PHASE_PREFIX_IN_FILENAME|True|13|9|FK|This suffix can be added into file name if there is only one target location and |{0|}}
{30001002|XXparameter|SFTP_LOCATION|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|DATE_SUFFIX|@3|9|FK|@{0|}}
{30001002|XXparameter|SFTP_FILE_NM||3|9|FK|@{0|}}
{30001002|XXparameter|SFTP_FILE_URL|$[if((ADD_PHASE_PREFIX_IN_FILENAME) and  (AI_PHASE!="prod"))   SFTP_LOCATION +"/" + AI_PHASE +"_" +  SFTP_FILE_NM  else SFTP_LOCATION +"/" + SFTP_FILE_NM ]|3|9|K|@{0|}}
{30001002|XXparameter|SFTP_LOCATION:dev||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:qa||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:integration||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:uat||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:prod||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:stage||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:dev||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:qa||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:integration||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:uat||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:prod||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:stage||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:dev||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:qa||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:integration||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:uat||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:prod||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:stage||3|9||@{0|}}
{30001002|XXparameter|SFTP_ENCRYPTED_PASSWORD:dev||3|9||@{0|}}
{30001002|XXparameter|SFTP_ENCRYPTED_PASSWORD:qa||3|9||@{0|}}
{30001002|XXparameter|SFTP_ENCRYPTED_PASSWORD:integration||3|9||@{0|}}
{30001002|XXparameter|SFTP_ENCRYPTED_PASSWORD:uat||3|9||@{0|}}
{30001002|XXparameter|SFTP_ENCRYPTED_PASSWORD:prod||3|9||@{0|}}
{30001002|XXparameter|SFTP_ENCRYPTED_PASSWORD:stage||3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|distribute.publish.file|Gunit Kaur|Created 11/10/2016 7:11:04 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1152000|563000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{3|1|1|1|}Job 'distribute.publish.sftp' Execution Status Report


Job "distribute.publish.sftp" Execution started at Wednesday, May 03, 2017 16:42:34
Job completed successfully at Wednesday, May 03, 2017 16:43:00

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:25
Run performed by user nnagraj
Total data moved through all flows: 944 records (171180 bytes)
Total CPU time (all processes): 2 seconds
Average CPU utilization across all nodes: 0.00 percent
||
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apsrd02143 - RHEL 7||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|128|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@PUBLISH TO SFTP LOCATION|303000|74000|0|0|0|0|14152|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|128|240|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@TARGET_NAME: $TARGET_NAME  |321000|138000|333000|83000|111000|48000|14215|}}
{2010242002|XXGface|8|0|15|0|{@{}@Calibri|128|140|1|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@This intermediate fileis generated in $AI_SERIAL_TEMP
 to validate exact data being sent  |696000|233000|333000|83000|111000|48000|14216|}}
{2010242002|XXGface|10|0|19|0|{@{}@Calibri|128|100|0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14223|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14218|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14220|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14226|529|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}14196|531|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14221|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14225|531|}}
{2010600005|XXGgraph|18|0|35|0|{Subgraph created from graph "distribute.publish.sftp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[not IS_INPUT_IS_JSON]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@461000|275500|0|0|0|0|14219|Drop Event Indicator -If File is not Void type|Mukesh Singh|Created 4/26/2017 3:15:16 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|775000|231000|3|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}14181|17|}}
{2010243001|XXGwatcher|20|0|39|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}14182|17|}}
{2010501005|XXGpvertex|22|0|43|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
 out.(*, form == 'string') :1: string_filter_out(in.*, "/n\|");
 out.* :2: in.*;
  
end;|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[IS_APPLY_CLEANSING]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|265000|41500|0|0|0|0|14183|RFMT:Cleanse special characters|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|23|0|45|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|24|0|48|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|25|0|50|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|26|0|52|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|27|0|54|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|28|0|57|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|29|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|30|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|31|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|32|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|33|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|34|0|75|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
}}@0|Gather|348000|325000|0|0|0|0|14227|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|35|0|77|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|36|0|80|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|37|0|83|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|38|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|39|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|40|0|91|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LR_FILE_NAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LR_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$LR_FILE_DML|3|9||@{0|}}
}}@0|@59000|311000|0|0|0|0|14224|IFIL: Load Ready File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|41|0|93|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|42|0|96|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|43|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|44|0|102|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|40000|30000|0|0|0|0|14177|RFMT: Drop event indicator and generate final log output|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|45|0|104|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|46|0|107|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|47|0|109|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|48|0|111|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|113|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|50|0|115|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|51|0|117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|52|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|53|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|54|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|55|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|56|0|139|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Redefine_Format.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Redefine Format|549000|80000|0|0|0|0|14180|Redefine Format|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|57|0|141|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|58|0|143|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|59|0|146|0|{Copies data records from its input to its output without changing the values.  Use Redefine Format to change a record format or rename fields.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|copy|3|1|Hl||{0|}}
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
{2010203004|XXGoport|60|0|148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|61|0|151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|62|0|156|0|{@{}@0|0|0|0|out0|.4387755102040816|@@@14352|0|}}
{2010202004|XXGiport|63|0|160|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|64|0|164|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|in_metadata|void(1)|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Gather|811000|323500|0|0|0|0|14197|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|65|0|166|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|66|0|169|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|67|0|172|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|68|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|69|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|70|0|180|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_To.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|host|$SFTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|target_file|$SFTP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|user|$SFTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$PUB_FTP_BIN/sftp-put.script|3|2|$|@{0|}}
{30001002|XXparameter|encrypted_passphrase|$SFTP_ENCRYPTED_PASSWORD|3|2|$|@{0|}}
{30001002|XXparameter|extra_args|$SFTP_OPTIONS|3|2|$|@{0|}}
{30001002|XXparameter|passphrase_required|need passphrase|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|@1014000|308000|0|0|0|0|14160|SFTP To|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|71|0|182|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|184|0|{@{}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010501005|XXGpvertex|73|0|187|0|{Transfers files of data records to a computer not running the Co>Operating® System using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-to|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|target_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|target_file.display_name|target-file|3|9|P|@{0|}}
{30001002|XXparameter|target_file.keyword|target-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|temp_target||3|2|FK$|Remote temporary file name|{0|}}
{30001002|XXparameter|temp_target.display_name|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.keyword|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|74|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|75|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010503005|XXGfvertex|76|0|197|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/$SFTP_FILE_NM", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP/$SFTP_FILE_NM|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_WRITE_FINAL_EXTRACT]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
}}@0|@905000|315500|0|0|0|0|14222|Intermediate File|Ab Initio Software|@1|10000000|0||6||257|-1|-1|}}
{2010203004|XXGoport|77|0|199|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|78|0|202|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|79|0|205|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|80|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|81|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|82|0|215|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|205000|323500|0|0|0|0|14176|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|83|0|217|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|84|0|220|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|85|0|223|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|86|0|225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|87|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|88|0|234|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|694000|325000|0|0|0|0|14190|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|89|0|236|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|90|0|239|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|91|0|242|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|92|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|93|0|247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|94|0|254|0|{Subgraph created from graph "distribute.publish.file"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[TARGET_DATASET_TYPE == "Delta"]|3|9|F||{0|}}
}}@0|@896500|436250|0|0|0|0|14194|Update Consumption Log|Gunit Kaur|Created 2/6/2017 9:04:30 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|419000|176000|3|}}
{2010210004|XXGflow|95|0|256|0|{@{}@384|.5|.5|{0|}12968|17|}}
{2010210004|XXGflow|96|0|258|0|{@{}@384|.5|.5|{0|}12966|17|}}
{2010503005|XXGfvertex|97|0|260|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$EVENT_CONSUMPTION_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@2|@297000|87500|0|0|0|0|12969|Consumption Log|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|98|0|262|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|99|0|265|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|100|0|267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|101|0|270|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{AI_SERIAL\}/consumption_log/interim_log.$\{TARGET_SYSTEM\}.$\{TARGET_ENTITY\}.dat|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@2|@55000|88000|0|0|0|0|12967|Interim Events Log|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|102|0|272|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|103|0|275|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|104|0|277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|105|0|280|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|195000|97500|0|0|0|0|12963|Updating Consumption Entry|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|106|0|282|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|107|0|285|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|108|0|288|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|109|0|290|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|110|0|293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010110002|XXGconstant|111|0|299|0|{@{}@{1|5931431|}}}
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
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_2|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_3|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_4|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_5|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_6|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_7|}1|17|}
{2010601001|XXGgraph_vertex_vertex|17|0|34|0|{Drop_Event_Indicator_If_File_is_not_Void_type|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_1|}18|19|}
{2010244001|XXGflow_watcher_watcher|19|0|38|0|{}19|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_2|}18|21|}
{2010601001|XXGgraph_vertex_vertex|21|0|42|0|{RFMT_Cleanse_special_characters|}18|22|}
{2010212001|XXGvertex_oport_oport|22|0|44|0|{0|out0|}22|23|}
{2010213001|XXGoport_dst_flow|23|0|46|0|{0|}23|21|}
{2010212001|XXGvertex_oport_oport|24|0|47|0|{1|reject0|}22|24|}
{2010212001|XXGvertex_oport_oport|25|0|49|0|{2|error0|}22|25|}
{2010212001|XXGvertex_oport_oport|26|0|51|0|{3|log|}22|26|}
{2010211001|XXGvertex_iport_iport|27|0|53|0|{0|in|}22|27|}
{2010214001|XXGiport_src_flow|28|0|55|0|{0|}27|19|}
{2010007001|XXGobject_proto_object|29|0|56|0|{}22|28|}
{2010212001|XXGvertex_oport_oport|30|0|58|0|{0|out0|}28|29|}
{2010006001|XXGobject_psameas_object|31|0|60|0|{metadata|out0_metadata|1|0|}29|28|}
{2010006001|XXGobject_psameas_object|32|0|61|0|{transform0|transform0|1|0|}29|28|}
{2010212001|XXGvertex_oport_oport|33|0|62|0|{1|reject0|}28|30|}
{2010006001|XXGobject_psameas_object|34|0|64|0|{metadata|reject0_metadata|1|0|}30|28|}
{2010212001|XXGvertex_oport_oport|35|0|65|0|{2|error0|}28|31|}
{2010006001|XXGobject_psameas_object|36|0|67|0|{metadata|error0_metadata|1|0|}31|28|}
{2010212001|XXGvertex_oport_oport|37|0|68|0|{3|log|}28|32|}
{2010006001|XXGobject_psameas_object|38|0|70|0|{metadata|log_metadata|1|0|}32|28|}
{2010211001|XXGvertex_iport_iport|39|0|71|0|{0|in|}28|33|}
{2010006001|XXGobject_psameas_object|40|0|73|0|{metadata|in_metadata|1|0|}33|28|}
{2010006001|XXGobject_psameas_object|41|0|74|0|{Layout|Layout|0|0|}22|34|}
{2010212001|XXGvertex_oport_oport|42|0|76|0|{0|out|}34|35|}
{2010213001|XXGoport_dst_flow|43|0|78|0|{0|}35|14|}
{2010211001|XXGvertex_iport_iport|44|0|79|0|{0|in|}34|36|}
{2010214001|XXGiport_src_flow|45|0|81|0|{0|}36|17|}
{2010007001|XXGobject_proto_object|46|0|82|0|{}34|37|}
{2010212001|XXGvertex_oport_oport|47|0|84|0|{0|out|}37|38|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{metadata|out_metadata|1|0|}38|37|}
{2010211001|XXGvertex_iport_iport|49|0|87|0|{0|in|}37|39|}
{2010006001|XXGobject_psameas_object|50|0|89|0|{metadata|in_metadata|1|0|}39|37|}
{2010006001|XXGobject_psameas_object|51|0|90|0|{in_metadata|read_metadata|0|0|}34|40|}
{2010212001|XXGvertex_oport_oport|52|0|92|0|{0|read|}40|41|}
{2010213001|XXGoport_dst_flow|53|0|94|0|{0|}41|11|}
{2010007001|XXGobject_proto_object|54|0|95|0|{}40|42|}
{2010212001|XXGvertex_oport_oport|55|0|97|0|{0|read|}42|43|}
{2010006001|XXGobject_psameas_object|56|0|99|0|{metadata|read_metadata|1|0|}43|42|}
{2010006001|XXGobject_psameas_object|57|0|100|0|{out_metadata|read_metadata|0|0|}34|40|}
{2010006001|XXGobject_psameas_object|58|0|101|0|{in_metadata|out0_metadata|0|0|}22|44|}
{2010212001|XXGvertex_oport_oport|59|0|103|0|{0|out0|}44|45|}
{2010213001|XXGoport_dst_flow|60|0|105|0|{0|}45|19|}
{2010212001|XXGvertex_oport_oport|61|0|106|0|{1|reject0|}44|46|}
{2010212001|XXGvertex_oport_oport|62|0|108|0|{2|error0|}44|47|}
{2010212001|XXGvertex_oport_oport|63|0|110|0|{3|log|}44|48|}
{2010211001|XXGvertex_iport_iport|64|0|112|0|{0|in|}44|49|}
{2010007001|XXGobject_proto_object|65|0|114|0|{}44|50|}
{2010212001|XXGvertex_oport_oport|66|0|116|0|{0|out0|}50|51|}
{2010006001|XXGobject_psameas_object|67|0|118|0|{metadata|out0_metadata|1|0|}51|50|}
{2010006001|XXGobject_psameas_object|68|0|119|0|{transform0|transform0|1|0|}51|50|}
{2010212001|XXGvertex_oport_oport|69|0|120|0|{1|reject0|}50|52|}
{2010006001|XXGobject_psameas_object|70|0|122|0|{metadata|reject0_metadata|1|0|}52|50|}
{2010212001|XXGvertex_oport_oport|71|0|123|0|{2|error0|}50|53|}
{2010006001|XXGobject_psameas_object|72|0|125|0|{metadata|error0_metadata|1|0|}53|50|}
{2010212001|XXGvertex_oport_oport|73|0|126|0|{3|log|}50|54|}
{2010006001|XXGobject_psameas_object|74|0|128|0|{metadata|log_metadata|1|0|}54|50|}
{2010211001|XXGvertex_iport_iport|75|0|129|0|{0|in|}50|55|}
{2010006001|XXGobject_psameas_object|76|0|131|0|{metadata|in_metadata|1|0|}55|50|}
{2010006001|XXGobject_psameas_object|77|0|132|0|{Layout|Layout|0|0|}44|34|}
{2010006001|XXGobject_psameas_object|78|0|133|0|{in_metadata|read_metadata|0|0|}44|40|}
{2010006001|XXGobject_psameas_object|79|0|134|0|{reject0_metadata|read_metadata|0|0|}44|40|}
{2010006001|XXGobject_psameas_object|80|0|135|0|{out0_metadata|out0_metadata|0|0|}22|44|}
{2010006001|XXGobject_psameas_object|81|0|136|0|{reject0_metadata|out0_metadata|0|0|}22|44|}
{2010601001|XXGgraph_vertex_vertex|82|0|137|0|{RFMT_Drop_event_indicator_and_generate_final_log_output|}18|44|}
{2010601001|XXGgraph_vertex_vertex|83|0|138|0|{Redefine_Format|}18|56|}
{2010212001|XXGvertex_oport_oport|84|0|140|0|{0|out|}56|57|}
{2010211001|XXGvertex_iport_iport|85|0|142|0|{0|in|}56|58|}
{2010214001|XXGiport_src_flow|86|0|144|0|{0|}58|21|}
{2010007001|XXGobject_proto_object|87|0|145|0|{}56|59|}
{2010212001|XXGvertex_oport_oport|88|0|147|0|{0|out|}59|60|}
{2010006001|XXGobject_psameas_object|89|0|149|0|{metadata|out_metadata|1|0|}60|59|}
{2010211001|XXGvertex_iport_iport|90|0|150|0|{0|in|}59|61|}
{2010006001|XXGobject_psameas_object|91|0|152|0|{metadata|in_metadata|1|0|}61|59|}
{2010006001|XXGobject_psameas_object|92|0|153|0|{Layout|Layout|0|0|}56|34|}
{2010006001|XXGobject_psameas_object|93|0|154|0|{in_metadata|out0_metadata|0|0|}56|44|}
{2010212001|XXGvertex_oport_oport|94|0|155|0|{0|out0|}18|62|}
{2010216002|XXGoport_binding_oport|95|0|157|0|{.5|.5|{0|}14185|}62|57|}
{2010213001|XXGoport_dst_flow|96|0|158|0|{0|}62|12|}
{2010211001|XXGvertex_iport_iport|97|0|159|0|{0|in0|}18|63|}
{2010215002|XXGiport_binding_iport|98|0|161|0|{.5|.5|{0|}14184|}63|49|}
{2010214001|XXGiport_src_flow|99|0|162|0|{0|}63|14|}
{2010601001|XXGgraph_vertex_vertex|100|0|163|0|{Gather|}1|64|}
{2010212001|XXGvertex_oport_oport|101|0|165|0|{0|out|}64|65|}
{2010213001|XXGoport_dst_flow|102|0|167|0|{0|}65|13|}
{2010211001|XXGvertex_iport_iport|103|0|168|0|{0|in|}64|66|}
{2010214001|XXGiport_src_flow|104|0|170|0|{0|}66|15|}
{2010007001|XXGobject_proto_object|105|0|171|0|{}64|67|}
{2010212001|XXGvertex_oport_oport|106|0|173|0|{0|out|}67|68|}
{2010006001|XXGobject_psameas_object|107|0|175|0|{metadata|out_metadata|1|0|}68|67|}
{2010211001|XXGvertex_iport_iport|108|0|176|0|{0|in|}67|69|}
{2010006001|XXGobject_psameas_object|109|0|178|0|{metadata|in_metadata|1|0|}69|67|}
{2010006001|XXGobject_psameas_object|110|0|179|0|{out_metadata|in_metadata|0|0|}64|70|}
{2010212001|XXGvertex_oport_oport|111|0|181|0|{0|log|}70|71|}
{2010211001|XXGvertex_iport_iport|112|0|183|0|{0|in|}70|72|}
{2010214001|XXGiport_src_flow|113|0|185|0|{0|}72|16|}
{2010007001|XXGobject_proto_object|114|0|186|0|{}70|73|}
{2010212001|XXGvertex_oport_oport|115|0|188|0|{0|log|}73|74|}
{2010006001|XXGobject_psameas_object|116|0|190|0|{metadata|log_metadata|1|0|}74|73|}
{2010211001|XXGvertex_iport_iport|117|0|191|0|{0|in|}73|75|}
{2010006001|XXGobject_psameas_object|118|0|193|0|{metadata|in_metadata|1|0|}75|73|}
{2010601001|XXGgraph_vertex_vertex|119|0|194|0|{Gather_1|}1|34|}
{2010601001|XXGgraph_vertex_vertex|120|0|195|0|{IFIL_Load_Ready_File|}1|40|}
{2010601001|XXGgraph_vertex_vertex|121|0|196|0|{Intermediate_File|}1|76|}
{2010212001|XXGvertex_oport_oport|122|0|198|0|{0|read|}76|77|}
{2010213001|XXGoport_dst_flow|123|0|200|0|{0|}77|16|}
{2010211001|XXGvertex_iport_iport|124|0|201|0|{0|write|}76|78|}
{2010214001|XXGiport_src_flow|125|0|203|0|{0|}78|13|}
{2010007001|XXGobject_proto_object|126|0|204|0|{}76|79|}
{2010212001|XXGvertex_oport_oport|127|0|206|0|{0|read|}79|80|}
{2010006001|XXGobject_psameas_object|128|0|208|0|{metadata|read_metadata|1|0|}80|79|}
{2010211001|XXGvertex_iport_iport|129|0|209|0|{0|write|}79|81|}
{2010006001|XXGobject_psameas_object|130|0|211|0|{metadata|write_metadata|1|0|}81|79|}
{2010006001|XXGobject_psameas_object|131|0|212|0|{read_metadata|in_metadata|0|0|}76|70|}
{2010006001|XXGobject_psameas_object|132|0|213|0|{write_metadata|in_metadata|0|0|}76|70|}
{2010601001|XXGgraph_vertex_vertex|133|0|214|0|{Replicate|}1|82|}
{2010212001|XXGvertex_oport_oport|134|0|216|0|{0|out|}82|83|}
{2010213001|XXGoport_dst_flow|135|0|218|0|{0|}83|17|}
{2010211001|XXGvertex_iport_iport|136|0|219|0|{0|in|}82|84|}
{2010214001|XXGiport_src_flow|137|0|221|0|{0|}84|11|}
{2010007001|XXGobject_proto_object|138|0|222|0|{}82|85|}
{2010212001|XXGvertex_oport_oport|139|0|224|0|{0|out|}85|86|}
{2010006001|XXGobject_psameas_object|140|0|226|0|{metadata|out_metadata|1|0|}86|85|}
{2010211001|XXGvertex_iport_iport|141|0|227|0|{0|in|}85|87|}
{2010006001|XXGobject_psameas_object|142|0|229|0|{metadata|in_metadata|1|0|}87|85|}
{2010006001|XXGobject_psameas_object|143|0|230|0|{Layout|Layout|0|0|}82|40|}
{2010006001|XXGobject_psameas_object|144|0|231|0|{in_metadata|read_metadata|0|0|}82|40|}
{2010006001|XXGobject_psameas_object|145|0|232|0|{out_metadata|read_metadata|0|0|}82|40|}
{2010601001|XXGgraph_vertex_vertex|146|0|233|0|{Replicate_1|}1|88|}
{2010212001|XXGvertex_oport_oport|147|0|235|0|{0|out|}88|89|}
{2010213001|XXGoport_dst_flow|148|0|237|0|{0|}89|15|}
{2010211001|XXGvertex_iport_iport|149|0|238|0|{0|in|}88|90|}
{2010214001|XXGiport_src_flow|150|0|240|0|{0|}90|12|}
{2010007001|XXGobject_proto_object|151|0|241|0|{}88|91|}
{2010212001|XXGvertex_oport_oport|152|0|243|0|{0|out|}91|92|}
{2010006001|XXGobject_psameas_object|153|0|245|0|{metadata|out_metadata|1|0|}92|91|}
{2010211001|XXGvertex_iport_iport|154|0|246|0|{0|in|}91|93|}
{2010006001|XXGobject_psameas_object|155|0|248|0|{metadata|in_metadata|1|0|}93|91|}
{2010006001|XXGobject_psameas_object|156|0|249|0|{Layout|Layout|0|0|}88|34|}
{2010006001|XXGobject_psameas_object|157|0|250|0|{in_metadata|out_metadata|0|0|}88|56|}
{2010006001|XXGobject_psameas_object|158|0|251|0|{out_metadata|out_metadata|0|0|}88|56|}
{2010601001|XXGgraph_vertex_vertex|159|0|252|0|{SFTP_To|}1|70|}
{2010601001|XXGgraph_vertex_vertex|160|0|253|0|{Update_Consumption_Log|}1|94|}
{2010604001|XXGgraph_flow_flow|161|0|255|0|{Flow_18|}94|95|}
{2010604001|XXGgraph_flow_flow|162|0|257|0|{Flow_22|}94|96|}
{2010601001|XXGgraph_vertex_vertex|163|0|259|0|{Consumption_Log|}94|97|}
{2010211001|XXGvertex_iport_iport|164|0|261|0|{0|write|}97|98|}
{2010214001|XXGiport_src_flow|165|0|263|0|{0|}98|95|}
{2010007001|XXGobject_proto_object|166|0|264|0|{}97|99|}
{2010211001|XXGvertex_iport_iport|167|0|266|0|{0|write|}99|100|}
{2010006001|XXGobject_psameas_object|168|0|268|0|{metadata|write_metadata|1|0|}100|99|}
{2010601001|XXGgraph_vertex_vertex|169|0|269|0|{Interim_Events_Log|}94|101|}
{2010212001|XXGvertex_oport_oport|170|0|271|0|{0|read|}101|102|}
{2010213001|XXGoport_dst_flow|171|0|273|0|{0|}102|96|}
{2010007001|XXGobject_proto_object|172|0|274|0|{}101|103|}
{2010212001|XXGvertex_oport_oport|173|0|276|0|{0|read|}103|104|}
{2010006001|XXGobject_psameas_object|174|0|278|0|{metadata|read_metadata|1|0|}104|103|}
{2010601001|XXGgraph_vertex_vertex|175|0|279|0|{Updating_Consumption_Entry|}94|105|}
{2010212001|XXGvertex_oport_oport|176|0|281|0|{0|out|}105|106|}
{2010213001|XXGoport_dst_flow|177|0|283|0|{0|}106|95|}
{2010211001|XXGvertex_iport_iport|178|0|284|0|{0|in|}105|107|}
{2010214001|XXGiport_src_flow|179|0|286|0|{0|}107|96|}
{2010007001|XXGobject_proto_object|180|0|287|0|{}105|108|}
{2010212001|XXGvertex_oport_oport|181|0|289|0|{0|out|}108|109|}
{2010006001|XXGobject_psameas_object|182|0|291|0|{metadata|out_metadata|1|0|}109|108|}
{2010211001|XXGvertex_iport_iport|183|0|292|0|{0|in|}108|110|}
{2010006001|XXGobject_psameas_object|184|0|294|0|{metadata|in_metadata|1|0|}110|108|}
{2010006001|XXGobject_psameas_object|185|0|295|0|{Layout|Layout|0|0|}105|97|}
{2010006001|XXGobject_psameas_object|186|0|296|0|{in_metadata|read_metadata|0|0|}105|101|}
{2010006001|XXGobject_psameas_object|187|0|297|0|{out_metadata|read_metadata|0|0|}105|101|}
{2010109001|XXGobject_property_value|188|0|298|0|{0|TrackingThumbprint|72|}1|111|}
