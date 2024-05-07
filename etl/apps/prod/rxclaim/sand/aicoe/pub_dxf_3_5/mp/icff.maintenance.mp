@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|292|rel_count|481|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "/~$PUB_DB_XFR/file_list.xfr";
include "~$PUB_DXF_XFR/ids/ids_governance_properties.xfr";|8|1|Kl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|AB_ALLOW_GRAPH_IN_COMPONENT|True|13|9|REK|Allow m_rm to run in run program|{0|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS")) now()]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATASET|to_be_set.to_be_set|3|9|FK|@{0|}}
{30001002|XXparameter|IS_CREATE_TYPE1_SNAPSHOT|True|13|9|FK|@{0|}}
{30001002|XXparameter|IS_XREF_AN_ICFF|$[if(get_ids_table_properties(string_concat(string_split(IDS_DATASET,".")[0],".",string_split(IDS_DATASET,".")[1])).storage_type=="icff") "Y" else "N" ]|3|9|K|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(string_concat(string_split(IDS_DATASET,".")[0],".",string_split(IDS_DATASET,".")[1]))]|3|9|K|@{0|}}
{30001002|XXparameter|IDS_DATASET_IS_REDUCED|$[first_defined(null_if_error(string_split(IDS_DATASET, ".")[2]), "") == "reduced"]|13|9|FK|@{0|}}
{30001002|XXparameter|DO_MNTNCE_FACT_DATA_FL|$[is_valid((date("YYYYMMDD"))first_defined(null_if_error(string_split(IDS_DATASET, ".")[2]), ""))]|13|9|K|Check if the fact IDS file maintenance can be done or not|{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|K|@{0|}}
{30001002|XXparameter|IDS_DML_FILE|$PUB_DATAHUB_DML|3|9|K|@{0|}}
{30001002|XXparameter|DO_ARCHIVE_FL_MNTNCE|False|13|9|FK|When set to true will do archive file maintenance|{0|}}
{30001002|XXparameter|INPUT_FL|$[begin
let string("") v_ids_dataset = IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];
let string("") v_fact_fl_dt = if( length_of(v_details) > 2) v_details[2] else "";

result ::  if( DO_ARCHIVE_FL_MNTNCE )
                        if(IDS_DATASET_IS_REDUCED) 
                                IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.archive.dat.gz"
                        else if(DATASET_IDENTIFIER == "many" )
                                        if ( DO_MNTNCE_FACT_DATA_FL )
                                                IDS_PATH + "/ids/" + v_sub_area + "/many/" + v_target_nm + "." + v_fact_fl_dt +".archive.dat.gz"
                                        else
                                                "Not Required"
                        else 
                                IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.dat.gz" 
        else
                        if(IDS_DATASET_IS_REDUCED) 
                                IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.dat.gz"
                        else if(DATASET_IDENTIFIER == "many" )
                                        if ( DO_MNTNCE_FACT_DATA_FL )
                                                IDS_PATH + "/ids/" + v_sub_area + "/many/" + v_target_nm + "." + v_fact_fl_dt +".dat.gz"
                                        else
                                                "Not Required"
                        else 
                                IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".dat.gz" ;
end ]|3|9|RK|@{0|}}
{30001002|XXparameter|INPUT_IDX_FL|$[begin
let string("") v_ids_dataset = IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];
let string("") v_fact_fl_dt = if( length_of(v_details) > 2) v_details[2] else "";

result :: if( DO_ARCHIVE_FL_MNTNCE )
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.archive.idx"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/" + v_target_nm + "." + v_fact_fl_dt +".archive.idx"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.idx" 
        else
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.idx"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/" + v_target_nm + "." + v_fact_fl_dt +".idx"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".idx" ;
end ]|3|9|RK|@{0|}}
{30001002|XXparameter|IDS_ARCHIVE_FL|$[begin
let string("") v_ids_dataset = IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];
let string("") v_fact_fl_dt = if( length_of(v_details) > 2) v_details[2] else "";

result :: if( DO_ARCHIVE_FL_MNTNCE )
                "Not Required"
        else
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.archive.dat.gz"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/" + v_target_nm + "." + v_fact_fl_dt +".archive.dat.gz"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.dat.gz" ;
end ]|3|9|K|@{0|}}
{30001002|XXparameter|IDS_IDX_ARCHIVE_FL|$[begin
let string("") v_ids_dataset = IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];
let string("") v_fact_fl_dt = if( length_of(v_details) > 2) v_details[2] else "";

result :: if( DO_ARCHIVE_FL_MNTNCE )
                "Not Required"
        else
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.archive.idx"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/" + v_target_nm + "." + v_fact_fl_dt +".archive.idx"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.idx" ;
end ]|3|9|K|@{0|}}
{30001002|XXparameter|INPUT_ICFF_XREF_DATA_FILE|$[begin

let string("") v_ids_dataset=IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];

result::  if(IDS_DATASET_IS_REDUCED) 
                ""
          else if( IS_XREF_AN_ICFF == "Y" )
                IDS_PATH + "/ids/" + v_sub_area + "/xref/xref." + v_target_nm + ".dat.gz" 
          else
                IDS_PATH + "/ids/" + v_sub_area + "/xref/xref." + v_target_nm + ".dat" ;
end ]|3|9|K|@{0|}}
{30001002|XXparameter|INPUT_ICFF_XREF_IDX_FILE|$[begin

let string("") v_ids_dataset=IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];

result::  if(IDS_DATASET_IS_REDUCED) 
                ""
          else 
                IDS_PATH + "/ids/" + v_sub_area + "/xref/xref." + v_target_nm + ".idx" ;
end ]|3|9|K|@{0|}}
{30001002|XXparameter|OUTPUT_ICFF_XREF_DATA_FILE|$[begin

let string("") v_ids_dataset=IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];

result::  if(IDS_DATASET_IS_REDUCED) 
                ""
          else if( IS_XREF_AN_ICFF == "Y" )
                IDS_PATH + "/ids/" + v_sub_area + "/xref/new_xref." + v_target_nm + ".dat.gz"
          else
                IDS_PATH + "/ids/" + v_sub_area + "/xref/new_xref." + v_target_nm + ".dat";
end ]|3|9|K|This file will be written in graph after xref collapse|{0|}}
{30001002|XXparameter|OUTPUT_ICFF_XREF_IDX_FILE|$[begin

let string("") v_ids_dataset=IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];

result::  if(IDS_DATASET_IS_REDUCED) 
                ""
          else 
                IDS_PATH + "/ids/" + v_sub_area + "/xref/new_xref." + v_target_nm + ".idx" ;
end ]|3|9|K|This file will be written in graph after xref collapse|{0|}}
{30001002|XXparameter|ICFF_FILE|$[begin
let string("") v_ids_dataset = IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];
let string("") v_fact_fl_dt = if( length_of(v_details) > 2) v_details[2] else "";

result :: if( DO_ARCHIVE_FL_MNTNCE )
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".reduced.archive.dat.gz"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/new_" + v_target_nm + "." + v_fact_fl_dt +".archive.dat.gz"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".archive.dat.gz" 
        else
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".reduced.dat.gz"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/new_" + v_target_nm + "." + v_fact_fl_dt +".dat.gz"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".dat.gz" ;
end ]|3|9|RK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE|$[begin
let string("") v_ids_dataset = IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];
let string("") v_fact_fl_dt = if( length_of(v_details) > 2) v_details[2] else "";

result :: if( DO_ARCHIVE_FL_MNTNCE )
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".reduced.archive.idx"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/new_" + v_target_nm + "." + v_fact_fl_dt +".archive.idx"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".archive.idx" 
        else
                if(IDS_DATASET_IS_REDUCED) 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".reduced.idx"
                else if(DATASET_IDENTIFIER == "many" )
                        if ( DO_MNTNCE_FACT_DATA_FL )
                                IDS_PATH + "/ids/" + v_sub_area + "/many/new_" + v_target_nm + "." + v_fact_fl_dt +".idx"
                        else
                                "Not Required"
                else 
                        IDS_PATH + "/ids/" + v_sub_area + "/one/new_" + v_target_nm + ".idx" ;
