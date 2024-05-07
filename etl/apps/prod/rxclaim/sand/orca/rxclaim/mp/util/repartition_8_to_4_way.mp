@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|245|rel_count|421|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|3|9|RFK|@{0|}}
{30001002|XXparameter|___Input_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|RUN_ID|$[ (string(""))(datetime("YYYYMMDDHH24MISS"))now() ]|3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_HOST|apvrd55593|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|APP_NAME|rxclaim|3|9|FK|@{0|}}
{30001002|XXparameter|FILE_TYPE|IDS|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_NAME|ids_common.d_cag|3|9|FK|@{0|}}
{30001002|XXparameter|___Derived_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(IDS_NAME) ]|3|9|RK|The cananonical form of the full "logical" target table name.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ re_replace(TARGET_LOWER, ".*[.]", "") ]|3|9|RK|The target table name, excluding its schema part.|{0|}}
{30001002|XXparameter|SUBJECT_AREA|$[ string_downcase(string_split(IDS_NAME,".")[0]) ]|3|9|K|Subject area defined as per IDS|{0|}}
{30001002|XXparameter|IDS_META_STRING|$[SUBJECT_AREA + "." + TARGET_ENTITY]|3|9|K|This string will be used to get value from ids meta property file|{0|}}
{30001002|XXparameter|IS_WRITE_MFS_XREF_ICFF|$[if(get_ids_table_properties(IDS_META_STRING).storage_type=="icff") "Y" else "N" ]|3|9|K|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(IDS_META_STRING)]|3|9|EFK|@{0|}}
{30001002|XXparameter|ENTITY|$[string_split(IDS_NAME, ".")[1]]|3|9|K|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|K|A common fixed ( Hardcoded)  ICFF key used across ORCA . |{0|}}
{30001002|XXparameter|DATA_PATH|$[if(FILE_TYPE=="IDS") string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER) 
else if (FILE_TYPE=="CLEAN") string_concat(AI_MFS,"/clean." ,SUBJECT_AREA)
else "" ]|3|9|EK|Data path where IDS files will be written|{0|}}
{30001002|XXparameter|FACT_DATA_PARTITION_KEY||3|9|FK|This must be a date column with YYYYMMDD|{0|}}
{30001002|XXparameter|IS_IDS_DML_WITH_NK|$[
begin
let pset_info_type load_pset = allocate_with_defaults();
let string("") is_ids_dml_with_nk_flag = "False";
let decimal("") tnl_index = -1;
if(file_information(AI_PSET + "/load." + SUBJECT_AREA + "/load." + TARGET_LOWER + ".pset").found) begin
load_pset = pset_info(read_file(AI_PSET + "/load." + SUBJECT_AREA + "/load." + TARGET_LOWER + ".pset"));
tnl_index = vector_search(load_pset.parameters, [record name "IS_IDS_DML_WITH_NK" value "" interpretation "" value_in_file 0 interpret_file_contents 0 overridable 1], \{name\});
if(tnl_index != -1)
is_ids_dml_with_nk_flag = load_pset.parameters[tnl_index].value;
end
result :: is_ids_dml_with_nk_flag;
end
]|13|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|$[if( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "many")  string_concat(TARGET_ENTITY,".",string_substring(RUN_ID,1,8),".dat.gz")
else if ( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "one")  string_concat(TARGET_ENTITY,".dat.gz")
else if (FILE_TYPE=="CLEAN") string_concat("clean.",TARGET_LOWER,".",string_substring(RUN_ID,1,8),"*.dat.gz") 
else ""]|3|9|K|Event log file |{0|}}
{30001002|XXparameter|FILE_LIST|AB_PARAMETER_ENV|3|10|FKd|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATH|$[
begin
let string("") v_input_file="";
let string("") prev_file_run_id = (date("YYYYMMDD"))datetime_add((date("YYYYMMDD"))string_substring(RUN_ID,1,8),-1);
let string("") file_run_id = (date("YYYYMMDD"))string_substring(RUN_ID,1,8);
let string("") file_pattern = if( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "many" && SUBJECT_AREA=="ids_bp")  string_concat(TARGET_ENTITY,".",prev_file_run_id,".dat.gz")
                              else if( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "many" && SUBJECT_AREA!="ids_bp") string_concat(TARGET_ENTITY,".",file_run_id,".dat.gz")
                              else if ( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "one")  string_concat(TARGET_ENTITY,".dat.gz")
                              else if (FILE_TYPE=="CLEAN" && SUBJECT_AREA=="rxclaim_ctrx") string_concat("clean.",TARGET_LOWER,".",file_run_id,"*04.dat.gz") 
                              else if (FILE_TYPE=="CLEAN" && SUBJECT_AREA=="rxclaim_orx") string_concat("clean.",TARGET_LOWER,".",file_run_id,"*03.dat.gz") 
                              else "";
let string("")[int] v_file_name=directory_listing(DATA_PATH, file_pattern);
let int v_file_count=length_of(v_file_name);

/*
if(v_file_count == 1) 
 begin 
v_input_file= string_concat(DATA_PATH, "/", v_file_name[0]) ;
end;

let int i=0;
       for (i,i < v_file_count)
         begin 
         v_input_file= string_concat(DATA_PATH, "/", v_file_name[0]) ;
         end
force_error("Error : Required Fields " + string_join(miss_field_vec , " , ") + " are missing in Reduced Dataset DML");
    end*/

if(v_file_count > 0) 
begin 
        if(v_file_count != 1)
        begin
                v_input_file= force_error("Error : Required file count is greater than 1. Please re-check the files");
        end;
        if(v_file_count == 1)
        begin
                v_input_file= string_concat(DATA_PATH, "/", v_file_name[0]) ;
        end;
end;
result :: v_input_file;
end
]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_INDEX_FILE|$[ re_replace(INPUT_FILE_PATH, ".dat.gz", ".idx")]|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_FILENAME|$[ if ( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "one")  string_concat(DATA_PATH, "/", TARGET_ENTITY,"_datadeli.dat.gz") else INPUT_FILE_PATH]|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_INDEX_FILE|$[ re_replace(IDS_FILENAME, ".dat.gz", ".idx")]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_FILE_DML|$[if(FILE_TYPE=="IDS" && IS_IDS_DML_WITH_NK==0) read_file(string_concat(PUB_DATAHUB_DML ,"/" ,SUBJECT_AREA ,  "/" , SUBJECT_AREA  , "." , TARGET_ENTITY , ".dml")) 
else if (FILE_TYPE=="IDS" && IS_IDS_DML_WITH_NK==1) read_file(string_concat(PUB_DATAHUB_DML,"/nk/" ,SUBJECT_AREA ,  "/" , SUBJECT_AREA  , "." , TARGET_ENTITY , ".dml")) 
else if (FILE_TYPE=="CLEAN") read_file(string_concat(AI_DML,"/clean." ,SUBJECT_AREA, "/clean.", TARGET_LOWER, ".dml"))
else "" ]|3|9|K|Event log file |{0|}}
{30001002|XXparameter|___Output_Files___|@3|9|K|@{0|}}
{30001002|XXparameter|AI_PHASE|$AI_PHASE|3|9|RFK|@{0|}}
{30001002|XXparameter|FACT_MULTI_ICFF_XFR|$[ if ( DATASET_IDENTIFIER == "many" )

' /*extract filename from input record*/
//Initailize a dummy value for validation of filename expression 
//Assuming a col. dxf_src_sys_id
let string(8) v_fact_data_partition_key= if("' + SUBJECT_AREA +'"== "ids_bp") (date("YYYYMMDD"))datetime_add((date("YYYYMMDD"))string_substring("' + RUN_ID +'",1,8),-1) else string_substring("' + RUN_ID + '",1,8);
        filename::get_filename(in)=
        begin 
                     filename:: ' +  ' "//' + TARGET_HOST + "/etl/data/" + AI_PHASE + "/mfs/mfs_4way/aicoe/pub_datahub/lookup/./ids/" + SUBJECT_AREA + "/" + DATASET_IDENTIFIER + '/' + TARGET_ENTITY + '."'  +  ' +  v_fact_data_partition_key  + ' + '".dat.gz"; ' 
       + '\\n\\t' + 
      'end;' +

'indexname::get_indexname(filename)=
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
        end; '   
else " NO Use"  
]|3|9|K|Resolving XFR at PDL for MUlti ICFF compute block component |{0|}}
{30001002|XXparameter|OUTPUT_IDS_FILE|$[if ( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "many") 
if(SUBJECT_AREA == 'ids_bp')
string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"/mfs/mfs_4way/aicoe/pub_datahub/lookup/./ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER,"/" ,  TARGET_ENTITY, "." , (date("YYYYMMDD"))datetime_add((date("YYYYMMDD"))string_substring(RUN_ID,1,8),-1),".dat.gz") 
else string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"/mfs/mfs_4way/aicoe/pub_datahub/lookup/./ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER,"/" ,  TARGET_ENTITY, "." , string_substring(RUN_ID,1,8),".dat.gz")
else if ( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "one") string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"/mfs/mfs_4way/aicoe/pub_datahub/lookup/./ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER,"/" ,  TARGET_ENTITY , ".dat.gz") 
else if (FILE_TYPE=="CLEAN") string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"/mfs/mfs_4way/orca/rxclaim/main/./clean." ,SUBJECT_AREA,"/",directory_listing(DATA_PATH, INPUT_FILE_PATTERN)[0]) 
else  ""]|3|9|RK|@{0|}}
{30001002|XXparameter|OUTPUT_INDEX_FILE|$[ if ( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "many") 
if(SUBJECT_AREA == 'ids_bp')
string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"/mfs/mfs_4way/aicoe/pub_datahub/lookup/./ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER,"/" ,  TARGET_ENTITY, "." , (date("YYYYMMDD"))datetime_add((date("YYYYMMDD"))string_substring(RUN_ID,1,8),-1),".idx") 
else string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"/mfs/mfs_4way/aicoe/pub_datahub/lookup/./ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER,"/" ,  TARGET_ENTITY, "." , string_substring(RUN_ID,1,8),".idx") 
else if ( FILE_TYPE=="IDS" && DATASET_IDENTIFIER == "one") string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"/mfs/mfs_4way/aicoe/pub_datahub/lookup/./ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER,"/" ,  TARGET_ENTITY , ".idx") 
else if (FILE_TYPE=="CLEAN") string_concat("//",TARGET_HOST,"/etl/data/",AI_PHASE,"mfs/mfs_4way/orca/rxclaim/main/./clean." ,SUBJECT_AREA,"/", FILE_LIST[0]) 
else  ""]|3|9|K|key file location used in fact key lookup process|{0|}}
{30001002|XXparameter|FILE_LIST:eme|$[string_split_no_empty(AI_SERIAL_PENDING + "/sample.dat","\\n")]|3|9||@{0|}}
{30001002|XXparameter|FILE_LIST:sandbox|$[directory_listing(DATA_PATH, INPUT_FILE_PATTERN)]|3|9||@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|OUTPUT_FILE_DML|$INPUT_FILE_DML|3|9|RK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|event_copy|Anwar.Parvez|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1011000|573000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|1|1|}Job 'repartition_8_to_4_way' Execution Status Report