end ]|3|9|RK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|EK|@{0|}}
{30001002|XXparameter|AI_LOG_FILE|$[AI_SERIAL_LOG + "/icff_maintenance." + IDS_DATASET + "." +(string(""))RUN_ID +".log"]|3|9|K|@{0|}}
{30001002|XXparameter|LOAD_PSET_DIR|$AI_PSET|3|9|FK|@{0|}}
{30001002|XXparameter|DML_FL|$[begin

let string("") v_ids_dataset=IDS_DATASET;
let string("")[] v_details = string_split_no_empty(IDS_DATASET,".");
let string("") v_sub_area = v_details[0];
let string("") v_target_nm = v_details[1];

let string("") ids_nk_flag_value = get_ids_with_nk_flag(string_split(IDS_DATASET, ".")[0], IDS_DATASET, LOAD_PSET_DIR, PUB_DATAHUB_DML);

let string(1) ids_nk_flag = if( ids_nk_flag_value member [vector "1", "True" ]) "1" else "0";  //load pset can return boolean values as true or 1 or false or 0

result :: if(IDS_DATASET_IS_REDUCED) 
                IDS_DML_FILE + "/" + v_sub_area + "/" + string_concat(v_sub_area,".",v_target_nm) + ".reduced.dml" 
            else if ( ids_nk_flag == "1" )
                IDS_DML_FILE + "/nk/" + v_sub_area + "/" + string_concat(v_sub_area,".",v_target_nm) + ".dml" 
            else
                IDS_DML_FILE + "/" + v_sub_area + "/" + string_concat(v_sub_area,".",v_target_nm) + ".dml" ;

end ]|3|9|REK|@{0|}}
{30001002|XXparameter|SORT_KEY|$[begin
let string("")[int] v_all_col_vec=record_info_item_expanded(read_type(DML_FL),item="name");
result:: if("ids_updt_dttm" member v_all_col_vec) "\{dxf_hk_part1;ids_updt_dttm\}" else "\{dxf_hk_part1\}" ;
end ]|3|9|RFK|@{0|}}
{30001002|XXparameter|LOAD_PSET_PARAMS|$[
if(file_information(LOAD_PSET_DIR + "/load." + string_split(IDS_DATASET,".")[0] + "/load." + string_replace(IDS_DATASET, ".reduced", "") + ".pset").found)
  pset_info(read_file(LOAD_PSET_DIR + "/load." + string_split(IDS_DATASET,".")[0] + "/load." + string_replace(IDS_DATASET, ".reduced", "") + ".pset")).parameters
else [vector]
]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DS_ARCHIVE_FILTER_EXPR|$[
begin
let parameter_info_type[int] parameters = LOAD_PSET_PARAMS;
let long param_index = vector_search(parameters, [record name "IDS_DS_ARCHIVE_FILTER_EXPR" value "" interpretation "pdl" value_in_file 0 interpret_file_contents 0 overridable 1], \{name\});

result :: if(param_index != -1) parameters[param_index].value else "";
end
]|20|9|FK|Filter data from main IDS to archive IDS for two step lookup. Set in load.ids pset.|{0|}}
{30001002|XXparameter|USE_XREF_FOR_CDC|$[
begin
let param_index = vector_search(LOAD_PSET_PARAMS, [record name "USE_XREF_FOR_CDC" value "" interpretation "pdl" value_in_file 0 interpret_file_contents 0 overridable 1], \{name\});

result :: if( IDS_DATASET_IS_REDUCED )
                0
          else if( param_index != -1 && LOAD_PSET_PARAMS[param_index].value member [vector "True", "1"] )
                1
          else if( DATASET_IDENTIFIER == "many" )
                1
          else
                0;
                
                
//result :: param_index != -1 && LOAD_PSET_PARAMS[param_index].value member [vector "True", "1"] && !IDS_DATASET_IS_REDUCED;
end
]|3|9|FK|This parameter tells if load.icff graph will use XREF for CDC or not. For fact table, you can force it to 1; if you want to do maintenance of IDS file. Default is false.|{0|}}
{30001002|XXparameter|TRUNCATE_AND_LOAD_FLAG|$[
begin
let param_index = vector_search(LOAD_PSET_PARAMS, [record name "TRUNCATE_AND_LOAD" value "" interpretation "pdl" value_in_file 0 interpret_file_contents 0 overridable 1], \{name\});

result :: if( param_index != -1 && LOAD_PSET_PARAMS[param_index].value member [vector "True", "1"] )
                1
          else
                0;
end
]|3|9|K|@{0|}}
{30001002|XXparameter|IDS_TABLE_TYPE|$[get_ids_table_type(string_concat(string_split(IDS_DATASET,".")[0],".",string_split(IDS_DATASET,".")[1]))]|3|9|K|@{0|}}
{30001002|XXparameter|FILTER_DATA_FROM_ARCHIVE_FL||3|9|FK|Filter data from archive file and send to type2 file while doing maintenance for archive file. Only used when DO_ARCHIVE_FL_MNTNCE set to true|{0|}}
{30001002|XXparameter|AUDIT_FILE_NM|$[AI_SERIAL_LOG + "/icff.maintenance/" + IDS_DATASET + ".dat"]|28|9|RK|@{0|}}
{30001002|XXparameter|_Governance_Parameters_|********************************************************************|3|9|K|@{0|}}
{30001002|XXparameter|IDS_GOVERNANCE_PROPERTIES|$[
begin
//Below code is to use main table retention for reduced dataset, if the entry is not found
//result :: if ( IDS_DATASET_IS_REDUCED )
//                if( IDS_DATASET member get_ids_governance_table_list() )
//                        get_ids_governance_properties(IDS_DATASET)
//                else if ( string_concat( string_split(IDS_DATASET,".")[0],".",string_split(IDS_DATASET,".")[1]) member get_ids_governance_table_list() )
//                        get_ids_governance_properties(string_concat(string_split(IDS_DATASET,".")[0],".",string_split(IDS_DATASET,".")[1]))
//                else    
//                        get_ids_governance_properties(IDS_DATASET)
//                else    
//                        get_ids_governance_properties(IDS_DATASET);

        result :: get_ids_governance_properties(IDS_DATASET);

end]|3|9|K|Governance Property telling if the table is truncate and load in nature or not|{0|}}
{30001002|XXparameter|IDS_GOVERNANCE_RETENTION_PERIOD|$[IDS_GOVERNANCE_PROPERTIES.file_data_retention_period]|3|9|K|Governance Property telling if the table is truncate and load in nature or not|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|icff.maintenance|Manav Jindal|Created 2/27/2018 6:41:27 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1185000|693000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{3|0|0|0|}Job 'icff.maintenance' Execution Status Report

Job completed successfully at Friday, September 18, 2020 18:10:42
Run performed by user abansa28
||echo "Maintenance Processing Started for : $IDS_DATASET" 

if [[ ! -d $\{AI_SERIAL_LOG\}/icff.maintenance ]]; then
        echo "$AI_SERIAL_LOG/icff.maintenance directory doesn't exist: Creating "
        m_mkdir -m 775 -p $\{AI_SERIAL_LOG\}/icff.maintenance
fi

|if [ $mpjret -eq 0 ]
then
        echo " Graph completed , running end Scripts now " 

#Rename ICFF file created with ,.new suffix to main file 
        if [[ $USE_XREF_FOR_CDC == 0 && ( -f $ICFF_FILE )  && ( -f $ICFF_INDEX_FILE ) ]];then
        
                echo "Renaming INPUT_FILE :$ICFF_FILE to Main ICFF file :- $INPUT_FL "
                m_mv $ICFF_FILE $INPUT_FL
                        if [ $? -ne 0 ];then
                                echo " failed to rename  new INPUT_FILE :$ICFF_FILE to Main ICFF file :- $INPUT_FL "
                                exit 12
                        fi


                
                echo "Renaming INPUT_IDX_FILE :$ICFF_INDEX_FILE to Main ICFF file :-$INPUT_IDX_FL " 
                m_mv $ICFF_INDEX_FILE $INPUT_IDX_FL
                        if [ $? -ne 0 ];then
                                echo " failed to rename  new INPUT_IDX_FILE :$ICFF_INDEX_FILE to Main ICFF file :- $INPUT_IDX_FL "
                                exit 12
                        fi 


        fi

# Now renaming new  xref file to main files 
        if [[ $IS_XREF_AN_ICFF == "Y" && $IDS_DATASET_IS_REDUCED == 0 && ( -f $OUTPUT_ICFF_XREF_DATA_FILE )  && ( -f $OUTPUT_ICFF_XREF_IDX_FILE ) ]];then
                echo "Renaming OUTPUT_ICFF_XREF_IDX_FILE :$OUTPUT_ICFF_XREF_IDX_FILE to Main xref ICFF file :-$INPUT_ICFF_XREF_IDX_FILE "
                m_mv $OUTPUT_ICFF_XREF_DATA_FILE $INPUT_ICFF_XREF_DATA_FILE
                        if [ $? -ne 0 ];then
                                echo " failed to rename  new xref : OUTPUT_ICFF_XREF_DATA_FILE :$INPUT_ICFF_XREF_DATA_FILE to Main XREF ICFF file :-$INPUT_ICFF_XREF_DATA_FILE "
                                exit 12
                        fi 
        
                echo " Renaming DX  OUTPUT_ICFF_XREF_IDX_FILE :$OUTPUT_ICFF_XREF_IDX_FILE to Main xref ICFF file :-$INPUT_ICFF_XREF_IDX_FILE "
                m_mv $OUTPUT_ICFF_XREF_IDX_FILE $INPUT_ICFF_XREF_IDX_FILE
                        if [ $? -ne 0 ];then
                                echo " failed to rename  new xref IDX  OUTPUT_ICFF_XREF_IDX_FILE :$OUTPUT_ICFF_XREF_IDX_FILE to Main xref ICFF file :-$INPUT_ICFF_XREF_IDX_FILE "
                                exit 12
                        fi 
        fi
   
        #echo $IDS_DATASET >> $RUN_ID_FILE
        echo " Maintenenace run successfull with RUN ID : $RUN_ID"
fi
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apvrd55593- IDW plm server||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|128|120|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Run IDS Data and IDX Maintenance|98794|30155|109000|35000|927000|56000|13836|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|360|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@IDS Dataset: $IDS_DATASET  |307000|119000|0|0|0|0|14235|}}
{2010242002|XXGface|8|0|15|0|{@{}@Calibri|128|130|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Archive Maintenance: $DO_ARCHIVE_FL_MNTNCE  |308000|152000|0|0|0|0|14239|}}
{2010242002|XXGface|10|0|19|0|{@{}@Calibri|128|120|0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14296|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14250|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14283|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14303|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@0|.5|.5|{0|}14302|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14301|529|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14305|17|}}
{2010600005|XXGgraph|18|0|35|0|{Subgraph created from graph "icff.maintenance"|{}@0|@150000|565500|0|0|0|0|14252|Create Audit File|Manav Jindal|Created 11/27/2018 4:26:37 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|534000|380000|3|}}
{2010240003|XXGlegend|19|0|37|0|{@{}@Create Audit File having IDS Dataset and Maintenance Date
No History is needed.|57000|274000|0|0|0|0|14086|}}
{2010242002|XXGface|20|0|39|0|{@{}@Calibri|128|140|0|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}14099|17|}}
{2010503005|XXGfvertex|22|0|43|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AUDIT_FILE_NM", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AUDIT_FILE_NM|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
        string("\|") ids_dataset_nm;
        string("\|") xref_dataset_nm;
        string("\\n") ids_maint_dt;
end|3|1|l|@{0|}}
}}@1|@345000|170000|0|0|0|0|14100|Audit File|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|23|0|45|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|24|0|48|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|25|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|26|0|53|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = 
begin
        out.ids_dataset_nm :: $"INPUT_FL";
        out.xref_dataset_nm :: $"INPUT_ICFF_XREF_DATA_FILE";
        out.ids_maint_dt :: $"RUN_ID";
end;|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Create Data|35000|164000|0|0|0|0|14098|Create Audit Information|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|27|0|55|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|28|0|58|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|29|0|60|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|30|0|62|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|31|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|32|0|67|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|34|0|75|0|{Subgraph created from graph "icff.maintenance"|{}@0|@968000|106500|0|0|0|0|14299|Disabled governance component|Manav Jindal|@1|100|-1|@9|@32833|{0|}0|0|{0|}{0|}{0|}{0|}1.0|337000|334000|3|}}
{2010210004|XXGflow|35|0|77|0|{@{}@384|.5|.5|{0|}14292|17|}}
{2010501005|XXGpvertex|36|0|79|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ IDS_TABLE_TYPE not member [vector "reference_static", "relation_static"] and IDS_GOVERNANCE_PROPERTIES.retention_type == "Days" and not is_blank(IDS_GOVERNANCE_PROPERTIES.table) ]|3|9||@{0|}}
{30001002|XXparameter|select_expr|date_difference_days((datetime("YYYYMMDDHH24MISS"))now1(), ids_updt_dttm) <= (double)(decimal("")) $\{IDS_GOVERNANCE_RETENTION_PERIOD\}|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|40000|30000|0|0|0|0|14293|Governance Filter|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|37|0|81|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|38|0|83|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|39|0|86|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|40|0|88|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|41|0|90|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|92|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|94|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|44|0|96|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|45|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|46|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|47|0|105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|48|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|50|0|114|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0047|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@0|@294000|85000|0|0|0|0|10783|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|51|0|116|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|52|0|118|0|{@{}@384|.5|.5|{0|}10782|2065|}}
{2010202004|XXGiport|53|0|120|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|54|0|122|0|{@{}@384|.5|.5|{0|}10781|17|}}
{2010503005|XXGfvertex|55|0|124|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|56|0|126|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|57|0|129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|58|0|132|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
}}@0|Trash|214000|189000|0|0|0|0|14290|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||193|1|{1|0|}}}
{2010202004|XXGiport|59|0|134|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|60|0|137|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|61|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|62|0|142|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[
if( not USE_XREF_FOR_CDC && not DO_ARCHIVE_FL_MNTNCE ) 
        if( IDS_DS_ARCHIVE_FILTER_EXPR != "" )
                1
        else
                0
else if( DO_ARCHIVE_FL_MNTNCE )
                if( FILTER_DATA_FROM_ARCHIVE_FL != "" )
                        1
                else
                        0
else
        0
]|3|9||@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|$[
if( not DO_ARCHIVE_FL_MNTNCE)
        IDS_DS_ARCHIVE_FILTER_EXPR
else if( DO_ARCHIVE_FL_MNTNCE )
        FILTER_DATA_FROM_ARCHIVE_FL
]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|503000|370000|0|0|0|0|14304|Load ICFF Filter|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|63|0|144|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|64|0|147|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|65|0|150|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|66|0|152|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|67|0|154|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|68|0|156|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|159|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|70|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|71|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|72|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|73|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|74|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|75|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|76|0|180|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Merge_Multiple_Block_Compressed_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|type filenames_type = record string(integer(4)) datafile; string(integer(4)) indexfile; end;

/*extract vector of datafile and indexfile filenames from input record*/
filenames_vector::get_filenames_vector(in)=
begin
        let filenames_type[int] v_file_vec = [vector];
        filenames_vector :: vector_append(v_file_vec,[record datafile this_partition_path(in.datafile) indexfile this_partition_path(in.indexfile) ]);
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Merge Multiple Block-Compressed Data|400000|66500|0|0|0|0|13636|Merge Main IDS|Ab Initio Software|Built-in 2.15.6.r35.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|77|0|182|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|78|0|184|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|79|0|186|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|80|0|188|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|81|0|190|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|82|0|192|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|194|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|84|0|196|0|{@{}@384|.5|.5|{0|}13635|20|}}
{2010501005|XXGpvertex|85|0|198|0|{Merges data from multiple concatenated block-compressed data files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|merge-multi-bc-data|3|1|Hl||{0|}}
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
{30001002|XXparameter|extra_transforms_analysis|filenames::copyfilenames(filenames_vector) = begin filenames :: filenames_vector[0]; end;|3|2|H$||{0|}}
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
}}@0|Merge Multiple Block-Compressed Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|86|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|87|0|203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|88|0|206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|89|0|209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|90|0|212|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|91|0|215|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|92|0|218|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|93|0|222|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string(integer(4)) datafile;
  string(integer(4)) indexfile;