Job "repartition_8_to_4_way" Execution started at Monday, November 02, 2020 15:22:13
Job completed successfully at Monday, November 02, 2020 15:23:17

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:01:03
Run performed by user j17
Total data moved through all flows: 14043524 records (6616909729 bytes)
Total CPU time (all processes): 223 seconds
Average CPU utilization across all nodes: 6.53 percent
||#! /bin/ksh -e

##if  [[ $\{FILE_TYPE\} == "IDS" && $\{DATASET_IDENTIFIER\} == "one" && -f $\{IDS_FILENAME\} ]] ; then
##  echo "Removing previoud day IDS file!!"
##m_rm -f $\{IDS_FILENAME\}
##fi

##if  [[ $\{FILE_TYPE\} == "IDS" && $\{DATASET_IDENTIFIER\} == "one" && -f $\{IDS_INDEX_FILE\} ]] ; then
##  echo "Removing previoud day Index file!!"
##  m_rm -f $\{IDS_INDEX_FILE\}
##fi

if [[ $\{FILE_TYPE\} == "IDS" && $\{DATASET_IDENTIFIER\} == "one" ]]; then
  echo "Creating copy IDS and Index for datadeli file transfer!!"
  m_cp $\{INPUT_FILE_PATH\} $\{IDS_FILENAME\}
  m_cp $\{INPUT_INDEX_FILE\} $\{IDS_INDEX_FILE\}
fi
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apvrs55607||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|16711680|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@This graph compares the local event log and remote event log for an IDS to
identify which files are pending to be copied.

It does not copy over any files but only writes the list of files to the local server,
which is then picked up by the next step in the replication plan to actually
copy the files to the remote server.|35000|46000|0|0|0|0|88|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}621|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}615|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@0|.5|.5|{0|}619|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@0|.5|.5|{0|}613|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@0|.5|.5|{0|}617|17|}}
{2010600005|XXGgraph|12|0|23|0|{Subgraph created from graph "repartition_8_to_4_way"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[FILE_TYPE == "CLEAN"]|3|9|F||{0|}}
}}@0|@824500|422000|0|0|0|0|622|CLEAN_FILE Dataset|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|611000|220000|7|}}
{2010210004|XXGflow|13|0|25|0|{@{}@0|.5|.5|{0|}376|2065|}}
{2010210004|XXGflow|14|0|27|0|{@{}@0|.5|.5|{0|}372|531|}}
{2010503005|XXGfvertex|15|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_IDS_FILE\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_IDS_FILE\}|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=j|@{0|}}
}}@0|Output File|500000|73000|0|0|0|0|377|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|16|0|31|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|17|0|34|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|18|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|19|0|39|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$INPUT_FILE_DML|3|9|j|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|481000|319000|0|0|0|0|614|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|20|0|41|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|21|0|44|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|22|0|46|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|23|0|48|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|24|0|50|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|25|0|54|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|26|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|27|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|28|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|29|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|30|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|31|0|72|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$\{INPUT_FILE_DML\}|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{INPUT_FILE_PATH\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{INPUT_FILE_PATH\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[FILE_TYPE == "CLEAN"]|3|9||@{0|}}
}}@0|Input File|215000|276500|0|0|0|0|616|Input File|Ab Initio Software|@1|100000|-1||6||257|-1|-1|}}
{2010203004|XXGoport|32|0|74|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|33|0|77|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|34|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|35|0|83|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|Partition by Round-robin|80000|83000|0|0|0|0|358|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|36|0|85|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|37|0|88|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|38|0|90|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|39|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|40|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|41|0|101|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|211000|66000|0|0|0|0|374|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|42|0|103|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|43|0|106|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|44|0|108|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|45|0|110|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|46|0|112|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|47|0|115|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|48|0|117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|49|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|50|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|51|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|52|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|53|0|137|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|54|0|141|0|{Subgraph created from graph "repartition_8_to_4_way"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[FILE_TYPE == "IDS"]|3|9|F||{0|}}
}}@0|@826000|197000|0|0|0|0|620|IDS Dataset|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1100000|526000|7|}}
{2010210004|XXGflow|55|0|143|0|{@{}@0|.5|.5|{0|}308|1043|}}
{2010210004|XXGflow|56|0|145|0|{@{}@384|.5|.5|{0|}309|17|}}
{2010210004|XXGflow|57|0|147|0|{@{}@384|.5|.21468926966190338|{0|}312|17|}}
{2010210004|XXGflow|58|0|149|0|{@{}@0|.5|.5|{0|}314|17|}}
{2010501005|XXGpvertex|59|0|151|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{$\{ICFF_KEY\}\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Merge|454000|249500|0|0|0|0|310|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|60|0|153|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|61|0|156|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|62|0|159|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|63|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|64|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010503005|XXGfvertex|65|0|167|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_IDS_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_IDS_FILE|3|2|$|@{0|}}
}}@0|@569000|344500|0|0|0|0|11560|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|66|0|169|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|67|0|171|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|68|0|173|0|{@{}@384|.5|.5|{0|}11559|17|}}
{2010503005|XXGfvertex|69|0|175|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|70|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|71|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|72|0|185|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{$\{ICFF_KEY\}\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@75000|205000|0|0|481000|303000|307|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|73|0|187|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|74|0|189|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|75|0|191|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|76|0|194|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|77|0|198|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|78|0|200|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|79|0|202|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|80|0|207|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|81|0|211|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|82|0|214|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|83|0|216|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|84|0|218|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|85|0|220|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|86|0|223|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|87|0|225|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|88|0|227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|89|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|90|0|235|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|91|0|237|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|92|0|239|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|93|0|242|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|94|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|95|0|247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|96|0|253|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|97|0|256|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|98|0|261|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|1|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|632000|249500|0|0|0|0|299|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|99|0|263|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|100|0|267|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|101|0|270|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|102|0|272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|103|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|104|0|281|0|{Subgraph created from graph "Write IDS Data Store"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_IDENTIFIER == "one"]|3|9|F||{0|}}
}}@0|@922000|134000|0|0|0|0|313|Write Dim Datasets|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|712000|344000|3|}}
{2010210004|XXGflow|105|0|283|0|{@{}@384|.5|.5|{0|}10625|17|}}
{2010210004|XXGflow|106|0|285|0|{@{}@384|.5|.5|{0|}10631|2065|}}
{2010210004|XXGflow|107|0|287|0|{@{}@384|.5|.5|{0|}10630|17|}}
{2010210004|XXGflow|108|0|289|0|{@{}@384|.5|.5|{0|}10633|17|}}
{2010503005|XXGfvertex|109|0|291|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_IDS_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_IDS_FILE|3|2|$|@{0|}}
}}@0|@494000|64500|0|0|0|0|10632|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|110|0|293|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|111|0|296|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|112|0|299|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|113|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|114|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|115|0|307|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_INDEX_FILE|3|2|$|@{0|}}
}}@0|@499000|219500|0|0|0|0|10634|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|116|0|309|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|117|0|312|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|118|0|314|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|119|0|317|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|240000|129500|0|0|0|0|10628|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|120|0|319|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|121|0|322|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|122|0|325|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|123|0|327|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|124|0|330|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|125|0|332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|126|0|335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|127|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|128|0|341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|129|0|347|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|104000|173000|0|0|0|0|10557|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|130|0|349|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|131|0|352|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|132|0|354|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|133|0|356|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|134|0|359|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|135|0|365|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
}}@1|@619000|64500|0|0|0|0|10556|View Data|Ab Initio Software|@1|1000|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|136|0|367|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|137|0|370|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|138|0|372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|139|0|376|0|{@{}@0|0|0|0|in0|.5436046511627907|@@@13840|0|}}
{2010600005|XXGgraph|140|0|380|0|{Subgraph created from graph "Write Fact Datasets"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_IDENTIFIER == "many"]|3|9|F||{0|}}
}}@0|@930000|301000|0|0|0|0|315|Write Multi ICFF|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|669000|584000|3|}}
{2010240003|XXGlegend|141|0|382|0|{@{}@Write Fact Datasets in IDS many folder|270000|389000|0|0|0|0|11507|}}
{2010242002|XXGface|142|0|384|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|143|0|386|0|{@{}@384|.5|.5|{0|}11537|17|}}
{2010210004|XXGflow|144|0|389|0|{@{}@384|.5|.5|{0|}11561|17|}}
{2010210004|XXGflow|145|0|391|0|{@{}@384|.5|.5|{0|}11534|17|}}
{2010501005|XXGpvertex|146|0|393|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$\{FACT_MULTI_ICFF_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@70000|33000|0|0|0|0|11538|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|147|0|395|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|148|0|398|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|149|0|400|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|150|0|402|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|151|0|404|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|152|0|406|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|153|0|408|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|154|0|410|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|155|0|413|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|156|0|416|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|157|0|419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|158|0|422|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|159|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|160|0|430|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_INDEX_FILE|3|2|$|@{0|}}
}}@0|@574000|499500|0|0|0|0|11562|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|161|0|432|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|162|0|435|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|163|0|437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|164|0|440|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|315000|409500|0|0|0|0|11557|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|165|0|442|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|166|0|445|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|167|0|448|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|168|0|450|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|169|0|452|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|170|0|454|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|171|0|457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|172|0|460|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|173|0|463|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|174|0|469|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|304000|80000|0|0|0|0|11525|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|175|0|471|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|176|0|474|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|177|0|477|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|178|0|479|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|179|0|482|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|180|0|487|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|permissions|664|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@447000|65000|0|0|0|0|11535|WMF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|181|0|489|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|182|0|491|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|183|0|493|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|184|0|495|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|185|0|498|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|186|0|500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|187|0|503|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|188|0|506|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|189|0|509|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|190|0|515|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|$\{FACT_MULTI_ICFF_XFR\}|3|9||@{0|}}
{30001002|XXparameter|key|$\{ICFF_KEY\}|3|3|c|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|permissions|644|3|2|$|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_IDS_FILE|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Write Multiple Block-Compressed Lookups|270000|186000|0|0|0|0|11555|Write Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 2.14.97:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|191|0|517|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|192|0|519|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|193|0|521|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|194|0|523|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|195|0|525|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|196|0|527|0|{Writes records to a set of output files and indexes them as block-compressed lookups.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-bc-lookups|3|1|Hl||{0|}}
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
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
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
{30001002|XXparameter|num_types|5|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|type3|unused_type unused "int"|3|2|H$|Metadata for output of on_blip function|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|operation5|optional unused::on_blip()|3|2|H$|Invoked on checkpoint or computepoint|{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|publisher|3|2|H$||{0|}}
{30001002|XXparameter|type4|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type5|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
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
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Block-Compressed Lookups|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|197|0|529|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|198|0|532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|199|0|535|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|200|0|538|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|201|0|541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|202|0|544|0|{@{}@0|0|0|0|in0|.4589041095890411|@@@13840|0|}}
{2010202004|XXGiport|203|0|548|0|{@{}@0|0|0|0|in0|.5133079847908745|@@@13840|0|}}
{2010600005|XXGgraph|204|0|553|0|{Subgraph created from graph "get.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[FILE_TYPE == "IDS"]|3|9|F||{0|}}
}}@0|@178000|439500|0|0|0|0|618|Read IDS Data File|Anwar.Parvez|Created 8/16/2017 7:09:53 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|777000|221000|3|}}
{2010210004|XXGflow|205|0|555|0|{@{}@384|.5|.5|{0|}14913|17|}}
{2010210004|XXGflow|206|0|557|0|{@{}@384|.5|.5|{0|}14911|532|}}
{2010501005|XXGpvertex|207|0|559|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
}}@0|Broadcast|195000|97000|0|0|0|0|14857|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|208|0|561|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|209|0|564|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|210|0|567|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|211|0|569|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|212|0|572|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|213|0|575|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record 
  record
    string(integer(4)) datafile; 
  end[int] filenames_vec;
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_XFR/dataset_id.xfr";
let string("")[int] filenames = $[string_representation(string_split_no_empty(IDS_FILENAME,"\\n"))];