end|3|1|l|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = 
begin
        out.datafile :: $"INPUT_FL";
        out.indexfile :: $"INPUT_IDX_FL";
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|49000|81000|0|0|0|0|13631|Send IDS FL|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|94|0|224|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|95|0|226|0|{@{}@384|.5|.5|{0|}13630|17|}}
{2010203004|XXGoport|96|0|228|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|97|0|230|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|98|0|232|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|99|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|100|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|101|0|240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|102|0|247|0|{Subgraph created from graph "icff.maintenance"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ 
if ( TRUNCATE_AND_LOAD_FLAG )
        0
else if ( not USE_XREF_FOR_CDC && not DO_ARCHIVE_FL_MNTNCE )
        1
else if ( DO_ARCHIVE_FL_MNTNCE && DATASET_IDENTIFIER != "many" )
        1
else if ( DO_MNTNCE_FACT_DATA_FL )
        1
else
        0
 ]|3|9|F||{0|}}
}}@0|@23000|369000|0|0|0|0|14270|Read Main ids|Manav Jindal|Created 3/1/2018 2:59:45 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|608000|246000|3|}}
{2010501005|XXGpvertex|103|0|251|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|220000|96000|0|0|0|0|13606|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|104|0|253|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|105|0|256|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|106|0|259|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|107|0|261|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|108|0|264|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|109|0|272|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010600005|XXGgraph|110|0|276|0|{Subgraph created from graph "icff.maintenance"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ 
if( DO_ARCHIVE_FL_MNTNCE )
        0
else if( IS_XREF_AN_ICFF=="Y" and not IDS_DATASET_IS_REDUCED )
        1
else
        0
]|3|9|F||{0|}}
}}@0|@23000|219000|0|0|0|0|14295|Read Xref|Manav Jindal|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|608000|246000|3|}}
{2010210004|XXGflow|111|0|278|0|{@{}@384|.5|.5|{0|}13611|20|}}
{2010210004|XXGflow|112|0|280|0|{@{}@384|.5|.5|{0|}13617|17|}}
{2010501005|XXGpvertex|113|0|282|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|220000|96000|0|0|0|0|13606|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|114|0|284|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|115|0|287|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|116|0|290|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|117|0|292|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|118|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|298|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string(integer(4)) data_file_nm;
  string(integer(4)) index_file_nm;
end|3|1|l|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.data_file_nm :: $"INPUT_ICFF_XREF_DATA_FILE";
  out.index_file_nm :: $"INPUT_ICFF_XREF_IDX_FILE";
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|49000|81000|0|0|0|0|13618|Send XREF FL|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|120|0|300|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|121|0|303|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|122|0|305|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|123|0|307|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|124|0|309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|125|0|312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|126|0|315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|127|0|320|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Merge_Multiple_Block_Compressed_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|type filenames_type = record string(integer(4)) datafile; string(integer(4)) indexfile; end;

/*extract vector of datafile and indexfile filenames from input record*/
filenames_vector::get_filenames_vector(in)=
begin
        let filenames_type[int] v_file_vec = [vector];
        filenames_vector :: vector_append(v_file_vec,[record datafile this_partition_path(in.data_file_nm) indexfile this_partition_path(in.index_file_nm) ]);
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = xref_lookup_type;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Merge Multiple Block-Compressed Data|400000|41500|0|0|0|0|13612|Merge Multiple Block-Compressed Data|Ab Initio Software|Built-in 2.15.6.r35.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|128|0|322|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|129|0|324|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|130|0|326|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|131|0|328|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|132|0|330|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|133|0|332|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|134|0|334|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|135|0|337|0|{Merges data from multiple concatenated block-compressed data files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|merge-multi-bc-data|3|1|Hl||{0|}}
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
{30001002|XXparameter|extra_transforms_analysis|filenames::copyfilenames(filenames_vector) = begin filenames :: filenames_vector[0]; end;|3|2|H$||{0|}}
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
}}@0|Merge Multiple Block-Compressed Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|136|0|339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|137|0|342|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|138|0|345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|139|0|348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|140|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|141|0|354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|142|0|357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|143|0|360|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_ICFF_XREF_DATA_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_ICFF_XREF_DATA_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0047|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@0|@324000|81000|0|0|0|0|13194|ICFF XREF-Data|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|144|0|362|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|145|0|364|0|{@{}@384|.5|.5|{0|}13193|17|}}
{2010202004|XXGiport|146|0|366|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|147|0|368|0|{@{}@384|.5|.5|{0|}13192|17|}}
{2010503005|XXGfvertex|148|0|370|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|149|0|372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|150|0|375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010203004|XXGoport|151|0|381|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010600005|XXGgraph|152|0|385|0|{Subgraph created from graph "For Type1 Snapshot"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ 
if ( TRUNCATE_AND_LOAD_FLAG )
        0
else if ( IS_CREATE_TYPE1_SNAPSHOT && not USE_XREF_FOR_CDC )
        1
else if ( DO_MNTNCE_FACT_DATA_FL )
        1
else
        0
]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@255000|377000|0|0|0|0|14284|Remove Duplicates|Manav Jindal|Created 3/29/2018 4:09:10 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|677000|327000|3|}}
{2010210004|XXGflow|153|0|387|0|{@{}@384|.5|.5|{0|}10826|17|}}
{2010210004|XXGflow|154|0|389|0|{@{}@384|.5|.5|{0|}10825|17|}}
{2010501005|XXGpvertex|155|0|391|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|keep|last|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|324000|106500|0|0|0|0|10827|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|156|0|393|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|157|0|395|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|158|0|398|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|159|0|400|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|160|0|402|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|161|0|404|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|162|0|407|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|163|0|409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|164|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|165|0|415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|166|0|418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|167|0|421|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|168|0|424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|169|0|432|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|max_core|$\{AI_SORT_MAX_CORE\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|90000|100000|0|0|0|0|10813|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|170|0|434|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|171|0|437|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|172|0|439|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|173|0|441|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|174|0|444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|175|0|450|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|560000|238000|0|0|0|0|10819|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|176|0|452|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|177|0|455|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|178|0|457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|179|0|462|0|{@{}@0|0|0|0|out0|.3|@@@14352|0|}}
{2010202004|XXGiport|180|0|466|0|{@{}@0|0|0|0|in0|.22384428223844283|@@@13840|0|}}
{2010501005|XXGpvertex|181|0|470|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$[if (IS_CREATE_TYPE1_SNAPSHOT) ICFF_KEY else SORT_KEY]|3|9||@{0|}}
{30001002|XXparameter|max_core|$\{AI_GRAPH_MAX_CORE\}|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[
if ( not is_blank(IDS_GOVERNANCE_PROPERTIES.table) and IDS_GOVERNANCE_PROPERTIES.retention_type == "Days" and IDS_TABLE_TYPE not member [vector "reference_static", "relation_static"] )
        1
else if( not USE_XREF_FOR_CDC && not DO_ARCHIVE_FL_MNTNCE  ) 
        if( IDS_DS_ARCHIVE_FILTER_EXPR != "" )
                1
        else
                0
else if( DO_ARCHIVE_FL_MNTNCE )
                if( FILTER_DATA_FROM_ARCHIVE_FL != "" )
                        1
                else
                        0
else
        0
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|813000|355000|0|0|0|0|14298|SRT Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|182|0|472|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|183|0|475|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|184|0|478|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|185|0|480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|186|0|483|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|187|0|489|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ 
if( DO_ARCHIVE_FL_MNTNCE )
        0
else
        1
 ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|727000|537000|0|0|0|0|14104|Send Main IDS Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|188|0|491|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|189|0|494|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|190|0|497|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|191|0|499|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|192|0|502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|193|0|505|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$IDS_ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$IDS_ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@0|@519000|95000|0|0|0|0|10815|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|194|0|507|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|195|0|509|0|{@{}@384|.5|.5|{0|}10816|2065|}}
{2010202004|XXGiport|196|0|511|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|197|0|513|0|{@{}@384|.5|.5|{0|}10814|17|}}
{2010503005|XXGfvertex|198|0|515|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|199|0|517|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|200|0|520|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|201|0|525|0|{Subgraph created from graph "icff.maintenance"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[TRUNCATE_AND_LOAD_FLAG and DATASET_IDENTIFIER == "one"]|3|9|F||{0|}}
}}@0|@354000|580000|0|0|0|0|14307|Truncate & load|Manav Jindal|@1|100|-1|@9|@32833|{0|}0|0|{0|}{0|}{0|}{0|}1.0|572000|325000|3|}}
{2010240003|XXGlegend|202|0|527|0|{@{}@When TRUNCATE_AND_LOAD is set to true in load.icff pset,
then IDS file is not needed as CDC is happening with XREF. 
So files can be safely removed to recover space.

XREF is used to identify insert/updates and when TRUNCATE_AND_LOAD
flag is set to true, all the data irrespective of any updates is pushed to 
insert event file.|49000|40000|0|0|0|0|1|}}
{2010242002|XXGface|203|0|529|0|{@{}@Calibri|128|120|0|}}
{2010501005|XXGpvertex|204|0|531|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|m_rm -f -v $INPUT_FL $INPUT_IDX_FL|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
}}@2|Run Program|160000|195000|0|0|0|0|2|Remove IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|205|0|533|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|206|0|535|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|207|0|537|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Run Program|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|208|0|539|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|209|0|542|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010600005|XXGgraph|210|0|545|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@785000|120000|0|0|0|0|14300|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|821000|470000|3|}}
{2010240003|XXGlegend|211|0|547|0|{@{}@Version                Date                       Author                                        Description
1.0                11-Jan-2017            Mukesh Singh                    Initial Version
2.0               28-Feb-2018            Manav Jindal                     Added option to do fact xref maintanence
3.0               06-Mar-2018            Manav Jindal                    Added option for archive file maintenance,
                                                                                                         Collect all records in type2 file and also added
                                                                                                         option for type2 maintenance.|27000|56000|0|0|0|0|13715|}}
{2010242002|XXGface|212|0|549|0|{@{}@Calibri|8388608|110|0|}}
{2010240003|XXGlegend|213|0|551|0|{@{}@This Graph has an end Script which does  following things :|35000|240000|0|0|0|0|13711|}}
{2010242002|XXGface|214|0|553|0|{@{}@Arial Rounded MT Bold|128|120|0|}}
{2010240003|XXGlegend|215|0|555|0|{@{}@1. Creates file with new_ ,added in filename for data and index files
2. Rename Original data and index file as bkp_
3.Rename new_ file created as part of this run;  as main ids datasets.
4.Insert_entry into run_id_tracking file|66000|292000|0|0|0|0|13714|}}
{2010242002|XXGface|216|0|557|0|{@{}@Arial Rounded MT Bold|8421504|100|0|}}
{2010600005|XXGgraph|217|0|559|0|{Subgraph created from graph "icff.maintenance"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ 
if( DO_ARCHIVE_FL_MNTNCE )
        0
else if ( IDS_DS_ARCHIVE_FILTER_EXPR != ""  &&  not USE_XREF_FOR_CDC )
        1
else
        0
]|3|9|F||{0|}}
}}@0|@858500|561000|0|0|0|0|14251|Write IDS Archival Dataset|Mukesh.Singh|Created 4/28/2017 11:15:15 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|735000|315000|3|}}
{2010240003|XXGlegend|218|0|561|0|{@{}@Creates .new data and .idx files|-835000|-55000|0|0|0|0|10732|}}
{2010242002|XXGface|219|0|563|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|220|0|565|0|{@{}@384|.5|.5|{0|}10811|17|}}
{2010210004|XXGflow|221|0|569|0|{@{}@384|.5|.5|{0|}10805|17|}}
{2010503005|XXGfvertex|222|0|572|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$IDS_IDX_ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$IDS_IDX_ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@524000|245000|0|0|0|0|10806|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|223|0|574|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|224|0|577|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|225|0|579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|226|0|582|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@240000|125000|0|0|0|0|10801|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|227|0|584|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|228|0|587|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|229|0|590|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|230|0|592|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|231|0|595|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|232|0|597|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|233|0|600|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|234|0|603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|235|0|606|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|236|0|612|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|65000|148000|0|0|0|0|10812|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|237|0|614|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|238|0|617|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|239|0|619|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|240|0|621|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|241|0|624|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|242|0|630|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$IDS_ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$IDS_ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@1|@642000|95000|0|0|0|0|10817|View Data|Ab Initio Software|@1|1500|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|243|0|632|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|244|0|635|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|245|0|637|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|246|0|641|0|{@{}@0|0|0|0|in0|.5281501340482574|@@@13840|0|}}
{2010600005|XXGgraph|247|0|645|0|{Subgraph created from graph "icff.maintenance"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ 
if ( TRUNCATE_AND_LOAD_FLAG )
        0
else if ( not USE_XREF_FOR_CDC && not DO_ARCHIVE_FL_MNTNCE )
        1
else if ( DO_ARCHIVE_FL_MNTNCE && DATASET_IDENTIFIER != "many" )
        1
else if ( DO_MNTNCE_FACT_DATA_FL )
        1
else
        0
 ]|3|9|F||{0|}}
}}@0|@1040500|426000|0|0|0|0|14306|Write IDS Dataset|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|541000|373000|7|}}
{2010240003|XXGlegend|248|0|647|0|{@{}@Creates .new data and .idx files|-835000|-55000|0|0|0|0|10732|}}
{2010242002|XXGface|249|0|649|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|250|0|653|0|{@{}@384|.5|.5|{0|}10778|17|}}
{2010503005|XXGfvertex|251|0|656|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@0|@299000|230000|0|0|0|0|10779|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|252|0|658|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|253|0|661|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|254|0|663|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|255|0|666|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@40000|125000|0|0|0|0|10753|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|256|0|668|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|257|0|671|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|258|0|674|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|259|0|676|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|260|0|678|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|261|0|680|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|262|0|683|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|263|0|686|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|264|0|689|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|265|0|695|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$DML_FL|3|2|f$|@{0|}}
}}@1|@424000|85000|0|0|0|0|10745|View Data|Ab Initio Software|@1|1500|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|266|0|697|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|267|0|700|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|268|0|702|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|269|0|706|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|270|0|710|0|{Subgraph created from graph "icff.maintenance"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ 
if( DO_ARCHIVE_FL_MNTNCE )
        0
else if( IS_XREF_AN_ICFF=="Y" and not IDS_DATASET_IS_REDUCED )
        1
else
        0
]|3|9|F||{0|}}
}}@0|@331000|209000|0|0|0|0|14297|Write Xref Data & Idx|Mukesh.Singh|Created 7/14/2017 11:26:01 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|562000|344000|3|}}
{2010210004|XXGflow|271|0|714|0|{@{}@384|.5|.5|{0|}13190|17|}}
{2010503005|XXGfvertex|272|0|717|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_ICFF_XREF_IDX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_ICFF_XREF_IDX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@0|@314000|261000|0|0|0|0|13179|ICFF XREF-IDX|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|273|0|719|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|274|0|722|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|275|0|724|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|276|0|727|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|2048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@40000|116000|0|0|0|0|13191|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|277|0|729|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|278|0|732|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|279|0|735|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|280|0|737|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|281|0|739|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|282|0|741|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|283|0|744|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|284|0|747|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|285|0|750|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|286|0|756|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_ICFF_XREF_DATA_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_ICFF_XREF_DATA_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = xref_lookup_type;|3|1|l|@{0|}}
}}@1|@469000|81000|0|0|0|0|13188|View Data|Ab Initio Software|@1|1000|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|287|0|758|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|288|0|761|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|289|0|763|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|290|0|767|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010110002|XXGconstant|291|0|771|0|{@{}@{1|4246822|}}}
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
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_11|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_2|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_3|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_4|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_5|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_7|}1|17|}
{2010601001|XXGgraph_vertex_vertex|17|0|34|0|{Create_Audit_File|}1|18|}
{2010605001|XXGgraph_legend_legend|18|0|36|0|{0|}18|19|}
{2010241001|XXGlegend_face_face|19|0|38|0|{}19|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_1|}18|21|}
{2010601001|XXGgraph_vertex_vertex|21|0|42|0|{Audit_File|}18|22|}
{2010211001|XXGvertex_iport_iport|22|0|44|0|{0|write|}22|23|}
{2010214001|XXGiport_src_flow|23|0|46|0|{0|}23|21|}
{2010007001|XXGobject_proto_object|24|0|47|0|{}22|24|}
{2010211001|XXGvertex_iport_iport|25|0|49|0|{0|write|}24|25|}
{2010006001|XXGobject_psameas_object|26|0|51|0|{metadata|write_metadata|1|0|}25|24|}
{2010601001|XXGgraph_vertex_vertex|27|0|52|0|{Create_Audit_Information|}18|26|}
{2010212001|XXGvertex_oport_oport|28|0|54|0|{0|out|}26|27|}
{2010213001|XXGoport_dst_flow|29|0|56|0|{0|}27|21|}
{2010212001|XXGvertex_oport_oport|30|0|57|0|{1|error|}26|28|}
{2010212001|XXGvertex_oport_oport|31|0|59|0|{2|log|}26|29|}
{2010007001|XXGobject_proto_object|32|0|61|0|{}26|30|}
{2010212001|XXGvertex_oport_oport|33|0|63|0|{0|out|}30|31|}
{2010006001|XXGobject_psameas_object|34|0|65|0|{metadata|out_metadata|1|0|}31|30|}
{2010212001|XXGvertex_oport_oport|35|0|66|0|{1|error|}30|32|}
{2010006001|XXGobject_psameas_object|36|0|68|0|{metadata|error_metadata|1|0|}32|30|}
{2010212001|XXGvertex_oport_oport|37|0|69|0|{2|log|}30|33|}
{2010006001|XXGobject_psameas_object|38|0|71|0|{metadata|log_metadata|1|0|}33|30|}
{2010006001|XXGobject_psameas_object|39|0|72|0|{Layout|Layout|0|0|}26|22|}
{2010006001|XXGobject_psameas_object|40|0|73|0|{out_metadata|write_metadata|0|0|}26|22|}
{2010601001|XXGgraph_vertex_vertex|41|0|74|0|{Disabled_governance_component|}1|34|}
{2010604001|XXGgraph_flow_flow|42|0|76|0|{Flow_8|}34|35|}
{2010601001|XXGgraph_vertex_vertex|43|0|78|0|{Governance_Filter|}34|36|}
{2010212001|XXGvertex_oport_oport|44|0|80|0|{0|out|}36|37|}
{2010212001|XXGvertex_oport_oport|45|0|82|0|{1|deselect|}36|38|}
{2010213001|XXGoport_dst_flow|46|0|84|0|{0|}38|35|}
{2010212001|XXGvertex_oport_oport|47|0|85|0|{2|reject|}36|39|}
{2010212001|XXGvertex_oport_oport|48|0|87|0|{3|error|}36|40|}
{2010212001|XXGvertex_oport_oport|49|0|89|0|{4|log|}36|41|}
{2010211001|XXGvertex_iport_iport|50|0|91|0|{0|in|}36|42|}
{2010007001|XXGobject_proto_object|51|0|93|0|{}36|43|}
{2010212001|XXGvertex_oport_oport|52|0|95|0|{0|out|}43|44|}
{2010006001|XXGobject_psameas_object|53|0|97|0|{metadata|out_metadata|1|0|}44|43|}
{2010212001|XXGvertex_oport_oport|54|0|98|0|{1|deselect|}43|45|}
{2010006001|XXGobject_psameas_object|55|0|100|0|{metadata|deselect_metadata|1|0|}45|43|}
{2010212001|XXGvertex_oport_oport|56|0|101|0|{2|reject|}43|46|}
{2010006001|XXGobject_psameas_object|57|0|103|0|{metadata|reject_metadata|1|0|}46|43|}
{2010212001|XXGvertex_oport_oport|58|0|104|0|{3|error|}43|47|}
{2010006001|XXGobject_psameas_object|59|0|106|0|{metadata|error_metadata|1|0|}47|43|}
{2010212001|XXGvertex_oport_oport|60|0|107|0|{4|log|}43|48|}
{2010006001|XXGobject_psameas_object|61|0|109|0|{metadata|log_metadata|1|0|}48|43|}
{2010211001|XXGvertex_iport_iport|62|0|110|0|{0|in|}43|49|}
{2010006001|XXGobject_psameas_object|63|0|112|0|{metadata|in_metadata|1|0|}49|43|}
{2010006001|XXGobject_psameas_object|64|0|113|0|{Layout|Layout|0|0|}36|50|}
{2010212001|XXGvertex_oport_oport|65|0|115|0|{0|read|}50|51|}
{2010213001|XXGoport_dst_flow|66|0|117|0|{0|}51|52|}
{2010211001|XXGvertex_iport_iport|67|0|119|0|{0|write|}50|53|}
{2010214001|XXGiport_src_flow|68|0|121|0|{0|}53|54|}
{2010007001|XXGobject_proto_object|69|0|123|0|{}50|55|}
{2010212001|XXGvertex_oport_oport|70|0|125|0|{0|read|}55|56|}
{2010006001|XXGobject_psameas_object|71|0|127|0|{metadata|read_metadata|1|0|}56|55|}
{2010211001|XXGvertex_iport_iport|72|0|128|0|{0|write|}55|57|}
{2010006001|XXGobject_psameas_object|73|0|130|0|{metadata|write_metadata|1|0|}57|55|}
{2010601001|XXGgraph_vertex_vertex|74|0|131|0|{Trash|}34|58|}
{2010211001|XXGvertex_iport_iport|75|0|133|0|{0|in|}58|59|}
{2010214001|XXGiport_src_flow|76|0|135|0|{0|}59|35|}
{2010007001|XXGobject_proto_object|77|0|136|0|{}58|60|}
{2010211001|XXGvertex_iport_iport|78|0|138|0|{0|in|}60|61|}
{2010006001|XXGobject_psameas_object|79|0|140|0|{metadata|in_metadata|1|0|}61|60|}
{2010601001|XXGgraph_vertex_vertex|80|0|141|0|{Load_ICFF_Filter|}1|62|}
{2010212001|XXGvertex_oport_oport|81|0|143|0|{0|out|}62|63|}
{2010213001|XXGoport_dst_flow|82|0|145|0|{0|}63|15|}
{2010212001|XXGvertex_oport_oport|83|0|146|0|{1|deselect|}62|64|}
{2010213001|XXGoport_dst_flow|84|0|148|0|{0|}64|14|}
{2010212001|XXGvertex_oport_oport|85|0|149|0|{2|reject|}62|65|}
{2010212001|XXGvertex_oport_oport|86|0|151|0|{3|error|}62|66|}
{2010212001|XXGvertex_oport_oport|87|0|153|0|{4|log|}62|67|}
{2010211001|XXGvertex_iport_iport|88|0|155|0|{0|in|}62|68|}
{2010214001|XXGiport_src_flow|89|0|157|0|{0|}68|16|}
{2010007001|XXGobject_proto_object|90|0|158|0|{}62|69|}
{2010212001|XXGvertex_oport_oport|91|0|160|0|{0|out|}69|70|}
{2010006001|XXGobject_psameas_object|92|0|162|0|{metadata|out_metadata|1|0|}70|69|}
{2010212001|XXGvertex_oport_oport|93|0|163|0|{1|deselect|}69|71|}
{2010006001|XXGobject_psameas_object|94|0|165|0|{metadata|deselect_metadata|1|0|}71|69|}
{2010212001|XXGvertex_oport_oport|95|0|166|0|{2|reject|}69|72|}
{2010006001|XXGobject_psameas_object|96|0|168|0|{metadata|reject_metadata|1|0|}72|69|}
{2010212001|XXGvertex_oport_oport|97|0|169|0|{3|error|}69|73|}
{2010006001|XXGobject_psameas_object|98|0|171|0|{metadata|error_metadata|1|0|}73|69|}
{2010212001|XXGvertex_oport_oport|99|0|172|0|{4|log|}69|74|}
{2010006001|XXGobject_psameas_object|100|0|174|0|{metadata|log_metadata|1|0|}74|69|}
{2010211001|XXGvertex_iport_iport|101|0|175|0|{0|in|}69|75|}
{2010006001|XXGobject_psameas_object|102|0|177|0|{metadata|in_metadata|1|0|}75|69|}
{2010006001|XXGobject_psameas_object|103|0|178|0|{Layout|Layout|0|0|}62|50|}
{2010006001|XXGobject_psameas_object|104|0|179|0|{deselect_metadata|out_metadata|0|0|}62|76|}
{2010212001|XXGvertex_oport_oport|105|0|181|0|{0|out|}76|77|}
{2010212001|XXGvertex_oport_oport|106|0|183|0|{1|filereject|}76|78|}
{2010212001|XXGvertex_oport_oport|107|0|185|0|{2|fileerror|}76|79|}
{2010212001|XXGvertex_oport_oport|108|0|187|0|{3|reject|}76|80|}
{2010212001|XXGvertex_oport_oport|109|0|189|0|{4|error|}76|81|}
{2010212001|XXGvertex_oport_oport|110|0|191|0|{5|log|}76|82|}
{2010211001|XXGvertex_iport_iport|111|0|193|0|{0|in|}76|83|}
{2010214001|XXGiport_src_flow|112|0|195|0|{0|}83|84|}
{2010007001|XXGobject_proto_object|113|0|197|0|{}76|85|}
{2010212001|XXGvertex_oport_oport|114|0|199|0|{0|out|}85|86|}
{2010006001|XXGobject_psameas_object|115|0|201|0|{metadata|out_metadata|1|0|}86|85|}
{2010212001|XXGvertex_oport_oport|116|0|202|0|{1|filereject|}85|87|}
{2010006001|XXGobject_psameas_object|117|0|204|0|{metadata|filereject_metadata|1|0|}87|85|}
{2010212001|XXGvertex_oport_oport|118|0|205|0|{2|fileerror|}85|88|}
{2010006001|XXGobject_psameas_object|119|0|207|0|{metadata|fileerror_metadata|1|0|}88|85|}
{2010212001|XXGvertex_oport_oport|120|0|208|0|{3|reject|}85|89|}
{2010006001|XXGobject_psameas_object|121|0|210|0|{metadata|reject_metadata|1|0|}89|85|}
{2010212001|XXGvertex_oport_oport|122|0|211|0|{4|error|}85|90|}
{2010006001|XXGobject_psameas_object|123|0|213|0|{metadata|error_metadata|1|0|}90|85|}
{2010212001|XXGvertex_oport_oport|124|0|214|0|{5|log|}85|91|}
{2010006001|XXGobject_psameas_object|125|0|216|0|{metadata|log_metadata|1|0|}91|85|}
{2010211001|XXGvertex_iport_iport|126|0|217|0|{0|in|}85|92|}
{2010006001|XXGobject_psameas_object|127|0|219|0|{metadata|in_metadata|1|0|}92|85|}
{2010006001|XXGobject_psameas_object|128|0|220|0|{Layout|Layout|0|0|}76|50|}
{2010006001|XXGobject_psameas_object|129|0|221|0|{filereject_metadata|out_metadata|0|0|}76|93|}
{2010212001|XXGvertex_oport_oport|130|0|223|0|{0|out|}93|94|}
{2010213001|XXGoport_dst_flow|131|0|225|0|{0|}94|95|}
{2010212001|XXGvertex_oport_oport|132|0|227|0|{1|error|}93|96|}
{2010212001|XXGvertex_oport_oport|133|0|229|0|{2|log|}93|97|}
{2010007001|XXGobject_proto_object|134|0|231|0|{}93|98|}
{2010212001|XXGvertex_oport_oport|135|0|233|0|{0|out|}98|99|}
{2010006001|XXGobject_psameas_object|136|0|235|0|{metadata|out_metadata|1|0|}99|98|}
{2010212001|XXGvertex_oport_oport|137|0|236|0|{1|error|}98|100|}
{2010006001|XXGobject_psameas_object|138|0|238|0|{metadata|error_metadata|1|0|}100|98|}
{2010212001|XXGvertex_oport_oport|139|0|239|0|{2|log|}98|101|}
{2010006001|XXGobject_psameas_object|140|0|241|0|{metadata|log_metadata|1|0|}101|98|}
{2010006001|XXGobject_psameas_object|141|0|242|0|{in_metadata|out_metadata|0|0|}76|93|}
{2010006001|XXGobject_psameas_object|142|0|243|0|{in_metadata|out_metadata|0|0|}62|76|}
{2010006001|XXGobject_psameas_object|143|0|244|0|{out_metadata|out_metadata|0|0|}62|76|}
{2010006001|XXGobject_psameas_object|144|0|245|0|{reject_metadata|out_metadata|0|0|}62|76|}
{2010601001|XXGgraph_vertex_vertex|145|0|246|0|{Read_Main_ids|}1|102|}
{2010604001|XXGgraph_flow_flow|146|0|248|0|{Flow_1|}102|84|}
{2010604001|XXGgraph_flow_flow|147|0|249|0|{Flow_12|}102|95|}
{2010601001|XXGgraph_vertex_vertex|148|0|250|0|{Broadcast|}102|103|}
{2010212001|XXGvertex_oport_oport|149|0|252|0|{0|out|}103|104|}
{2010213001|XXGoport_dst_flow|150|0|254|0|{0|}104|84|}
{2010211001|XXGvertex_iport_iport|151|0|255|0|{0|in|}103|105|}
{2010214001|XXGiport_src_flow|152|0|257|0|{0|}105|95|}
{2010007001|XXGobject_proto_object|153|0|258|0|{}103|106|}
{2010212001|XXGvertex_oport_oport|154|0|260|0|{0|out|}106|107|}
{2010006001|XXGobject_psameas_object|155|0|262|0|{metadata|out_metadata|1|0|}107|106|}
{2010211001|XXGvertex_iport_iport|156|0|263|0|{0|in|}106|108|}
{2010006001|XXGobject_psameas_object|157|0|265|0|{metadata|in_metadata|1|0|}108|106|}
{2010006001|XXGobject_psameas_object|158|0|266|0|{Layout|Layout|0|0|}103|93|}
{2010006001|XXGobject_psameas_object|159|0|267|0|{in_metadata|out_metadata|0|0|}103|93|}
{2010006001|XXGobject_psameas_object|160|0|268|0|{out_metadata|out_metadata|0|0|}103|93|}
{2010601001|XXGgraph_vertex_vertex|161|0|269|0|{Merge_Main_IDS|}102|76|}
{2010601001|XXGgraph_vertex_vertex|162|0|270|0|{Send_IDS_FL|}102|93|}
{2010212001|XXGvertex_oport_oport|163|0|271|0|{0|out0|}102|109|}
{2010216002|XXGoport_binding_oport|164|0|273|0|{.5|.5|{0|}13637|}109|77|}
{2010213001|XXGoport_dst_flow|165|0|274|0|{0|}109|13|}
{2010601001|XXGgraph_vertex_vertex|166|0|275|0|{Read_Xref|}1|110|}
{2010604001|XXGgraph_flow_flow|167|0|277|0|{Flow_1|}110|111|}
{2010604001|XXGgraph_flow_flow|168|0|279|0|{Flow_12|}110|112|}
{2010601001|XXGgraph_vertex_vertex|169|0|281|0|{Broadcast|}110|113|}
{2010212001|XXGvertex_oport_oport|170|0|283|0|{0|out|}113|114|}
{2010213001|XXGoport_dst_flow|171|0|285|0|{0|}114|111|}
{2010211001|XXGvertex_iport_iport|172|0|286|0|{0|in|}113|115|}
{2010214001|XXGiport_src_flow|173|0|288|0|{0|}115|112|}
{2010007001|XXGobject_proto_object|174|0|289|0|{}113|116|}
{2010212001|XXGvertex_oport_oport|175|0|291|0|{0|out|}116|117|}
{2010006001|XXGobject_psameas_object|176|0|293|0|{metadata|out_metadata|1|0|}117|116|}
{2010211001|XXGvertex_iport_iport|177|0|294|0|{0|in|}116|118|}
{2010006001|XXGobject_psameas_object|178|0|296|0|{metadata|in_metadata|1|0|}118|116|}
{2010006001|XXGobject_psameas_object|179|0|297|0|{Layout|Layout|0|0|}113|119|}
{2010212001|XXGvertex_oport_oport|180|0|299|0|{0|out|}119|120|}
{2010213001|XXGoport_dst_flow|181|0|301|0|{0|}120|112|}
{2010212001|XXGvertex_oport_oport|182|0|302|0|{1|error|}119|121|}
{2010212001|XXGvertex_oport_oport|183|0|304|0|{2|log|}119|122|}
{2010007001|XXGobject_proto_object|184|0|306|0|{}119|123|}
{2010212001|XXGvertex_oport_oport|185|0|308|0|{0|out|}123|124|}
{2010006001|XXGobject_psameas_object|186|0|310|0|{metadata|out_metadata|1|0|}124|123|}
{2010212001|XXGvertex_oport_oport|187|0|311|0|{1|error|}123|125|}
{2010006001|XXGobject_psameas_object|188|0|313|0|{metadata|error_metadata|1|0|}125|123|}
{2010212001|XXGvertex_oport_oport|189|0|314|0|{2|log|}123|126|}
{2010006001|XXGobject_psameas_object|190|0|316|0|{metadata|log_metadata|1|0|}126|123|}
{2010006001|XXGobject_psameas_object|191|0|317|0|{in_metadata|out_metadata|0|0|}113|119|}
{2010006001|XXGobject_psameas_object|192|0|318|0|{out_metadata|out_metadata|0|0|}113|119|}
{2010601001|XXGgraph_vertex_vertex|193|0|319|0|{Merge_Multiple_Block_Compressed_Data|}110|127|}
{2010212001|XXGvertex_oport_oport|194|0|321|0|{0|out|}127|128|}
{2010212001|XXGvertex_oport_oport|195|0|323|0|{1|filereject|}127|129|}
{2010212001|XXGvertex_oport_oport|196|0|325|0|{2|fileerror|}127|130|}
{2010212001|XXGvertex_oport_oport|197|0|327|0|{3|reject|}127|131|}
{2010212001|XXGvertex_oport_oport|198|0|329|0|{4|error|}127|132|}
{2010212001|XXGvertex_oport_oport|199|0|331|0|{5|log|}127|133|}
{2010211001|XXGvertex_iport_iport|200|0|333|0|{0|in|}127|134|}
{2010214001|XXGiport_src_flow|201|0|335|0|{0|}134|111|}
{2010007001|XXGobject_proto_object|202|0|336|0|{}127|135|}
{2010212001|XXGvertex_oport_oport|203|0|338|0|{0|out|}135|136|}
{2010006001|XXGobject_psameas_object|204|0|340|0|{metadata|out_metadata|1|0|}136|135|}
{2010212001|XXGvertex_oport_oport|205|0|341|0|{1|filereject|}135|137|}
{2010006001|XXGobject_psameas_object|206|0|343|0|{metadata|filereject_metadata|1|0|}137|135|}
{2010212001|XXGvertex_oport_oport|207|0|344|0|{2|fileerror|}135|138|}
{2010006001|XXGobject_psameas_object|208|0|346|0|{metadata|fileerror_metadata|1|0|}138|135|}
{2010212001|XXGvertex_oport_oport|209|0|347|0|{3|reject|}135|139|}
{2010006001|XXGobject_psameas_object|210|0|349|0|{metadata|reject_metadata|1|0|}139|135|}
{2010212001|XXGvertex_oport_oport|211|0|350|0|{4|error|}135|140|}
{2010006001|XXGobject_psameas_object|212|0|352|0|{metadata|error_metadata|1|0|}140|135|}
{2010212001|XXGvertex_oport_oport|213|0|353|0|{5|log|}135|141|}
{2010006001|XXGobject_psameas_object|214|0|355|0|{metadata|log_metadata|1|0|}141|135|}
{2010211001|XXGvertex_iport_iport|215|0|356|0|{0|in|}135|142|}
{2010006001|XXGobject_psameas_object|216|0|358|0|{metadata|in_metadata|1|0|}142|135|}
{2010006001|XXGobject_psameas_object|217|0|359|0|{Layout|Layout|0|0|}127|143|}
{2010212001|XXGvertex_oport_oport|218|0|361|0|{0|read|}143|144|}
{2010213001|XXGoport_dst_flow|219|0|363|0|{0|}144|145|}
{2010211001|XXGvertex_iport_iport|220|0|365|0|{0|write|}143|146|}
{2010214001|XXGiport_src_flow|221|0|367|0|{0|}146|147|}
{2010007001|XXGobject_proto_object|222|0|369|0|{}143|148|}
{2010212001|XXGvertex_oport_oport|223|0|371|0|{0|read|}148|149|}
{2010006001|XXGobject_psameas_object|224|0|373|0|{metadata|read_metadata|1|0|}149|148|}
{2010211001|XXGvertex_iport_iport|225|0|374|0|{0|write|}148|150|}
{2010006001|XXGobject_psameas_object|226|0|376|0|{metadata|write_metadata|1|0|}150|148|}
{2010006001|XXGobject_psameas_object|227|0|377|0|{filereject_metadata|out_metadata|0|0|}127|119|}
{2010006001|XXGobject_psameas_object|228|0|378|0|{in_metadata|out_metadata|0|0|}127|119|}
{2010601001|XXGgraph_vertex_vertex|229|0|379|0|{Send_XREF_FL|}110|119|}
{2010212001|XXGvertex_oport_oport|230|0|380|0|{0|out0|}110|151|}
{2010216002|XXGoport_binding_oport|231|0|382|0|{.5|.5|{0|}13619|}151|128|}
{2010213001|XXGoport_dst_flow|232|0|383|0|{0|}151|11|}
{2010601001|XXGgraph_vertex_vertex|233|0|384|0|{Remove_Duplicates|}1|152|}
{2010604001|XXGgraph_flow_flow|234|0|386|0|{Flow_1|}152|153|}
{2010604001|XXGgraph_flow_flow|235|0|388|0|{Flow_2|}152|154|}
{2010601001|XXGgraph_vertex_vertex|236|0|390|0|{Dedup_Sorted|}152|155|}
{2010212001|XXGvertex_oport_oport|237|0|392|0|{0|out|}155|156|}
{2010212001|XXGvertex_oport_oport|238|0|394|0|{1|dup|}155|157|}
{2010213001|XXGoport_dst_flow|239|0|396|0|{0|}157|153|}
{2010212001|XXGvertex_oport_oport|240|0|397|0|{2|reject|}155|158|}
{2010212001|XXGvertex_oport_oport|241|0|399|0|{3|error|}155|159|}
{2010212001|XXGvertex_oport_oport|242|0|401|0|{4|log|}155|160|}
{2010211001|XXGvertex_iport_iport|243|0|403|0|{0|in|}155|161|}
{2010214001|XXGiport_src_flow|244|0|405|0|{0|}161|154|}
{2010007001|XXGobject_proto_object|245|0|406|0|{}155|162|}
{2010212001|XXGvertex_oport_oport|246|0|408|0|{0|out|}162|163|}
{2010006001|XXGobject_psameas_object|247|0|410|0|{metadata|out_metadata|1|0|}163|162|}
{2010212001|XXGvertex_oport_oport|248|0|411|0|{1|dup|}162|164|}
{2010006001|XXGobject_psameas_object|249|0|413|0|{metadata|dup_metadata|1|0|}164|162|}
{2010212001|XXGvertex_oport_oport|250|0|414|0|{2|reject|}162|165|}
{2010006001|XXGobject_psameas_object|251|0|416|0|{metadata|reject_metadata|1|0|}165|162|}
{2010212001|XXGvertex_oport_oport|252|0|417|0|{3|error|}162|166|}
{2010006001|XXGobject_psameas_object|253|0|419|0|{metadata|error_metadata|1|0|}166|162|}
{2010212001|XXGvertex_oport_oport|254|0|420|0|{4|log|}162|167|}
{2010006001|XXGobject_psameas_object|255|0|422|0|{metadata|log_metadata|1|0|}167|162|}
{2010211001|XXGvertex_iport_iport|256|0|423|0|{0|in|}162|168|}
{2010006001|XXGobject_psameas_object|257|0|425|0|{metadata|in_metadata|1|0|}168|162|}
{2010006001|XXGobject_psameas_object|258|0|426|0|{Layout|Layout|0|0|}155|50|}
{2010006001|XXGobject_psameas_object|259|0|427|0|{dup_metadata|out_metadata|0|0|}155|76|}
{2010006001|XXGobject_psameas_object|260|0|428|0|{in_metadata|out_metadata|0|0|}155|76|}
{2010006001|XXGobject_psameas_object|261|0|429|0|{out_metadata|out_metadata|0|0|}155|76|}
{2010006001|XXGobject_psameas_object|262|0|430|0|{reject_metadata|out_metadata|0|0|}155|76|}
{2010601001|XXGgraph_vertex_vertex|263|0|431|0|{Sort_within_Groups|}152|169|}
{2010212001|XXGvertex_oport_oport|264|0|433|0|{0|out|}169|170|}
{2010213001|XXGoport_dst_flow|265|0|435|0|{0|}170|154|}
{2010211001|XXGvertex_iport_iport|266|0|436|0|{0|in|}169|171|}
{2010007001|XXGobject_proto_object|267|0|438|0|{}169|172|}
{2010212001|XXGvertex_oport_oport|268|0|440|0|{0|out|}172|173|}
{2010006001|XXGobject_psameas_object|269|0|442|0|{metadata|out_metadata|1|0|}173|172|}
{2010211001|XXGvertex_iport_iport|270|0|443|0|{0|in|}172|174|}
{2010006001|XXGobject_psameas_object|271|0|445|0|{metadata|in_metadata|1|0|}174|172|}
{2010006001|XXGobject_psameas_object|272|0|446|0|{Layout|Layout|0|0|}169|50|}
{2010006001|XXGobject_psameas_object|273|0|447|0|{in_metadata|out_metadata|0|0|}169|76|}
{2010006001|XXGobject_psameas_object|274|0|448|0|{out_metadata|out_metadata|0|0|}169|76|}
{2010601001|XXGgraph_vertex_vertex|275|0|449|0|{Trash|}152|175|}
{2010211001|XXGvertex_iport_iport|276|0|451|0|{0|in|}175|176|}
{2010214001|XXGiport_src_flow|277|0|453|0|{0|}176|153|}
{2010007001|XXGobject_proto_object|278|0|454|0|{}175|177|}
{2010211001|XXGvertex_iport_iport|279|0|456|0|{0|in|}177|178|}
{2010006001|XXGobject_psameas_object|280|0|458|0|{metadata|in_metadata|1|0|}178|177|}
{2010006001|XXGobject_psameas_object|281|0|459|0|{Layout|Layout|0|0|}175|50|}
{2010006001|XXGobject_psameas_object|282|0|460|0|{in_metadata|out_metadata|0|0|}175|76|}
{2010212001|XXGvertex_oport_oport|283|0|461|0|{0|out0|}152|179|}
{2010216002|XXGoport_binding_oport|284|0|463|0|{.5|.5|{0|}10821|}179|156|}
{2010213001|XXGoport_dst_flow|285|0|464|0|{0|}179|16|}
{2010211001|XXGvertex_iport_iport|286|0|465|0|{0|in0|}152|180|}
{2010215002|XXGiport_binding_iport|287|0|467|0|{.5|.5|{0|}10820|}180|171|}
{2010214001|XXGiport_src_flow|288|0|468|0|{0|}180|13|}
{2010601001|XXGgraph_vertex_vertex|289|0|469|0|{SRT_Data|}1|181|}
{2010212001|XXGvertex_oport_oport|290|0|471|0|{0|out|}181|182|}
{2010213001|XXGoport_dst_flow|291|0|473|0|{0|}182|17|}
{2010211001|XXGvertex_iport_iport|292|0|474|0|{0|in|}181|183|}
{2010214001|XXGiport_src_flow|293|0|476|0|{0|}183|15|}
{2010007001|XXGobject_proto_object|294|0|477|0|{}181|184|}
{2010212001|XXGvertex_oport_oport|295|0|479|0|{0|out|}184|185|}
{2010006001|XXGobject_psameas_object|296|0|481|0|{metadata|out_metadata|1|0|}185|184|}
{2010211001|XXGvertex_iport_iport|297|0|482|0|{0|in|}184|186|}
{2010006001|XXGobject_psameas_object|298|0|484|0|{metadata|in_metadata|1|0|}186|184|}
{2010006001|XXGobject_psameas_object|299|0|485|0|{Layout|Layout|0|0|}181|50|}
{2010006001|XXGobject_psameas_object|300|0|486|0|{in_metadata|out_metadata|0|0|}181|76|}
{2010006001|XXGobject_psameas_object|301|0|487|0|{out_metadata|out_metadata|0|0|}181|76|}
{2010601001|XXGgraph_vertex_vertex|302|0|488|0|{Send_Main_IDS_Data|}1|187|}
{2010212001|XXGvertex_oport_oport|303|0|490|0|{0|out|}187|188|}
{2010213001|XXGoport_dst_flow|304|0|492|0|{0|}188|12|}
{2010211001|XXGvertex_iport_iport|305|0|493|0|{0|in|}187|189|}
{2010214001|XXGiport_src_flow|306|0|495|0|{0|}189|14|}
{2010007001|XXGobject_proto_object|307|0|496|0|{}187|190|}
{2010212001|XXGvertex_oport_oport|308|0|498|0|{0|out|}190|191|}
{2010006001|XXGobject_psameas_object|309|0|500|0|{metadata|out_metadata|1|0|}191|190|}
{2010211001|XXGvertex_iport_iport|310|0|501|0|{0|in|}190|192|}
{2010006001|XXGobject_psameas_object|311|0|503|0|{metadata|in_metadata|1|0|}192|190|}
{2010006001|XXGobject_psameas_object|312|0|504|0|{Layout|Layout|0|0|}187|193|}
{2010212001|XXGvertex_oport_oport|313|0|506|0|{0|read|}193|194|}
{2010213001|XXGoport_dst_flow|314|0|508|0|{0|}194|195|}
{2010211001|XXGvertex_iport_iport|315|0|510|0|{0|write|}193|196|}
{2010214001|XXGiport_src_flow|316|0|512|0|{0|}196|197|}
{2010007001|XXGobject_proto_object|317|0|514|0|{}193|198|}
{2010212001|XXGvertex_oport_oport|318|0|516|0|{0|read|}198|199|}
{2010006001|XXGobject_psameas_object|319|0|518|0|{metadata|read_metadata|1|0|}199|198|}
{2010211001|XXGvertex_iport_iport|320|0|519|0|{0|write|}198|200|}
{2010006001|XXGobject_psameas_object|321|0|521|0|{metadata|write_metadata|1|0|}200|198|}
{2010006001|XXGobject_psameas_object|322|0|522|0|{in_metadata|out_metadata|0|0|}187|76|}
{2010006001|XXGobject_psameas_object|323|0|523|0|{out_metadata|out_metadata|0|0|}187|76|}
{2010601001|XXGgraph_vertex_vertex|324|0|524|0|{Truncate_load|}1|201|}
{2010605001|XXGgraph_legend_legend|325|0|526|0|{0|}201|202|}
{2010241001|XXGlegend_face_face|326|0|528|0|{}202|203|}
{2010601001|XXGgraph_vertex_vertex|327|0|530|0|{Remove_IDS|}201|204|}
{2010212001|XXGvertex_oport_oport|328|0|532|0|{0|out|}204|205|}
{2010211001|XXGvertex_iport_iport|329|0|534|0|{0|in|}204|206|}
{2010007001|XXGobject_proto_object|330|0|536|0|{}204|207|}
{2010212001|XXGvertex_oport_oport|331|0|538|0|{0|out|}207|208|}
{2010006001|XXGobject_psameas_object|332|0|540|0|{metadata|out_metadata|1|0|}208|207|}
{2010211001|XXGvertex_iport_iport|333|0|541|0|{0|in|}207|209|}
{2010006001|XXGobject_psameas_object|334|0|543|0|{metadata|in_metadata|1|0|}209|207|}
{2010601001|XXGgraph_vertex_vertex|335|0|544|0|{Version_Log|}1|210|}
{2010605001|XXGgraph_legend_legend|336|0|546|0|{0|}210|211|}
{2010241001|XXGlegend_face_face|337|0|548|0|{}211|212|}
{2010605001|XXGgraph_legend_legend|338|0|550|0|{1|}210|213|}
{2010241001|XXGlegend_face_face|339|0|552|0|{}213|214|}
{2010605001|XXGgraph_legend_legend|340|0|554|0|{2|}210|215|}
{2010241001|XXGlegend_face_face|341|0|556|0|{}215|216|}
{2010601001|XXGgraph_vertex_vertex|342|0|558|0|{Write_IDS_Archival_Dataset|}1|217|}
{2010605001|XXGgraph_legend_legend|343|0|560|0|{0|}217|218|}
{2010241001|XXGlegend_face_face|344|0|562|0|{}218|219|}
{2010604001|XXGgraph_flow_flow|345|0|564|0|{Flow_1|}217|220|}
{2010604001|XXGgraph_flow_flow|346|0|566|0|{Flow_2|}217|195|}
{2010604001|XXGgraph_flow_flow|347|0|567|0|{Flow_6|}217|197|}
{2010604001|XXGgraph_flow_flow|348|0|568|0|{Flow_7|}217|221|}
{2010601001|XXGgraph_vertex_vertex|349|0|570|0|{IDS_ICFF|}217|193|}
{2010601001|XXGgraph_vertex_vertex|350|0|571|0|{IDS_Index_File|}217|222|}
{2010211001|XXGvertex_iport_iport|351|0|573|0|{0|write|}222|223|}
{2010214001|XXGiport_src_flow|352|0|575|0|{0|}223|221|}
{2010007001|XXGobject_proto_object|353|0|576|0|{}222|224|}
{2010211001|XXGvertex_iport_iport|354|0|578|0|{0|write|}224|225|}
{2010006001|XXGobject_psameas_object|355|0|580|0|{metadata|write_metadata|1|0|}225|224|}
{2010006001|XXGobject_psameas_object|356|0|581|0|{write_metadata|index_metadata|0|0|}222|226|}
{2010212001|XXGvertex_oport_oport|357|0|583|0|{0|out|}226|227|}
{2010213001|XXGoport_dst_flow|358|0|585|0|{0|}227|197|}
{2010212001|XXGvertex_oport_oport|359|0|586|0|{1|index|}226|228|}
{2010213001|XXGoport_dst_flow|360|0|588|0|{0|}228|221|}
{2010212001|XXGvertex_oport_oport|361|0|589|0|{2|address|}226|229|}
{2010211001|XXGvertex_iport_iport|362|0|591|0|{0|in|}226|230|}
{2010214001|XXGiport_src_flow|363|0|593|0|{0|}230|220|}
{2010007001|XXGobject_proto_object|364|0|594|0|{}226|231|}
{2010212001|XXGvertex_oport_oport|365|0|596|0|{0|out|}231|232|}
{2010006001|XXGobject_psameas_object|366|0|598|0|{metadata|out_metadata|1|0|}232|231|}
{2010212001|XXGvertex_oport_oport|367|0|599|0|{1|index|}231|233|}
{2010006001|XXGobject_psameas_object|368|0|601|0|{metadata|index_metadata|1|0|}233|231|}
{2010212001|XXGvertex_oport_oport|369|0|602|0|{2|address|}231|234|}
{2010006001|XXGobject_psameas_object|370|0|604|0|{metadata|address_metadata|1|0|}234|231|}
{2010211001|XXGvertex_iport_iport|371|0|605|0|{0|in|}231|235|}
{2010006001|XXGobject_psameas_object|372|0|607|0|{metadata|in_metadata|1|0|}235|231|}
{2010006001|XXGobject_psameas_object|373|0|608|0|{Layout|Layout|0|0|}226|193|}
{2010006001|XXGobject_psameas_object|374|0|609|0|{in_metadata|out_metadata|0|0|}226|76|}
{2010006001|XXGobject_psameas_object|375|0|610|0|{out_metadata|write_metadata|0|0|}226|193|}
{2010601001|XXGgraph_vertex_vertex|376|0|611|0|{Sort|}217|236|}
{2010212001|XXGvertex_oport_oport|377|0|613|0|{0|out|}236|237|}
{2010213001|XXGoport_dst_flow|378|0|615|0|{0|}237|220|}
{2010211001|XXGvertex_iport_iport|379|0|616|0|{0|in|}236|238|}
{2010007001|XXGobject_proto_object|380|0|618|0|{}236|239|}
{2010212001|XXGvertex_oport_oport|381|0|620|0|{0|out|}239|240|}
{2010006001|XXGobject_psameas_object|382|0|622|0|{metadata|out_metadata|1|0|}240|239|}
{2010211001|XXGvertex_iport_iport|383|0|623|0|{0|in|}239|241|}
{2010006001|XXGobject_psameas_object|384|0|625|0|{metadata|in_metadata|1|0|}241|239|}
{2010006001|XXGobject_psameas_object|385|0|626|0|{Layout|Layout|0|0|}236|193|}
{2010006001|XXGobject_psameas_object|386|0|627|0|{in_metadata|out_metadata|0|0|}236|76|}
{2010006001|XXGobject_psameas_object|387|0|628|0|{out_metadata|out_metadata|0|0|}236|76|}
{2010601001|XXGgraph_vertex_vertex|388|0|629|0|{View_Data|}217|242|}
{2010211001|XXGvertex_iport_iport|389|0|631|0|{0|write|}242|243|}
{2010214001|XXGiport_src_flow|390|0|633|0|{0|}243|195|}
{2010007001|XXGobject_proto_object|391|0|634|0|{}242|244|}
{2010211001|XXGvertex_iport_iport|392|0|636|0|{0|write|}244|245|}
{2010006001|XXGobject_psameas_object|393|0|638|0|{metadata|write_metadata|1|0|}245|244|}
{2010601001|XXGgraph_vertex_vertex|394|0|639|0|{Write_Block_Compressed_Lookup|}217|226|}
{2010211001|XXGvertex_iport_iport|395|0|640|0|{0|in0|}217|246|}
{2010215002|XXGiport_binding_iport|396|0|642|0|{.5|.5|{0|}10818|}246|238|}
{2010214001|XXGiport_src_flow|397|0|643|0|{0|}246|12|}
{2010601001|XXGgraph_vertex_vertex|398|0|644|0|{Write_IDS_Dataset|}1|247|}
{2010605001|XXGgraph_legend_legend|399|0|646|0|{0|}247|248|}
{2010241001|XXGlegend_face_face|400|0|648|0|{}248|249|}
{2010604001|XXGgraph_flow_flow|401|0|650|0|{Flow_2|}247|52|}
{2010604001|XXGgraph_flow_flow|402|0|651|0|{Flow_6|}247|54|}
{2010604001|XXGgraph_flow_flow|403|0|652|0|{Flow_7|}247|250|}
{2010601001|XXGgraph_vertex_vertex|404|0|654|0|{IDS_ICFF|}247|50|}
{2010601001|XXGgraph_vertex_vertex|405|0|655|0|{IDS_Index_File|}247|251|}
{2010211001|XXGvertex_iport_iport|406|0|657|0|{0|write|}251|252|}
{2010214001|XXGiport_src_flow|407|0|659|0|{0|}252|250|}
{2010007001|XXGobject_proto_object|408|0|660|0|{}251|253|}
{2010211001|XXGvertex_iport_iport|409|0|662|0|{0|write|}253|254|}
{2010006001|XXGobject_psameas_object|410|0|664|0|{metadata|write_metadata|1|0|}254|253|}
{2010006001|XXGobject_psameas_object|411|0|665|0|{write_metadata|index_metadata|0|0|}251|255|}
{2010212001|XXGvertex_oport_oport|412|0|667|0|{0|out|}255|256|}
{2010213001|XXGoport_dst_flow|413|0|669|0|{0|}256|54|}
{2010212001|XXGvertex_oport_oport|414|0|670|0|{1|index|}255|257|}
{2010213001|XXGoport_dst_flow|415|0|672|0|{0|}257|250|}
{2010212001|XXGvertex_oport_oport|416|0|673|0|{2|address|}255|258|}
{2010211001|XXGvertex_iport_iport|417|0|675|0|{0|in|}255|259|}
{2010007001|XXGobject_proto_object|418|0|677|0|{}255|260|}
{2010212001|XXGvertex_oport_oport|419|0|679|0|{0|out|}260|261|}
{2010006001|XXGobject_psameas_object|420|0|681|0|{metadata|out_metadata|1|0|}261|260|}
{2010212001|XXGvertex_oport_oport|421|0|682|0|{1|index|}260|262|}
{2010006001|XXGobject_psameas_object|422|0|684|0|{metadata|index_metadata|1|0|}262|260|}
{2010212001|XXGvertex_oport_oport|423|0|685|0|{2|address|}260|263|}
{2010006001|XXGobject_psameas_object|424|0|687|0|{metadata|address_metadata|1|0|}263|260|}
{2010211001|XXGvertex_iport_iport|425|0|688|0|{0|in|}260|264|}
{2010006001|XXGobject_psameas_object|426|0|690|0|{metadata|in_metadata|1|0|}264|260|}
{2010006001|XXGobject_psameas_object|427|0|691|0|{Layout|Layout|0|0|}255|50|}
{2010006001|XXGobject_psameas_object|428|0|692|0|{in_metadata|out_metadata|0|0|}255|76|}
{2010006001|XXGobject_psameas_object|429|0|693|0|{out_metadata|write_metadata|0|0|}255|50|}
{2010601001|XXGgraph_vertex_vertex|430|0|694|0|{View_Data|}247|265|}
{2010211001|XXGvertex_iport_iport|431|0|696|0|{0|write|}265|266|}
{2010214001|XXGiport_src_flow|432|0|698|0|{0|}266|52|}
{2010007001|XXGobject_proto_object|433|0|699|0|{}265|267|}
{2010211001|XXGvertex_iport_iport|434|0|701|0|{0|write|}267|268|}
{2010006001|XXGobject_psameas_object|435|0|703|0|{metadata|write_metadata|1|0|}268|267|}
{2010601001|XXGgraph_vertex_vertex|436|0|704|0|{Write_Block_Compressed_Lookup|}247|255|}
{2010211001|XXGvertex_iport_iport|437|0|705|0|{0|in0|}247|269|}
{2010215002|XXGiport_binding_iport|438|0|707|0|{.5|.5|{0|}10784|}269|259|}
{2010214001|XXGiport_src_flow|439|0|708|0|{0|}269|17|}
{2010601001|XXGgraph_vertex_vertex|440|0|709|0|{Write_Xref_Data_Idx|}1|270|}
{2010604001|XXGgraph_flow_flow|441|0|711|0|{Flow_1|}270|145|}
{2010604001|XXGgraph_flow_flow|442|0|712|0|{Flow_7|}270|147|}
{2010604001|XXGgraph_flow_flow|443|0|713|0|{Flow_9|}270|271|}
{2010601001|XXGgraph_vertex_vertex|444|0|715|0|{ICFF_XREF_Data|}270|143|}
{2010601001|XXGgraph_vertex_vertex|445|0|716|0|{ICFF_XREF_IDX|}270|272|}
{2010211001|XXGvertex_iport_iport|446|0|718|0|{0|write|}272|273|}
{2010214001|XXGiport_src_flow|447|0|720|0|{0|}273|271|}
{2010007001|XXGobject_proto_object|448|0|721|0|{}272|274|}
{2010211001|XXGvertex_iport_iport|449|0|723|0|{0|write|}274|275|}
{2010006001|XXGobject_psameas_object|450|0|725|0|{metadata|write_metadata|1|0|}275|274|}
{2010006001|XXGobject_psameas_object|451|0|726|0|{write_metadata|index_metadata|0|0|}272|276|}
{2010212001|XXGvertex_oport_oport|452|0|728|0|{0|out|}276|277|}
{2010213001|XXGoport_dst_flow|453|0|730|0|{0|}277|147|}
{2010212001|XXGvertex_oport_oport|454|0|731|0|{1|index|}276|278|}
{2010213001|XXGoport_dst_flow|455|0|733|0|{0|}278|271|}
{2010212001|XXGvertex_oport_oport|456|0|734|0|{2|address|}276|279|}
{2010211001|XXGvertex_iport_iport|457|0|736|0|{0|in|}276|280|}
{2010007001|XXGobject_proto_object|458|0|738|0|{}276|281|}
{2010212001|XXGvertex_oport_oport|459|0|740|0|{0|out|}281|282|}
{2010006001|XXGobject_psameas_object|460|0|742|0|{metadata|out_metadata|1|0|}282|281|}
{2010212001|XXGvertex_oport_oport|461|0|743|0|{1|index|}281|283|}
{2010006001|XXGobject_psameas_object|462|0|745|0|{metadata|index_metadata|1|0|}283|281|}
{2010212001|XXGvertex_oport_oport|463|0|746|0|{2|address|}281|284|}
{2010006001|XXGobject_psameas_object|464|0|748|0|{metadata|address_metadata|1|0|}284|281|}
{2010211001|XXGvertex_iport_iport|465|0|749|0|{0|in|}281|285|}
{2010006001|XXGobject_psameas_object|466|0|751|0|{metadata|in_metadata|1|0|}285|281|}
{2010006001|XXGobject_psameas_object|467|0|752|0|{Layout|Layout|0|0|}276|143|}
{2010006001|XXGobject_psameas_object|468|0|753|0|{in_metadata|out_metadata|0|0|}276|127|}
{2010006001|XXGobject_psameas_object|469|0|754|0|{out_metadata|write_metadata|0|0|}276|143|}
{2010601001|XXGgraph_vertex_vertex|470|0|755|0|{View_Data|}270|286|}
{2010211001|XXGvertex_iport_iport|471|0|757|0|{0|write|}286|287|}
{2010214001|XXGiport_src_flow|472|0|759|0|{0|}287|145|}
{2010007001|XXGobject_proto_object|473|0|760|0|{}286|288|}
{2010211001|XXGvertex_iport_iport|474|0|762|0|{0|write|}288|289|}
{2010006001|XXGobject_psameas_object|475|0|764|0|{metadata|write_metadata|1|0|}289|288|}
{2010601001|XXGgraph_vertex_vertex|476|0|765|0|{Write_Block_Compressed_Lookup|}270|276|}
{2010211001|XXGvertex_iport_iport|477|0|766|0|{0|in0|}270|290|}
{2010215002|XXGiport_binding_iport|478|0|768|0|{.5|.5|{0|}13195|}290|280|}
{2010214001|XXGiport_src_flow|479|0|769|0|{0|}290|11|}
{2010109001|XXGobject_property_value|480|0|770|0|{0|TrackingThumbprint|72|}1|291|}