out::create(index)=
begin
  out.filenames_vec :: for(let file in filenames) : [record datafile file];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@49000|81000|0|0|0|0|14914|List IDS Files|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|214|0|577|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|215|0|580|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|216|0|582|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|217|0|584|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|218|0|586|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|219|0|589|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|220|0|592|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|221|0|597|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Read_Multiple_Block_Compressed_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|$[
'include "/~$PUB_DXF_DML/dxf_job_event_text.dml";
/* This type is optional.*/
type lookup_type = ' + INPUT_FILE_DML + ';

type filenames_type = record string(integer(4)) datafile; string(integer(4)) indexfile; end;
let decimal("") src_dataset_id = 0;
let long stride = number_of_partitions();
let long seq_number = 0;
let dxf_job_event_text_t job_info = allocate();
let string("") prev_datafile_name = "";
let string("") datafile_basename = "";
let record 
    string(integer(4)) datafile; 
    string(integer(4)) indexfile; 
    string(integer(4)) datafile_basename; 
end[int] file_vec = [vector];
let datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn") dataset_start_time = allocate();
let long file_nbr = 0;
let long seq_nbr_in_partition = 0;
  


/*extract vector of datafile and indexfile filenames from input record*/
filenames_vector::get_filenames_vector(in)=
begin
  file_vec = for(let file in in.filenames_vec) : [record datafile file.datafile indexfile string_replace(file.datafile, ".dat.gz", ".idx") datafile_basename string_lrtrim(string_substring(file.datafile, string_rindex(file.datafile, "/") + 1, string_length(file.datafile)))];
  dataset_start_time = now();
  filenames_vector :: for(let file in in.filenames_vec) : [record datafile this_partition_path(file.datafile) indexfile this_partition_path(string_replace(file.datafile, ".dat.gz", ".idx"))];
end;

/* This function is optional. */
/*Create output record*/
out::reformat(read,in,filenames)=
begin
  out.ids_updt_dttm :1: if(is_null(read.ids_updt_dttm)) ' + (vector_search(record_info_item(INPUT_FILE_DML, "name"), "ids_create_dttm") != -1 ? 'read.ids_create_dttm' : '"19000101000000"') + ' else read.ids_updt_dttm;
  out.src_env_sk :1: first_defined(read.src_env_sk,0);   //This code has been added to handle records for which src_env_sk has been populated as NULL from rebates applications. Confirmation is needed on how to handle this on production.
  out.* :2: read.*;
  out.* :3: in.*;  
end;'
]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$[INPUT_FILE_DML]|3|9||@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_MFS_LOOKUP|3|2|$|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Read Multiple Block-Compressed Data|354000|61000|0|0|0|0|14912|Read IDS Files|Ab Initio Software|Built-in 2.15.6.r36.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|222|0|599|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|223|0|601|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|224|0|603|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|225|0|605|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|226|0|607|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|227|0|609|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|228|0|611|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|229|0|614|0|{Reads data from multiple concatenated block-compressed data files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-multi-bc-data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/merge-bc-data|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Lookup key|{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key read|3|2|$||{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.15.6.r35.0|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.15.6.r35.0:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_data|Ignore (Continue, ignoring unindexed data)|15|1|Fl|What to do in case of extra (unindexed) data|{3|Reject (Reject corresponding input record)|Ignore (Continue, ignoring unindexed data)|Process (Continue, processing unindexed data)|}}
{30001002|XXparameter|extra_data.display_name|extra-data|3|9|P|@{0|}}
{30001002|XXparameter|extra_data.condition|version 2.15.2.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_data_keyword|value extra-data R* reject value extra-data I* ignore value extra-data P* process default dollar_substitution Ignore|3|13|Kv|What to do in case of extra (unindexed) data|{0|}}
{30001002|XXparameter|extra_data_keyword.condition|version 2.15.2.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp extra_data_keyword extra-data|3|2|$||{0|}}
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
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional lookup_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|variable2|filenames_type filenames "record string(integer(4)) datafile; string(integer(4)) indexfile; end"|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filenames_vector filenames_vector "record string(integer(4)) datafile; string(integer(4)) indexfile; end [integer(4)]"|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_operations_analysis|7|1|2|H$||{0|}}
{30001002|XXparameter|operation1|filenames_vector::get_filenames_vector(in)|3|2|H$|extract vector of datafile and indexfile filenames from input record|{0|}}
{30001002|XXparameter|operation2|optional out::reformat(read, in, filenames)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7_analysis|filenames::copyfilenames(filenames_vector)|3|2|H$||{0|}}
{30001002|XXparameter|extra_transforms_analysis|filenames::copyfilenames(filenames_vector) = begin filenames :: filenames_vector[0];end;|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
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
}}@0|Read Multiple Block-Compressed Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|230|0|616|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|231|0|619|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|232|0|622|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|233|0|625|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|234|0|628|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|235|0|631|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|236|0|634|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|237|0|639|0|{@{}@0|0|0|0|out0|.46153846153846156|@@@14352|0|}}
{2010501005|XXGpvertex|238|0|644|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|722000|340000|0|0|0|0|410|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|239|0|646|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|240|0|650|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|241|0|653|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783023|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|242|0|655|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|243|0|658|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010110002|XXGconstant|244|0|664|0|{@{}@{1|6554821|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_2|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_4|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_5|}1|11|}
{2010601001|XXGgraph_vertex_vertex|11|0|22|0|{CLEAN_FILE_Dataset|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_1|}12|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_5|}12|14|}
{2010601001|XXGgraph_vertex_vertex|14|0|28|0|{Output_File|}12|15|}
{2010211001|XXGvertex_iport_iport|15|0|30|0|{0|write|}15|16|}
{2010214001|XXGiport_src_flow|16|0|32|0|{0|}16|13|}
{2010007001|XXGobject_proto_object|17|0|33|0|{}15|17|}
{2010211001|XXGvertex_iport_iport|18|0|35|0|{0|write|}17|18|}
{2010006001|XXGobject_psameas_object|19|0|37|0|{metadata|write_metadata|1|0|}18|17|}
{2010006001|XXGobject_psameas_object|20|0|38|0|{write_metadata|out0_metadata|0|0|}15|19|}
{2010212001|XXGvertex_oport_oport|21|0|40|0|{0|out0|}19|20|}
{2010213001|XXGoport_dst_flow|22|0|42|0|{0|}20|10|}
{2010212001|XXGvertex_oport_oport|23|0|43|0|{1|reject0|}19|21|}
{2010212001|XXGvertex_oport_oport|24|0|45|0|{2|error0|}19|22|}
{2010212001|XXGvertex_oport_oport|25|0|47|0|{3|log|}19|23|}
{2010211001|XXGvertex_iport_iport|26|0|49|0|{0|in|}19|24|}
{2010214001|XXGiport_src_flow|27|0|51|0|{0|}24|8|}
{2010214001|XXGiport_src_flow|28|0|52|0|{1|}24|11|}
{2010007001|XXGobject_proto_object|29|0|53|0|{}19|25|}
{2010212001|XXGvertex_oport_oport|30|0|55|0|{0|out0|}25|26|}
{2010006001|XXGobject_psameas_object|31|0|57|0|{metadata|out0_metadata|1|0|}26|25|}
{2010006001|XXGobject_psameas_object|32|0|58|0|{transform0|transform0|1|0|}26|25|}
{2010212001|XXGvertex_oport_oport|33|0|59|0|{1|reject0|}25|27|}
{2010006001|XXGobject_psameas_object|34|0|61|0|{metadata|reject0_metadata|1|0|}27|25|}
{2010212001|XXGvertex_oport_oport|35|0|62|0|{2|error0|}25|28|}
{2010006001|XXGobject_psameas_object|36|0|64|0|{metadata|error0_metadata|1|0|}28|25|}
{2010212001|XXGvertex_oport_oport|37|0|65|0|{3|log|}25|29|}
{2010006001|XXGobject_psameas_object|38|0|67|0|{metadata|log_metadata|1|0|}29|25|}
{2010211001|XXGvertex_iport_iport|39|0|68|0|{0|in|}25|30|}
{2010006001|XXGobject_psameas_object|40|0|70|0|{metadata|in_metadata|1|0|}30|25|}
{2010006001|XXGobject_psameas_object|41|0|71|0|{in_metadata|read_metadata|0|0|}19|31|}
{2010212001|XXGvertex_oport_oport|42|0|73|0|{0|read|}31|32|}
{2010213001|XXGoport_dst_flow|43|0|75|0|{0|}32|8|}
{2010007001|XXGobject_proto_object|44|0|76|0|{}31|33|}
{2010212001|XXGvertex_oport_oport|45|0|78|0|{0|read|}33|34|}
{2010006001|XXGobject_psameas_object|46|0|80|0|{metadata|read_metadata|1|0|}34|33|}
{2010006001|XXGobject_psameas_object|47|0|81|0|{reject0_metadata|read_metadata|0|0|}19|31|}
{2010601001|XXGgraph_vertex_vertex|48|0|82|0|{Partition_by_Round_robin|}12|35|}
{2010212001|XXGvertex_oport_oport|49|0|84|0|{0|out|}35|36|}
{2010213001|XXGoport_dst_flow|50|0|86|0|{0|}36|14|}
{2010211001|XXGvertex_iport_iport|51|0|87|0|{0|in|}35|37|}
{2010007001|XXGobject_proto_object|52|0|89|0|{}35|38|}
{2010212001|XXGvertex_oport_oport|53|0|91|0|{0|out|}38|39|}
{2010006001|XXGobject_psameas_object|54|0|93|0|{metadata|out_metadata|1|0|}39|38|}
{2010211001|XXGvertex_iport_iport|55|0|94|0|{0|in|}38|40|}
{2010006001|XXGobject_psameas_object|56|0|96|0|{metadata|in_metadata|1|0|}40|38|}
{2010006001|XXGobject_psameas_object|57|0|97|0|{Layout|Layout|0|0|}35|19|}
{2010006001|XXGobject_psameas_object|58|0|98|0|{in_metadata|out0_metadata|0|0|}35|19|}
{2010006001|XXGobject_psameas_object|59|0|99|0|{out_metadata|out0_metadata|0|0|}35|19|}
{2010601001|XXGgraph_vertex_vertex|60|0|100|0|{Reformat_1|}12|41|}
{2010212001|XXGvertex_oport_oport|61|0|102|0|{0|out0|}41|42|}
{2010213001|XXGoport_dst_flow|62|0|104|0|{0|}42|13|}
{2010212001|XXGvertex_oport_oport|63|0|105|0|{1|reject0|}41|43|}
{2010212001|XXGvertex_oport_oport|64|0|107|0|{2|error0|}41|44|}
{2010212001|XXGvertex_oport_oport|65|0|109|0|{3|log|}41|45|}
{2010211001|XXGvertex_iport_iport|66|0|111|0|{0|in|}41|46|}
{2010214001|XXGiport_src_flow|67|0|113|0|{0|}46|14|}
{2010007001|XXGobject_proto_object|68|0|114|0|{}41|47|}
{2010212001|XXGvertex_oport_oport|69|0|116|0|{0|out0|}47|48|}
{2010006001|XXGobject_psameas_object|70|0|118|0|{metadata|out0_metadata|1|0|}48|47|}
{2010006001|XXGobject_psameas_object|71|0|119|0|{transform0|transform0|1|0|}48|47|}
{2010212001|XXGvertex_oport_oport|72|0|120|0|{1|reject0|}47|49|}
{2010006001|XXGobject_psameas_object|73|0|122|0|{metadata|reject0_metadata|1|0|}49|47|}
{2010212001|XXGvertex_oport_oport|74|0|123|0|{2|error0|}47|50|}
{2010006001|XXGobject_psameas_object|75|0|125|0|{metadata|error0_metadata|1|0|}50|47|}
{2010212001|XXGvertex_oport_oport|76|0|126|0|{3|log|}47|51|}
{2010006001|XXGobject_psameas_object|77|0|128|0|{metadata|log_metadata|1|0|}51|47|}
{2010211001|XXGvertex_iport_iport|78|0|129|0|{0|in|}47|52|}
{2010006001|XXGobject_psameas_object|79|0|131|0|{metadata|in_metadata|1|0|}52|47|}
{2010006001|XXGobject_psameas_object|80|0|132|0|{Layout|Layout|0|0|}41|15|}
{2010006001|XXGobject_psameas_object|81|0|133|0|{in_metadata|out0_metadata|0|0|}41|19|}
{2010006001|XXGobject_psameas_object|82|0|134|0|{out0_metadata|out0_metadata|0|0|}41|19|}
{2010006001|XXGobject_psameas_object|83|0|135|0|{reject0_metadata|out0_metadata|0|0|}41|19|}
{2010211001|XXGvertex_iport_iport|84|0|136|0|{0|in0|}12|53|}
{2010215002|XXGiport_binding_iport|85|0|138|0|{.5|.5|{0|}375|}53|37|}
{2010214001|XXGiport_src_flow|86|0|139|0|{0|}53|7|}
{2010601001|XXGgraph_vertex_vertex|87|0|140|0|{IDS_Dataset|}1|54|}
{2010604001|XXGgraph_flow_flow|88|0|142|0|{Flow_1|}54|55|}
{2010604001|XXGgraph_flow_flow|89|0|144|0|{Flow_2|}54|56|}
{2010604001|XXGgraph_flow_flow|90|0|146|0|{Flow_3|}54|57|}
{2010604001|XXGgraph_flow_flow|91|0|148|0|{Flow_4|}54|58|}
{2010601001|XXGgraph_vertex_vertex|92|0|150|0|{Merge|}54|59|}
{2010212001|XXGvertex_oport_oport|93|0|152|0|{0|out|}59|60|}
{2010213001|XXGoport_dst_flow|94|0|154|0|{0|}60|56|}
{2010211001|XXGvertex_iport_iport|95|0|155|0|{0|in|}59|61|}
{2010214001|XXGiport_src_flow|96|0|157|0|{0|}61|55|}
{2010007001|XXGobject_proto_object|97|0|158|0|{}59|62|}
{2010212001|XXGvertex_oport_oport|98|0|160|0|{0|out|}62|63|}
{2010006001|XXGobject_psameas_object|99|0|162|0|{metadata|out_metadata|1|0|}63|62|}
{2010211001|XXGvertex_iport_iport|100|0|163|0|{0|in|}62|64|}
{2010006001|XXGobject_psameas_object|101|0|165|0|{metadata|in_metadata|1|0|}64|62|}
{2010006001|XXGobject_psameas_object|102|0|166|0|{Layout|Layout|0|0|}59|65|}
{2010212001|XXGvertex_oport_oport|103|0|168|0|{0|read|}65|66|}
{2010211001|XXGvertex_iport_iport|104|0|170|0|{0|write|}65|67|}
{2010214001|XXGiport_src_flow|105|0|172|0|{0|}67|68|}
{2010007001|XXGobject_proto_object|106|0|174|0|{}65|69|}
{2010212001|XXGvertex_oport_oport|107|0|176|0|{0|read|}69|70|}
{2010006001|XXGobject_psameas_object|108|0|178|0|{metadata|read_metadata|1|0|}70|69|}
{2010211001|XXGvertex_iport_iport|109|0|179|0|{0|write|}69|71|}
{2010006001|XXGobject_psameas_object|110|0|181|0|{metadata|write_metadata|1|0|}71|69|}
{2010006001|XXGobject_psameas_object|111|0|182|0|{in_metadata|out0_metadata|0|0|}59|19|}
{2010006001|XXGobject_psameas_object|112|0|183|0|{out_metadata|out0_metadata|0|0|}59|19|}
{2010601001|XXGgraph_vertex_vertex|113|0|184|0|{Partition_by_Key_and_Sort|}54|72|}
{2010604001|XXGgraph_flow_flow|114|0|186|0|{Flow_1|}72|73|}
{2010601001|XXGgraph_vertex_vertex|115|0|188|0|{Partition_by_Key|}72|74|}
{2010212001|XXGvertex_oport_oport|116|0|190|0|{0|out|}74|75|}
{2010213001|XXGoport_dst_flow|117|0|192|0|{0|}75|73|}
{2010211001|XXGvertex_iport_iport|118|0|193|0|{0|in|}74|76|}
{2010006001|XXGobject_psameas_object|119|0|195|0|{in_metadata|out0_metadata|0|0|}74|19|}
{2010006001|XXGobject_psameas_object|120|0|196|0|{out_metadata|out0_metadata|0|0|}74|19|}
{2010601001|XXGgraph_vertex_vertex|121|0|197|0|{Sort|}72|77|}
{2010212001|XXGvertex_oport_oport|122|0|199|0|{0|out|}77|78|}
{2010211001|XXGvertex_iport_iport|123|0|201|0|{0|in|}77|79|}
{2010214001|XXGiport_src_flow|124|0|203|0|{0|}79|73|}
{2010006001|XXGobject_psameas_object|125|0|204|0|{in_metadata|out0_metadata|0|0|}77|19|}
{2010006001|XXGobject_psameas_object|126|0|205|0|{out_metadata|out0_metadata|0|0|}77|19|}
{2010212001|XXGvertex_oport_oport|127|0|206|0|{0|out0|}72|80|}
{2010216002|XXGoport_binding_oport|128|0|208|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}80|78|}
{2010213001|XXGoport_dst_flow|129|0|209|0|{0|}80|55|}
{2010211001|XXGvertex_iport_iport|130|0|210|0|{0|in0|}72|81|}
{2010215002|XXGiport_binding_iport|131|0|212|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}81|76|}
{2010007001|XXGobject_proto_object|132|0|213|0|{}72|82|}
{2010604001|XXGgraph_flow_flow|133|0|215|0|{Flow_1|}82|83|}
{2010601001|XXGgraph_vertex_vertex|134|0|217|0|{Partition_by_Key|}82|84|}
{2010212001|XXGvertex_oport_oport|135|0|219|0|{0|out|}84|85|}
{2010213001|XXGoport_dst_flow|136|0|221|0|{0|}85|83|}
{2010211001|XXGvertex_iport_iport|137|0|222|0|{0|in|}84|86|}
{2010007001|XXGobject_proto_object|138|0|224|0|{}84|87|}
{2010212001|XXGvertex_oport_oport|139|0|226|0|{0|out|}87|88|}
{2010006001|XXGobject_psameas_object|140|0|228|0|{metadata|out_metadata|1|0|}88|87|}
{2010211001|XXGvertex_iport_iport|141|0|229|0|{0|in|}87|89|}
{2010006001|XXGobject_psameas_object|142|0|231|0|{metadata|in_metadata|1|0|}89|87|}
{2010006001|XXGobject_psameas_object|143|0|232|0|{Layout|InputLayout|1|0|}84|82|}
{2010006001|XXGobject_psameas_object|144|0|233|0|{key|Key|1|0|}84|82|}
{2010601001|XXGgraph_vertex_vertex|145|0|234|0|{Sort|}82|90|}
{2010212001|XXGvertex_oport_oport|146|0|236|0|{0|out|}90|91|}
{2010211001|XXGvertex_iport_iport|147|0|238|0|{0|in|}90|92|}
{2010214001|XXGiport_src_flow|148|0|240|0|{0|}92|83|}
{2010007001|XXGobject_proto_object|149|0|241|0|{}90|93|}
{2010212001|XXGvertex_oport_oport|150|0|243|0|{0|out|}93|94|}
{2010006001|XXGobject_psameas_object|151|0|245|0|{metadata|out_metadata|1|0|}94|93|}
{2010211001|XXGvertex_iport_iport|152|0|246|0|{0|in|}93|95|}
{2010006001|XXGobject_psameas_object|153|0|248|0|{metadata|in_metadata|1|0|}95|93|}
{2010006001|XXGobject_psameas_object|154|0|249|0|{Layout|OutputLayout|1|0|}90|82|}
{2010006001|XXGobject_psameas_object|155|0|250|0|{key|Key|1|0|}90|82|}
{2010006001|XXGobject_psameas_object|156|0|251|0|{max_core|Max_core|1|0|}90|82|}
{2010212001|XXGvertex_oport_oport|157|0|252|0|{0|out0|}82|96|}
{2010216002|XXGoport_binding_oport|158|0|254|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}96|91|}
{2010211001|XXGvertex_iport_iport|159|0|255|0|{0|in0|}82|97|}
{2010215002|XXGiport_binding_iport|160|0|257|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}97|86|}
{2010006001|XXGobject_psameas_object|161|0|258|0|{InputLayout|Layout|0|0|}72|19|}
{2010006001|XXGobject_psameas_object|162|0|259|0|{OutputLayout|Layout|0|0|}72|19|}
{2010601001|XXGgraph_vertex_vertex|163|0|260|0|{Replicate|}54|98|}
{2010212001|XXGvertex_oport_oport|164|0|262|0|{0|out|}98|99|}
{2010213001|XXGoport_dst_flow|165|0|264|0|{0|}99|57|}
{2010213001|XXGoport_dst_flow|166|0|265|0|{1|}99|58|}
{2010211001|XXGvertex_iport_iport|167|0|266|0|{0|in|}98|100|}
{2010214001|XXGiport_src_flow|168|0|268|0|{0|}100|56|}
{2010007001|XXGobject_proto_object|169|0|269|0|{}98|101|}
{2010212001|XXGvertex_oport_oport|170|0|271|0|{0|out|}101|102|}
{2010006001|XXGobject_psameas_object|171|0|273|0|{metadata|out_metadata|1|0|}102|101|}
{2010211001|XXGvertex_iport_iport|172|0|274|0|{0|in|}101|103|}
{2010006001|XXGobject_psameas_object|173|0|276|0|{metadata|in_metadata|1|0|}103|101|}
{2010006001|XXGobject_psameas_object|174|0|277|0|{Layout|Layout|0|0|}98|65|}
{2010006001|XXGobject_psameas_object|175|0|278|0|{in_metadata|out0_metadata|0|0|}98|19|}
{2010006001|XXGobject_psameas_object|176|0|279|0|{out_metadata|out0_metadata|0|0|}98|19|}
{2010601001|XXGgraph_vertex_vertex|177|0|280|0|{Write_Dim_Datasets|}54|104|}
{2010604001|XXGgraph_flow_flow|178|0|282|0|{Flow_1|}104|105|}
{2010604001|XXGgraph_flow_flow|179|0|284|0|{Flow_2|}104|106|}
{2010604001|XXGgraph_flow_flow|180|0|286|0|{Flow_6|}104|107|}
{2010604001|XXGgraph_flow_flow|181|0|288|0|{Flow_7|}104|108|}
{2010601001|XXGgraph_vertex_vertex|182|0|290|0|{IDS_ICFF|}104|109|}
{2010212001|XXGvertex_oport_oport|183|0|292|0|{0|read|}109|110|}
{2010213001|XXGoport_dst_flow|184|0|294|0|{0|}110|106|}
{2010211001|XXGvertex_iport_iport|185|0|295|0|{0|write|}109|111|}
{2010214001|XXGiport_src_flow|186|0|297|0|{0|}111|107|}
{2010007001|XXGobject_proto_object|187|0|298|0|{}109|112|}
{2010212001|XXGvertex_oport_oport|188|0|300|0|{0|read|}112|113|}
{2010006001|XXGobject_psameas_object|189|0|302|0|{metadata|read_metadata|1|0|}113|112|}
{2010211001|XXGvertex_iport_iport|190|0|303|0|{0|write|}112|114|}
{2010006001|XXGobject_psameas_object|191|0|305|0|{metadata|write_metadata|1|0|}114|112|}
{2010601001|XXGgraph_vertex_vertex|192|0|306|0|{IDS_Index_File|}104|115|}
{2010211001|XXGvertex_iport_iport|193|0|308|0|{0|write|}115|116|}
{2010214001|XXGiport_src_flow|194|0|310|0|{0|}116|108|}
{2010007001|XXGobject_proto_object|195|0|311|0|{}115|117|}
{2010211001|XXGvertex_iport_iport|196|0|313|0|{0|write|}117|118|}
{2010006001|XXGobject_psameas_object|197|0|315|0|{metadata|write_metadata|1|0|}118|117|}
{2010006001|XXGobject_psameas_object|198|0|316|0|{write_metadata|index_metadata|0|0|}115|119|}
{2010212001|XXGvertex_oport_oport|199|0|318|0|{0|out|}119|120|}
{2010213001|XXGoport_dst_flow|200|0|320|0|{0|}120|107|}
{2010212001|XXGvertex_oport_oport|201|0|321|0|{1|index|}119|121|}
{2010213001|XXGoport_dst_flow|202|0|323|0|{0|}121|108|}
{2010212001|XXGvertex_oport_oport|203|0|324|0|{2|address|}119|122|}
{2010211001|XXGvertex_iport_iport|204|0|326|0|{0|in|}119|123|}
{2010214001|XXGiport_src_flow|205|0|328|0|{0|}123|105|}
{2010007001|XXGobject_proto_object|206|0|329|0|{}119|124|}
{2010212001|XXGvertex_oport_oport|207|0|331|0|{0|out|}124|125|}
{2010006001|XXGobject_psameas_object|208|0|333|0|{metadata|out_metadata|1|0|}125|124|}
{2010212001|XXGvertex_oport_oport|209|0|334|0|{1|index|}124|126|}
{2010006001|XXGobject_psameas_object|210|0|336|0|{metadata|index_metadata|1|0|}126|124|}
{2010212001|XXGvertex_oport_oport|211|0|337|0|{2|address|}124|127|}
{2010006001|XXGobject_psameas_object|212|0|339|0|{metadata|address_metadata|1|0|}127|124|}
{2010211001|XXGvertex_iport_iport|213|0|340|0|{0|in|}124|128|}
{2010006001|XXGobject_psameas_object|214|0|342|0|{metadata|in_metadata|1|0|}128|124|}
{2010006001|XXGobject_psameas_object|215|0|343|0|{Layout|Layout|0|0|}119|109|}
{2010006001|XXGobject_psameas_object|216|0|344|0|{in_metadata|out0_metadata|0|0|}119|19|}
{2010006001|XXGobject_psameas_object|217|0|345|0|{out_metadata|write_metadata|0|0|}119|109|}
{2010601001|XXGgraph_vertex_vertex|218|0|346|0|{Replicate|}104|129|}
{2010212001|XXGvertex_oport_oport|219|0|348|0|{0|out|}129|130|}
{2010213001|XXGoport_dst_flow|220|0|350|0|{0|}130|105|}
{2010211001|XXGvertex_iport_iport|221|0|351|0|{0|in|}129|131|}
{2010007001|XXGobject_proto_object|222|0|353|0|{}129|132|}
{2010212001|XXGvertex_oport_oport|223|0|355|0|{0|out|}132|133|}
{2010006001|XXGobject_psameas_object|224|0|357|0|{metadata|out_metadata|1|0|}133|132|}
{2010211001|XXGvertex_iport_iport|225|0|358|0|{0|in|}132|134|}
{2010006001|XXGobject_psameas_object|226|0|360|0|{metadata|in_metadata|1|0|}134|132|}
{2010006001|XXGobject_psameas_object|227|0|361|0|{Layout|Layout|0|0|}129|109|}
{2010006001|XXGobject_psameas_object|228|0|362|0|{in_metadata|out0_metadata|0|0|}129|19|}
{2010006001|XXGobject_psameas_object|229|0|363|0|{out_metadata|out0_metadata|0|0|}129|19|}
{2010601001|XXGgraph_vertex_vertex|230|0|364|0|{View_Data|}104|135|}
{2010211001|XXGvertex_iport_iport|231|0|366|0|{0|write|}135|136|}
{2010214001|XXGiport_src_flow|232|0|368|0|{0|}136|106|}
{2010007001|XXGobject_proto_object|233|0|369|0|{}135|137|}
{2010211001|XXGvertex_iport_iport|234|0|371|0|{0|write|}137|138|}
{2010006001|XXGobject_psameas_object|235|0|373|0|{metadata|write_metadata|1|0|}138|137|}
{2010601001|XXGgraph_vertex_vertex|236|0|374|0|{Write_Block_Compressed_Lookup|}104|119|}
{2010211001|XXGvertex_iport_iport|237|0|375|0|{0|in0|}104|139|}
{2010215002|XXGiport_binding_iport|238|0|377|0|{.5|.5|{0|}10629|}139|131|}
{2010214001|XXGiport_src_flow|239|0|378|0|{0|}139|57|}
{2010601001|XXGgraph_vertex_vertex|240|0|379|0|{Write_Multi_ICFF|}54|140|}
{2010605001|XXGgraph_legend_legend|241|0|381|0|{0|}140|141|}
{2010241001|XXGlegend_face_face|242|0|383|0|{}141|142|}
{2010604001|XXGgraph_flow_flow|243|0|385|0|{Flow_1|}140|143|}
{2010604001|XXGgraph_flow_flow|244|0|387|0|{Flow_6|}140|68|}
{2010604001|XXGgraph_flow_flow|245|0|388|0|{Flow_7|}140|144|}
{2010604001|XXGgraph_flow_flow|246|0|390|0|{Flow_8|}140|145|}
{2010601001|XXGgraph_vertex_vertex|247|0|392|0|{Compute_Multiple_Block_Compressed_Lookups|}140|146|}
{2010212001|XXGvertex_oport_oport|248|0|394|0|{0|out|}146|147|}
{2010213001|XXGoport_dst_flow|249|0|396|0|{0|}147|143|}
{2010212001|XXGvertex_oport_oport|250|0|397|0|{1|reject|}146|148|}
{2010212001|XXGvertex_oport_oport|251|0|399|0|{2|error|}146|149|}
{2010212001|XXGvertex_oport_oport|252|0|401|0|{3|log|}146|150|}
{2010212001|XXGvertex_oport_oport|253|0|403|0|{4|address|}146|151|}
{2010211001|XXGvertex_iport_iport|254|0|405|0|{0|in|}146|152|}
{2010007001|XXGobject_proto_object|255|0|407|0|{}146|153|}
{2010212001|XXGvertex_oport_oport|256|0|409|0|{0|out|}153|154|}
{2010006001|XXGobject_psameas_object|257|0|411|0|{metadata|out_metadata|1|0|}154|153|}
{2010212001|XXGvertex_oport_oport|258|0|412|0|{1|reject|}153|155|}
{2010006001|XXGobject_psameas_object|259|0|414|0|{metadata|reject_metadata|1|0|}155|153|}
{2010212001|XXGvertex_oport_oport|260|0|415|0|{2|error|}153|156|}
{2010006001|XXGobject_psameas_object|261|0|417|0|{metadata|error_metadata|1|0|}156|153|}
{2010212001|XXGvertex_oport_oport|262|0|418|0|{3|log|}153|157|}
{2010006001|XXGobject_psameas_object|263|0|420|0|{metadata|log_metadata|1|0|}157|153|}
{2010212001|XXGvertex_oport_oport|264|0|421|0|{4|address|}153|158|}
{2010006001|XXGobject_psameas_object|265|0|423|0|{metadata|address_metadata|1|0|}158|153|}
{2010211001|XXGvertex_iport_iport|266|0|424|0|{0|in|}153|159|}
{2010006001|XXGobject_psameas_object|267|0|426|0|{metadata|in_metadata|1|0|}159|153|}
{2010006001|XXGobject_psameas_object|268|0|427|0|{reject_metadata|in_metadata|0|0|}146|146|}
{2010601001|XXGgraph_vertex_vertex|269|0|428|0|{IDS_ICFF|}140|65|}
{2010601001|XXGgraph_vertex_vertex|270|0|429|0|{IDS_Index_File|}140|160|}
{2010211001|XXGvertex_iport_iport|271|0|431|0|{0|write|}160|161|}
{2010214001|XXGiport_src_flow|272|0|433|0|{0|}161|144|}
{2010007001|XXGobject_proto_object|273|0|434|0|{}160|162|}
{2010211001|XXGvertex_iport_iport|274|0|436|0|{0|write|}162|163|}
{2010006001|XXGobject_psameas_object|275|0|438|0|{metadata|write_metadata|1|0|}163|162|}
{2010006001|XXGobject_psameas_object|276|0|439|0|{write_metadata|index_metadata|0|0|}160|164|}
{2010212001|XXGvertex_oport_oport|277|0|441|0|{0|out|}164|165|}
{2010213001|XXGoport_dst_flow|278|0|443|0|{0|}165|68|}
{2010212001|XXGvertex_oport_oport|279|0|444|0|{1|index|}164|166|}
{2010213001|XXGoport_dst_flow|280|0|446|0|{0|}166|144|}
{2010212001|XXGvertex_oport_oport|281|0|447|0|{2|address|}164|167|}
{2010211001|XXGvertex_iport_iport|282|0|449|0|{0|in|}164|168|}
{2010007001|XXGobject_proto_object|283|0|451|0|{}164|169|}
{2010212001|XXGvertex_oport_oport|284|0|453|0|{0|out|}169|170|}
{2010006001|XXGobject_psameas_object|285|0|455|0|{metadata|out_metadata|1|0|}170|169|}
{2010212001|XXGvertex_oport_oport|286|0|456|0|{1|index|}169|171|}
{2010006001|XXGobject_psameas_object|287|0|458|0|{metadata|index_metadata|1|0|}171|169|}
{2010212001|XXGvertex_oport_oport|288|0|459|0|{2|address|}169|172|}
{2010006001|XXGobject_psameas_object|289|0|461|0|{metadata|address_metadata|1|0|}172|169|}
{2010211001|XXGvertex_iport_iport|290|0|462|0|{0|in|}169|173|}
{2010006001|XXGobject_psameas_object|291|0|464|0|{metadata|in_metadata|1|0|}173|169|}
{2010006001|XXGobject_psameas_object|292|0|465|0|{Layout|Layout|0|0|}164|65|}
{2010006001|XXGobject_psameas_object|293|0|466|0|{in_metadata|out0_metadata|0|0|}164|19|}
{2010006001|XXGobject_psameas_object|294|0|467|0|{out_metadata|write_metadata|0|0|}164|65|}
{2010601001|XXGgraph_vertex_vertex|295|0|468|0|{Replicate|}140|174|}
{2010212001|XXGvertex_oport_oport|296|0|470|0|{0|out|}174|175|}
{2010213001|XXGoport_dst_flow|297|0|472|0|{0|}175|145|}
{2010211001|XXGvertex_iport_iport|298|0|473|0|{0|in|}174|176|}
{2010214001|XXGiport_src_flow|299|0|475|0|{0|}176|143|}
{2010007001|XXGobject_proto_object|300|0|476|0|{}174|177|}
{2010212001|XXGvertex_oport_oport|301|0|478|0|{0|out|}177|178|}
{2010006001|XXGobject_psameas_object|302|0|480|0|{metadata|out_metadata|1|0|}178|177|}
{2010211001|XXGvertex_iport_iport|303|0|481|0|{0|in|}177|179|}
{2010006001|XXGobject_psameas_object|304|0|483|0|{metadata|in_metadata|1|0|}179|177|}
{2010006001|XXGobject_psameas_object|305|0|484|0|{in_metadata|out_metadata|0|0|}174|146|}
{2010006001|XXGobject_psameas_object|306|0|485|0|{out_metadata|out_metadata|0|0|}174|146|}
{2010601001|XXGgraph_vertex_vertex|307|0|486|0|{WMF|}140|180|}
{2010212001|XXGvertex_oport_oport|308|0|488|0|{0|reject|}180|181|}
{2010212001|XXGvertex_oport_oport|309|0|490|0|{1|error|}180|182|}
{2010212001|XXGvertex_oport_oport|310|0|492|0|{2|log|}180|183|}
{2010211001|XXGvertex_iport_iport|311|0|494|0|{0|in|}180|184|}
{2010214001|XXGiport_src_flow|312|0|496|0|{0|}184|145|}
{2010007001|XXGobject_proto_object|313|0|497|0|{}180|185|}
{2010212001|XXGvertex_oport_oport|314|0|499|0|{0|reject|}185|186|}
{2010006001|XXGobject_psameas_object|315|0|501|0|{metadata|reject_metadata|1|0|}186|185|}
{2010212001|XXGvertex_oport_oport|316|0|502|0|{1|error|}185|187|}
{2010006001|XXGobject_psameas_object|317|0|504|0|{metadata|error_metadata|1|0|}187|185|}
{2010212001|XXGvertex_oport_oport|318|0|505|0|{2|log|}185|188|}
{2010006001|XXGobject_psameas_object|319|0|507|0|{metadata|log_metadata|1|0|}188|185|}
{2010211001|XXGvertex_iport_iport|320|0|508|0|{0|in|}185|189|}
{2010006001|XXGobject_psameas_object|321|0|510|0|{metadata|in_metadata|1|0|}189|185|}
{2010006001|XXGobject_psameas_object|322|0|511|0|{in_metadata|out_metadata|0|0|}180|146|}
{2010006001|XXGobject_psameas_object|323|0|512|0|{reject_metadata|out_metadata|0|0|}180|146|}
{2010601001|XXGgraph_vertex_vertex|324|0|513|0|{Write_Block_Compressed_Lookup|}140|164|}
{2010601001|XXGgraph_vertex_vertex|325|0|514|0|{Write_Multiple_Block_Compressed_Lookups|}140|190|}
{2010212001|XXGvertex_oport_oport|326|0|516|0|{0|reject|}190|191|}
{2010212001|XXGvertex_oport_oport|327|0|518|0|{1|error|}190|192|}
{2010212001|XXGvertex_oport_oport|328|0|520|0|{2|log|}190|193|}
{2010212001|XXGvertex_oport_oport|329|0|522|0|{3|address|}190|194|}
{2010211001|XXGvertex_iport_iport|330|0|524|0|{0|in|}190|195|}
{2010007001|XXGobject_proto_object|331|0|526|0|{}190|196|}
{2010212001|XXGvertex_oport_oport|332|0|528|0|{0|reject|}196|197|}
{2010006001|XXGobject_psameas_object|333|0|530|0|{metadata|reject_metadata|1|0|}197|196|}
{2010212001|XXGvertex_oport_oport|334|0|531|0|{1|error|}196|198|}
{2010006001|XXGobject_psameas_object|335|0|533|0|{metadata|error_metadata|1|0|}198|196|}
{2010212001|XXGvertex_oport_oport|336|0|534|0|{2|log|}196|199|}
{2010006001|XXGobject_psameas_object|337|0|536|0|{metadata|log_metadata|1|0|}199|196|}
{2010212001|XXGvertex_oport_oport|338|0|537|0|{3|address|}196|200|}
{2010006001|XXGobject_psameas_object|339|0|539|0|{metadata|address_metadata|1|0|}200|196|}
{2010211001|XXGvertex_iport_iport|340|0|540|0|{0|in|}196|201|}
{2010006001|XXGobject_psameas_object|341|0|542|0|{metadata|in_metadata|1|0|}201|196|}
{2010211001|XXGvertex_iport_iport|342|0|543|0|{0|in0|}140|202|}
{2010215002|XXGiport_binding_iport|343|0|545|0|{.5|.5|{0|}11558|}202|168|}
{2010214001|XXGiport_src_flow|344|0|546|0|{0|}202|58|}
{2010211001|XXGvertex_iport_iport|345|0|547|0|{0|in0|}54|203|}
{2010215002|XXGiport_binding_iport|346|0|549|0|{.5|.5|{0|}311|}203|81|}
{2010214001|XXGiport_src_flow|347|0|550|0|{0|}203|9|}
{2010601001|XXGgraph_vertex_vertex|348|0|551|0|{Input_File|}1|31|}
{2010601001|XXGgraph_vertex_vertex|349|0|552|0|{Read_IDS_Data_File|}1|204|}
{2010604001|XXGgraph_flow_flow|350|0|554|0|{Flow_1|}204|205|}
{2010604001|XXGgraph_flow_flow|351|0|556|0|{Flow_17|}204|206|}
{2010601001|XXGgraph_vertex_vertex|352|0|558|0|{Broadcast|}204|207|}
{2010212001|XXGvertex_oport_oport|353|0|560|0|{0|out|}207|208|}
{2010213001|XXGoport_dst_flow|354|0|562|0|{0|}208|206|}
{2010211001|XXGvertex_iport_iport|355|0|563|0|{0|in|}207|209|}
{2010214001|XXGiport_src_flow|356|0|565|0|{0|}209|205|}
{2010007001|XXGobject_proto_object|357|0|566|0|{}207|210|}
{2010212001|XXGvertex_oport_oport|358|0|568|0|{0|out|}210|211|}
{2010006001|XXGobject_psameas_object|359|0|570|0|{metadata|out_metadata|1|0|}211|210|}
{2010211001|XXGvertex_iport_iport|360|0|571|0|{0|in|}210|212|}
{2010006001|XXGobject_psameas_object|361|0|573|0|{metadata|in_metadata|1|0|}212|210|}
{2010006001|XXGobject_psameas_object|362|0|574|0|{in_metadata|out_metadata|0|0|}207|213|}
{2010212001|XXGvertex_oport_oport|363|0|576|0|{0|out|}213|214|}
{2010213001|XXGoport_dst_flow|364|0|578|0|{0|}214|205|}
{2010212001|XXGvertex_oport_oport|365|0|579|0|{1|error|}213|215|}
{2010212001|XXGvertex_oport_oport|366|0|581|0|{2|log|}213|216|}
{2010007001|XXGobject_proto_object|367|0|583|0|{}213|217|}
{2010212001|XXGvertex_oport_oport|368|0|585|0|{0|out|}217|218|}
{2010006001|XXGobject_psameas_object|369|0|587|0|{metadata|out_metadata|1|0|}218|217|}
{2010212001|XXGvertex_oport_oport|370|0|588|0|{1|error|}217|219|}
{2010006001|XXGobject_psameas_object|371|0|590|0|{metadata|error_metadata|1|0|}219|217|}
{2010212001|XXGvertex_oport_oport|372|0|591|0|{2|log|}217|220|}
{2010006001|XXGobject_psameas_object|373|0|593|0|{metadata|log_metadata|1|0|}220|217|}
{2010006001|XXGobject_psameas_object|374|0|594|0|{out_metadata|out_metadata|0|0|}207|213|}
{2010601001|XXGgraph_vertex_vertex|375|0|595|0|{List_IDS_Files|}204|213|}
{2010601001|XXGgraph_vertex_vertex|376|0|596|0|{Read_IDS_Files|}204|221|}
{2010212001|XXGvertex_oport_oport|377|0|598|0|{0|out|}221|222|}
{2010212001|XXGvertex_oport_oport|378|0|600|0|{1|filereject|}221|223|}
{2010212001|XXGvertex_oport_oport|379|0|602|0|{2|fileerror|}221|224|}
{2010212001|XXGvertex_oport_oport|380|0|604|0|{3|reject|}221|225|}
{2010212001|XXGvertex_oport_oport|381|0|606|0|{4|error|}221|226|}
{2010212001|XXGvertex_oport_oport|382|0|608|0|{5|log|}221|227|}
{2010211001|XXGvertex_iport_iport|383|0|610|0|{0|in|}221|228|}
{2010214001|XXGiport_src_flow|384|0|612|0|{0|}228|206|}
{2010007001|XXGobject_proto_object|385|0|613|0|{}221|229|}
{2010212001|XXGvertex_oport_oport|386|0|615|0|{0|out|}229|230|}
{2010006001|XXGobject_psameas_object|387|0|617|0|{metadata|out_metadata|1|0|}230|229|}
{2010212001|XXGvertex_oport_oport|388|0|618|0|{1|filereject|}229|231|}
{2010006001|XXGobject_psameas_object|389|0|620|0|{metadata|filereject_metadata|1|0|}231|229|}
{2010212001|XXGvertex_oport_oport|390|0|621|0|{2|fileerror|}229|232|}
{2010006001|XXGobject_psameas_object|391|0|623|0|{metadata|fileerror_metadata|1|0|}232|229|}
{2010212001|XXGvertex_oport_oport|392|0|624|0|{3|reject|}229|233|}
{2010006001|XXGobject_psameas_object|393|0|626|0|{metadata|reject_metadata|1|0|}233|229|}
{2010212001|XXGvertex_oport_oport|394|0|627|0|{4|error|}229|234|}
{2010006001|XXGobject_psameas_object|395|0|629|0|{metadata|error_metadata|1|0|}234|229|}
{2010212001|XXGvertex_oport_oport|396|0|630|0|{5|log|}229|235|}
{2010006001|XXGobject_psameas_object|397|0|632|0|{metadata|log_metadata|1|0|}235|229|}
{2010211001|XXGvertex_iport_iport|398|0|633|0|{0|in|}229|236|}
{2010006001|XXGobject_psameas_object|399|0|635|0|{metadata|in_metadata|1|0|}236|229|}
{2010006001|XXGobject_psameas_object|400|0|636|0|{filereject_metadata|out_metadata|0|0|}221|213|}
{2010006001|XXGobject_psameas_object|401|0|637|0|{in_metadata|out_metadata|0|0|}221|213|}
{2010212001|XXGvertex_oport_oport|402|0|638|0|{0|out0|}204|237|}
{2010216002|XXGoport_binding_oport|403|0|640|0|{.5|.5|{0|}14915|}237|222|}
{2010213001|XXGoport_dst_flow|404|0|641|0|{0|}237|11|}
{2010601001|XXGgraph_vertex_vertex|405|0|642|0|{Reformat|}1|19|}
{2010601001|XXGgraph_vertex_vertex|406|0|643|0|{Replicate|}1|238|}
{2010212001|XXGvertex_oport_oport|407|0|645|0|{0|out|}238|239|}
{2010213001|XXGoport_dst_flow|408|0|647|0|{0|}239|9|}
{2010213001|XXGoport_dst_flow|409|0|648|0|{1|}239|7|}
{2010211001|XXGvertex_iport_iport|410|0|649|0|{0|in|}238|240|}
{2010214001|XXGiport_src_flow|411|0|651|0|{0|}240|10|}
{2010007001|XXGobject_proto_object|412|0|652|0|{}238|241|}
{2010212001|XXGvertex_oport_oport|413|0|654|0|{0|out|}241|242|}
{2010006001|XXGobject_psameas_object|414|0|656|0|{metadata|out_metadata|1|0|}242|241|}
{2010211001|XXGvertex_iport_iport|415|0|657|0|{0|in|}241|243|}
{2010006001|XXGobject_psameas_object|416|0|659|0|{metadata|in_metadata|1|0|}243|241|}
{2010006001|XXGobject_psameas_object|417|0|660|0|{Layout|Layout|0|0|}238|19|}
{2010006001|XXGobject_psameas_object|418|0|661|0|{in_metadata|out0_metadata|0|0|}238|19|}
{2010006001|XXGobject_psameas_object|419|0|662|0|{out_metadata|out0_metadata|0|0|}238|19|}
{2010109001|XXGobject_property_value|420|0|663|0|{0|TrackingThumbprint|72|}1|244|}
