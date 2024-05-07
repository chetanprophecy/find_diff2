@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|504|rel_count|814|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS")) now()]|3|9|FK|@{0|}}
{30001002|XXparameter|DRIVER_START_DATE|$[(date("YYYYMMDD"))"19000101"]|3|9|FK|@{0|}}
{30001002|XXparameter|DRIVER_END_DATE|$[(date("YYYYMMDD"))now1()]|3|9|FK|@{0|}}
{30001002|XXparameter|MAIN_DATASET||3|9|FK|@{0|}}
{30001002|XXparameter|MAIN_DATASET_NK|$[get_ids_table_nk(MAIN_DATASET)]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATASET||3|9|FK|@{0|}}
{30001002|XXparameter|FILTER_EXPR||3|9|FK|@{0|}}
{30001002|XXparameter|IS_READ_ARCHIVE||13|9|FK|@{0|}}
{30001002|XXparameter|IS_CREATE_TYPE1_SNAPSHOT|True|13|9|FK|@{0|}}
{30001002|XXparameter|IS_XREF_AN_ICFF|$[if(get_ids_table_properties(IDS_DATASET).storage_type=="icff") "Y" else "N" ]|3|9|K|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_SERIAL_PATH|$PUB_DATAHUB_SERIAL_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|INPUT_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + ".reduced.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + ".dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_IDX_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + ".reduced.idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + ".idx" ;
end ]|3|9|EK|@{0|}}
{30001002|XXparameter|DML_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".dml" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + ".reduced.archive.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/columnar/" + v_target_nm + ".archive.dat.gz" ;
end ]|3|9|FK|@{0|}}
{30001002|XXparameter|___Output_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|ids_rxclaim|3|9|FK|@{0|}}
{30001002|XXparameter|DO_SOURCE|0|1|9|RFK|0 or 1: Whether or not to produce the source file.  Defaults to 1 (True).|{0|}}
{30001002|XXparameter|DO_CLEAN|1|1|9|RFK|0 or 1: Whether or not to produce a clean file.  Defaults to 0 (False).|{0|}}
{30001002|XXparameter|DO_LOOKUP|0|1|9|RFK|0 or 1: Whether or not to produce a lookup file.  Defaults to 0 (False).  Note that lookup files also have parameters for subsetting their DML and for sorting, dedup'ing, and managing overlapping intervals, based on a lookup key, etc.|{0|}}
{30001002|XXparameter|SOURCE_LOWER||3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + "." + (string(""))RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." +(string("")) RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dat" ]|3|9|K|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[ if ( not DO_LOOKUP ) "" else AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dml" ]|3|9|RK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|DML_CLEAN|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: PUB_DATAHUB_DML + "/" + v_sub_area + "/" + SOURCE_LOWER + ".dml" ;
end ]|3|9|FK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|TRANSFORM_XFR||8|9|FK|Reformat transform|{0|}}
{30001002|XXparameter|LOOKUP_FIELDS_KEY||3|9|FK|Optional: \{field_1; field_2, ...\}: A list of fields that should be included in the lookup DML.|{0|}}
{30001002|XXparameter|LOOKUP_FIELD_NAME_VEC|$[ for ( let k in key_info(LOOKUP_FIELDS_KEY) ) : k.field_name ]|3|9|RK|A vector of field names in the lookup fields key.|{0|}}
{30001002|XXparameter|LOOKUP_KEY||3|9|EFK|\{field_1; ...; field_n\}: Optional: The key to use for lookup.  When present, a serial lookup file will be produced.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[
begin
let string("") field = "";
for(let key in key_info(LOOKUP_KEY)) begin block eff_dt_fld_nm
  for(let modifiers in key.modifiers) if(starts_with(modifiers, "interval_bottom")) begin
    field = key.field_name;
    exit eff_dt_fld_nm;
  end    
end block eff_dt_fld_nm
result ::  field;
end
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[
begin
let string("") field = "";
for(let key in key_info(LOOKUP_KEY)) begin block eff_dt_fld_nm
  for(let modifiers in key.modifiers) if(starts_with(modifiers, "interval_top")) begin
    field = key.field_name;
    exit eff_dt_fld_nm;
  end    
end block eff_dt_fld_nm
result ::  field;
end
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|DO_FIX_INTERVAL|$[if(EFFECTIVE_DATE_FIELD_NAME == "" && END_DATE_FIELD_NAME == "") 0 else 1]|13|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|$[DO_FIX_INTERVAL]|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|DEFAULT_DEDUP_SORT_KEY|// This must be set appropriately in the intermediate pset.|3|9|FK|\{field_1; ...; field_n\}: The prefered extra dedup sort key.  Only fields that are present in the target table will be used.|{0|}}
{30001002|XXparameter|EXTRA_DEDUP_SORT_KEY|$[ make_key(
  for ( let k in key_info(DEFAULT_DEDUP_SORT_KEY) ) :
    if ( k.field_name member LOOKUP_FIELD_NAME_VEC )
      k)
]|3|9|FK|\{field_1; ...; field_n\}: A key with the extra fields to sort on before deduping by the effective natural key (the first record is kept).  Defaults to a standard set of keys from DEFAULT_DEDUP_SORT_KEY, if those fields are present.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ make_key(vector_concat(
    key_info(re_replace(re_replace(LOOKUP_KEY, " interval_bottom;.*", "\}"), " interval_bottom overlapping;.*", "\}")),
    key_info(EXTRA_DEDUP_SORT_KEY)))
]|3|9|RO|\{field_1; ...; field_n\}: Fields to sort on for dedup.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|1|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ [vector EFFECTIVE_DATE_FIELD_NAME] ]|3|9|RFK|A vector of fields that are to be preserved from the earlier record when two matching, adjacent records are merged.  Typically, this is anything related to the start date.|{0|}}
{30001002|XXparameter|AB_ALLOW_GRAPH_IN_COMPONENT|true|13|9|EK|@{0|}}
{30001002|XXparameter|___ACE_Template_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|condition|@3|2|F$||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|icff.maintenence|Mukesh.Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1480000|669000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'get.columnar' Execution Status Report

Job completed successfully at Tuesday, August 28, 2018 17:31:43
Run performed by user jchavan1
||echo "Maintenance Processing Started for : $IDS_DATASET" 
|#Move processed files to /processed directory
if [ $mpjret -eq 0 ]
then
       echo " Graph complted , running end Scripts now " 
 #If Xref is ICFF type then go ahead with renaming of xref created in process .
#Taking backup of existing Xref file to bkp file 
  if [[ ( -f $INPUT_ICFF_XREF_DATA_FILE )  && ( -f $INPUT_ICFF_XREF_IDX_FILE ) && ("$\{IS_XREF_AN_ICFF\}"=="Y") ]];then
        echo "Renaming INPUT_ICFF_XREF_DATA_FILE :$INPUT_ICFF_XREF_DATA_FILE to Backup Xref file :-$INPUT_ICFF_XREF_BKP_DATA_FILE "
        m_mv $INPUT_ICFF_XREF_DATA_FILE $INPUT_ICFF_XREF_BKP_DATA_FILE
                if [ $? -ne 0 ];then
                    echo " failed to rename INPUT_ICFF_XREF_DATA_FILE :$INPUT_ICFF_XREF_DATA_FILE to Backup Xref file :-$INPUT_ICFF_XREF_DATA_FILE "
                    exit 12
                fi 
        echo " Renaming INPUT_ICFF_XREF_IDX_FILE :$INPUT_ICFF_XREF_BKP_IDX_FILE to Backup Xref IDX file :-$INPUT_ICFF_XREF_BKP_IDX_FILE " 
        m_mv $INPUT_ICFF_XREF_IDX_FILE $INPUT_ICFF_XREF_BKP_IDX_FILE
                        if [ $? -ne 0 ];then
                                        echo " failed to rename INPUT_ICFF_XREF_IDX_FILE :$INPUT_ICFF_XREF_BKP_IDX_FILE to Backup Xref IDX file :-$INPUT_ICFF_XREF_BKP_IDX_FILE "
                                exit 12
                         fi 
       fi
# Now renaming .new  xref file to main files 
   if [[ ( -f $OUTPUT_ICFF_XREF_DATA_FILE )  && ( -f $OUTPUT_ICFF_XREF_IDX_FILE ) && ("$\{IS_XREF_AN_ICFF\}"=="Y")  ]];then
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
   
 echo $IDS_DATASET >> $RUN_ID_FILE
 echo " Maintenenace run successfull with RUN ID : $RUN_ID"
else
        echo "Graph Failed"
fi
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Rounded MT Bold|128|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Read Columnar to Create Clean File|443794|110155|109000|35000|927000|56000|15181|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|360|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@$IDS_DATASET  |17000|279000|0|0|0|0|15304|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}15378|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.328000009059906|{12|493000|354000|513000|354000|554000|354000|554000|204000|639000|204000|660000|204000|}15370|2065|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.7534246444702148|{12|493000|384000|523000|384000|610000|384000|610000|309000|639000|309000|660000|309000|}15373|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.3378378450870514|{0|}15371|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}15375|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}15358|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}15369|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}15376|529|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}15332|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}15357|2065|}}
{2010600005|XXGgraph|19|0|37|0|{Subgraph created from graph "get.columnar"|{}@0|@481500|374250|0|0|0|0|15377|De-Dup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|20|0|39|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|21|0|41|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}15133|17|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}15144|17|}}
{2010501005|XXGpvertex|25|0|49|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|621000|102500|0|0|0|0|15141|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|26|0|51|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|27|0|53|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|28|0|55|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|29|0|57|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|30|0|59|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|31|0|61|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|32|0|64|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|33|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|34|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|35|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|36|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|37|0|78|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|38|0|81|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|39|0|84|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9936|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|86|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|41|0|88|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9933|17|}}
{2010203004|XXGoport|42|0|90|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010210004|XXGflow|43|0|92|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9934|17|}}
{2010203004|XXGoport|44|0|94|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010210004|XXGflow|45|0|96|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9935|17|}}
{2010203004|XXGoport|46|0|98|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|47|0|100|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|48|0|102|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|49|0|104|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|50|0|106|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|51|0|108|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|52|0|110|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|53|0|112|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|54|0|114|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $MAIN_DATASET_NK)) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|40000|88500|0|0|0|0|15145|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|55|0|116|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|56|0|119|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|57|0|121|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|58|0|123|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|59|0|125|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|60|0|127|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|61|0|129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|62|0|133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|63|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|64|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|65|0|142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|66|0|146|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML_FL|3|2|f$|@{0|}}
}}@0|@60000|395000|0|0|0|0|15379|Existing IDS ICFF|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|67|0|148|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|68|0|151|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|69|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|70|0|157|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$SOURCE_SYSTEM/source.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@1321913|275000|671000|180000|56000|50000|15340|Optional: Source|Ab Initio Software||1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|71|0|159|0|{@{}@661000|199000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|72|0|162|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|73|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|74|0|167|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$SOURCE_SYSTEM/clean.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1322913|425000|671000|285000|56000|50000|15374|Optional: Clean|Ab Initio Software||1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|75|0|169|0|{@{}@661000|304000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|76|0|172|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|77|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|78|0|177|0|{|{}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|79|0|179|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010210004|XXGflow|80|0|181|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9922|2065|}}
{2010501005|XXGpvertex|81|0|191|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|230000|98000|0|0|0|0|15132|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|82|0|193|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|83|0|196|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|84|0|199|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|85|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|86|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|87|0|210|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|424000|87000|0|0|0|0|15135|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|212|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|89|0|215|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|90|0|218|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|91|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|92|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|93|0|229|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|94|0|233|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|95|0|237|0|{Subgraph created from graph "get.columnar"|{}@0|@516500|554250|0|0|0|0|15333|De-Dup-1|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|772000|240000|7|}}
{2010240003|XXGlegend|96|0|239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@ICFF_KEY: $ICFF_KEY  |-306000|-258000|0|0|0|0|15096|}}
{2010242002|XXGface|97|0|241|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|98|0|243|0|{@{}@384|.5|.5|{0|}15125|17|}}
{2010210004|XXGflow|99|0|245|0|{@{}@384|.5|.5|{0|}15127|17|}}
{2010210004|XXGflow|100|0|247|0|{@{}@384|.5|.5|{0|}15129|17|}}
{2010501005|XXGpvertex|101|0|249|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|621000|102500|0|0|0|0|15128|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|102|0|251|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|103|0|253|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|104|0|255|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|105|0|257|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|106|0|259|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|107|0|261|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|108|0|264|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|109|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|110|0|269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|111|0|272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|112|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|113|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|114|0|281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|115|0|285|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  
end|3|3|c|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"MAIN_DATASET_NK")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|40000|88500|0|0|0|0|15130|RFMT: Create hash on NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|116|0|287|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|117|0|290|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|118|0|292|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|119|0|294|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|120|0|296|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|121|0|298|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|122|0|300|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|123|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|124|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|125|0|310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|126|0|313|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|127|0|317|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_ARCHIVE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_ARCHIVE_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
}}@0|@66000|571750|0|0|0|0|15303|Input File- Archive|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|128|0|319|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|129|0|322|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|130|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|131|0|332|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|230000|98000|0|0|0|0|15124|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|132|0|334|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|133|0|337|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|134|0|340|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|135|0|342|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|136|0|345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|137|0|351|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|424000|87000|0|0|0|0|15126|Sort within Groups-1|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|138|0|353|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|139|0|356|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|140|0|359|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|141|0|361|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|142|0|364|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|143|0|370|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|144|0|374|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|145|0|379|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|254000|555250|0|0|0|0|15359|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|146|0|381|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|147|0|384|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|148|0|386|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|149|0|388|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|150|0|390|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|151|0|392|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|152|0|395|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|153|0|397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|154|0|400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|155|0|403|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|156|0|406|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|157|0|409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|158|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|159|0|420|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|234000|380250|0|0|0|0|15368|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|160|0|422|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|161|0|425|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|162|0|427|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|163|0|429|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|164|0|431|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|165|0|433|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|166|0|436|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|167|0|438|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|168|0|441|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|169|0|444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|170|0|447|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|171|0|450|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|172|0|453|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|173|0|462|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_READ_ARCHIVE]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Merge|787000|411500|0|0|0|0|15328|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|174|0|464|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|175|0|467|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|176|0|471|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|177|0|473|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|178|0|476|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010503005|XXGfvertex|179|0|483|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_LOOKUP|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1320913|570000|671000|390000|56000|50000|15342|Optional: Lookup|Ab Initio Software||1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|180|0|485|0|{@{}@661000|409000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|181|0|488|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|182|0|490|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|183|0|494|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|FIX_END_DATE|$[DO_FIX_INTERVAL]|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
}}@0|@985000|375631|317000|338000|892000|502000|15372|Prepare Output|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.18630751967430115|891000|502000|1|}}
{2010240003|XXGlegend|184|0|496|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|185|0|498|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|186|0|500|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|187|0|502|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|188|0|504|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|189|0|506|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|190|0|508|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|191|0|510|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|192|0|514|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|193|0|517|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|194|0|519|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|195|0|522|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|196|0|524|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|197|0|526|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|198|0|528|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|199|0|534|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9932|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|200|0|536|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|201|0|538|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|202|0|544|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9927|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|203|0|546|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|204|0|548|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|205|0|550|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|206|0|552|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|207|0|554|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|208|0|556|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|209|0|558|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|210|0|560|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|211|0|562|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|212|0|564|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|213|0|566|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|214|0|568|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|215|0|570|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|216|0|572|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|217|0|574|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|218|0|576|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|219|0|578|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|220|0|580|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|221|0|583|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|222|0|585|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|223|0|587|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|224|0|589|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|225|0|591|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|226|0|599|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|227|0|601|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|228|0|604|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|229|0|608|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|230|0|610|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|231|0|612|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|232|0|618|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|233|0|620|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|234|0|623|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|235|0|625|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|236|0|627|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|237|0|629|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|238|0|636|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|239|0|638|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|240|0|641|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|241|0|643|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|242|0|645|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|243|0|647|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|244|0|654|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|245|0|656|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|246|0|659|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|247|0|665|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|248|0|667|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|249|0|670|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|250|0|676|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|251|0|681|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|252|0|685|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|253|0|691|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|254|0|693|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|255|0|696|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|256|0|701|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|257|0|703|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|258|0|705|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|259|0|713|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|260|0|715|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|261|0|718|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|262|0|723|0|{@{}@482000|349000|11000|11000|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|263|0|727|0|{@{}@482000|379000|11000|11000|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|264|0|731|0|{@{}@482000|409000|11000|11000|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|265|0|735|0|{@{}@307000|379000|11000|11000|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|266|0|739|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP|get|3|9|RFK|The step name.  Used to prefix the Dups reject file name.|{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$SOURCE_SYSTEM/$STEP.$SOURCE_LOWER.dups.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|True|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1497351152|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@260000|290678|0|0|892000|502000|0|prepare_output|||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|3|}}
{2010240003|XXGlegend|267|0|741|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|268|0|743|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|269|0|745|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|270|0|747|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|271|0|749|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|272|0|751|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|273|0|753|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|274|0|755|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|275|0|757|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9919|17|}}
{2010210004|XXGflow|276|0|759|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010210004|XXGflow|277|0|761|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|278|0|763|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9922|2065|}}
{2010210004|XXGflow|279|0|765|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|280|0|767|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|281|0|769|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010210004|XXGflow|282|0|771|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|283|0|773|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|284|0|775|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|285|0|777|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|286|0|780|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|287|0|782|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|288|0|785|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|289|0|788|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|290|0|790|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|291|0|792|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|292|0|795|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|293|0|797|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|294|0|800|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|295|0|803|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9||@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9||@{0|}}
{30001002|XXparameter|UNDATED_NATURAL_KEY|$[
begin
let dml_key_info_vec final_key = [vector];
for(let key in key_info(LOOKUP_KEY)) begin
  if(key.modifiers == [vector]) begin
    final_key = vector_append(final_key, key);
  end
  for(let modifiers in key.modifiers) if(not starts_with(modifiers, "interval_bottom") && not starts_with(modifiers, "interval_top")) begin
    final_key = vector_append(final_key, key);
  end    
end
result ::  make_key(final_key);
end
]|3|9||@{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9||@{0|}}
{30001002|XXparameter|FIX_END_DATE||3|8|=|@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE||3|8|=|@{0|}}
{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9||@{0|}}
{30001002|XXparameter|condition|$[ DO_LOOKUP and LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|$|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9927|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|296|0|805|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|297|0|807|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|298|0|809|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|299|0|811|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|300|0|813|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|301|0|815|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|302|0|817|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|303|0|819|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|304|0|821|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|305|0|823|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|306|0|825|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|307|0|827|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|308|0|829|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|309|0|831|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|310|0|833|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|311|0|835|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|312|0|837|0|{|{}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|313|0|839|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|314|0|842|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|315|0|844|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|316|0|846|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|317|0|848|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|318|0|850|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|319|0|853|0|{|{}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|320|0|855|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|321|0|858|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|322|0|860|0|{|{}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|323|0|862|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|324|0|864|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|325|0|867|0|{|{}@0|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|326|0|869|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|327|0|872|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|328|0|874|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|329|0|876|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|330|0|878|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|331|0|881|0|{|{}@0|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|332|0|883|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|333|0|886|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|334|0|888|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|335|0|890|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|336|0|892|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|337|0|895|0|{|{}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|338|0|897|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|339|0|900|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|340|0|903|0|{|{}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|341|0|905|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|342|0|908|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|343|0|911|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|344|0|916|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|345|0|920|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|346|0|924|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DXF_XFR/keys.xfr";|3|9|RK||{0|}}
{30001002|XXparameter|LOOKUP_KEY|\{nk1; nk2; eff_dt interval_bottom; end_dt interval_top\}|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$1")
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$2")
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|86400|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|UNDATED_NATURAL_KEY|$[ re_replace(LOOKUP_KEY,
    "; *[^;]* interval_bottom;.*",
    "\}")
]|3|9|RFK|The lookup key minus any interval range.  For Type 2 loads, this should be set to the natural key.  Defaults to a the lookup key without any interval fields.|{0|}}
{30001002|XXparameter|PARTITION_KEY|$UNDATED_NATURAL_KEY|3|9|RFK|The key to partition on before processing.  For Type 2 loads, this should be set to the list natural key, if any, or else the natural key.  Defaults to the undated natural key.|{0|}}
{30001002|XXparameter|DEDUP_KEY|$[ if ( EFFECTIVE_DATE_FIELD_NAME == "" )
    UNDATED_NATURAL_KEY
  else
    add_key(UNDATED_NATURAL_KEY,
      key_info(EFFECTIVE_DATE_FIELD_NAME)[0])
]|3|9|RFK|\{key1; key2...\}: The key to use in the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the lookup key.  For Type 2 loads, set this to the natural key plus the effective date descending.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ if ( END_DATE_FIELD_NAME == "" )
    DEDUP_KEY
  else
    add_key(DEDUP_KEY,
      key_info(END_DATE_FIELD_NAME)[0])
]|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|CHECK_KEYS|$[ if ( not starts_with_key(DEDUP_SORT_KEY, PARTITION_KEY) )
    force_error("The Partition Key is not a prefix of the Dedup Sort Key.  Partition Key: " + PARTITION_KEY + ", Dedup Sort Key: " + DEDUP_SORT_KEY)
  else if ( not starts_with_key(DEDUP_KEY, PARTITION_KEY) )
    force_error("The Partition Key is not a prefix of the Dedup Key.  Partition Key: " + PARTITION_KEY + ", Dedup Key: " + DEDUP_KEY)
  else if ( not starts_with_key(DEDUP_SORT_KEY, DEDUP_KEY) )
    force_error("The Dedup Key is not a prefix of the Dedup Sort Key.  Dedup Key: " + DEDUP_KEY + ", Dedup Sort Key: " + DEDUP_SORT_KEY)
  else if ( not starts_with_key(DEDUP_KEY, UNDATED_NATURAL_KEY) )
    force_error("The Undated Natural Key is not a prefix of the Dedup Key.  Undated Natural Key: " + UNDATED_NATURAL_KEY + ", Dedup Key: " + DEDUP_KEY)
  else
    ""
]|3|9|K|Returns "" if there is no problem with the consistency of the keys.  Otherwise, forces an error.  Note that you must reference this parameter in order to force it to be evaluated at run time.|{0|}}
{30001002|XXparameter|FIX_END_DATE|True|13|9|RFK|@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK|@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_DIRECTION|$[ CHECK_KEYS + if ( FIX_EFFECTIVE_DATE ) "ascending" else "descending" ]|3|9|RK|The direction to sort the effective date field, if any.  This is based on whether we have an end date or not.|{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_SORT_KEY|$[ set_field_direction(DEDUP_SORT_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RK|The dedup sort key adjusted so that any effective date has the right ascending or descending ordering.  This depends on whether there is an end date.|{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_KEY|$[ set_field_direction(DEDUP_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RK|The dedup key adjusted so that any effective date has the right ascending or descending ordering.  This depends on whether there is an end date.|{0|}}
{30001002|XXparameter|INPUT_DML||7|1|RFsl|The full DML used in this subgraph.|{0|}}
{30001002|XXparameter|INPUT_FIELD_NAME_VEC|$[ record_info_item(INPUT_DML, "name") ]|3|9|RK|A vector of field names in the input DML.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_TYPE|$[ if ( EFFECTIVE_DATE_FIELD_NAME == "" )
    ""
  else
    (for ( let info in record_info(INPUT_DML) ) :
      if ( info.name == EFFECTIVE_DATE_FIELD_NAME )
        info.dml_type)[0]
]|3|9|K|The DML type of the effective date field.  Used for temporary variables.|{0|}}
{30001002|XXparameter|DIFF_DML|$[ add_fields("record\\nend",
    for ( let info in record_info(INPUT_DML) ) :
      if ( info.name not member [vector EFFECTIVE_DATE_FIELD_NAME, END_DATE_FIELD_NAME] )
        info)
]|3|9|FK|The DML used for comparing adjacent records.  Defaults to the input DML, excluding any effective or end dates.|{0|}}
{30001002|XXparameter|DROP_RECORD_DIFF_DML|$[ if ( "drop_record" member INPUT_FIELD_NAME_VEC )
      join_types("record\\n  decimal(1) drop_record;\\nend", DIFF_DML)
    else
      DIFF_DML
]|3|9|RK|The diff DML with drop_record as the first field.  This is used when comparing adjacent records.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ if ( "matching__eff_dt" member INPUT_FIELD_NAME_VEC )
      [vector "matching__eff_dt", EFFECTIVE_DATE_FIELD_NAME]
    else
      [vector EFFECTIVE_DATE_FIELD_NAME]
]|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1497351139|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@87336|104500|0|0|884000|534000|0|dedup_and_fix_intervals|||1|100|-1||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|3|}}
{2010240003|XXGlegend|347|0|926|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|348|0|928|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|349|0|930|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|350|0|932|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|351|0|934|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|352|0|936|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|353|0|938|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|354|0|940|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|355|0|942|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|356|0|944|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|357|0|946|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|358|0|948|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|359|0|950|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|360|0|952|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|361|0|954|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|362|0|956|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|363|0|958|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|364|0|960|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|365|0|963|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|366|0|965|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|367|0|967|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|368|0|969|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|369|0|971|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|370|0|974|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|371|0|976|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|372|0|979|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|373|0|982|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|374|0|985|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|375|0|988|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|376|0|991|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|377|0|994|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|378|0|996|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|379|0|999|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|380|0|1001|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{30001002|XXparameter|in_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|381|0|1003|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|382|0|1006|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|383|0|1010|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|384|0|1012|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|385|0|1014|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|386|0|1017|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403552|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|387|0|1019|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|388|0|1022|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|389|0|1025|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
{30001002|XXparameter|transform|/* Find records with the same data values and abutting or overlapping effective dates. */
out :: key_change(in1, in2) =
begin
  out :1: (( in1.$END_DATE_FIELD_NAME < in2.$EFFECTIVE_DATE_FIELD_NAME ) or  // 1) There is a gap, ...
            $[ string_join(                                                                                // 2) Or Drop Record changed, ...
                vector_concat( // Put the non-NULL tests before the NULLable tests.                        // 3) One of the data fields does not match.
                  for ( let i in record_info(DROP_RECORD_DIFF_DML) ) :
                    if ( not i.nullable )
                      printf("in1.%s != in2.%s", i.name, i.name),
                  for ( let i in record_info(DIFF_DML) ) :
                    if ( i.nullable )
                      printf("first_defined(in1.%s != in2.%s, is_null(in1.%s) != is_null(in2.%s))",
                             i.name, i.name, i.name, i.name)),
                " or\\n            ") ] );
  out :2: 1;
end;


/* Keep the oldest Eff Date and the latest End Date amongst a group of matching records.
Because the incoming records have the earliest End Eff Date first, this will keep the longest (last) End Date. 
Other "physical" fields come from the last (latest) record, except for the Source Sequence Number, if any. */
out :: rollup(in) =
begin
  out.* :: in.*;
  $[ string_join(
      for ( let f in KEEP_FROM_FIRST_VEC ) :
        "out." + f + " :: first(in." + f + ");",
      "\\n  ") ]
end;|3|9|j|@{0|}}
{30001002|XXparameter|condition|$[ FIX_END_DATE \|\| FIX_EFFECTIVE_DATE ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|390|0|1027|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|391|0|1030|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|392|0|1032|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|393|0|1034|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|394|0|1036|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|395|0|1039|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|396|0|1041|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|397|0|1044|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|398|0|1047|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|399|0|1050|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|400|0|1053|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|401|0|1056|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$[
if(FIX_END_DATE)
"/* Remember the current and previous effective dates. */
type temporary_type =
record
  " + EFFECTIVE_DATE_TYPE + " cur_eff_dttm = NULL;
  " + EFFECTIVE_DATE_TYPE + " prev_eff_dttm = NULL;
end;


/* Initialize the Effective Date accumulator to NULL. */
temp :: initialize(in) =
begin
  temp :: allocate_with_nulls();
end;


/* Remember the new Effective Date and carry over the Previous (Later) Effective Date. */
out :: scan(temp, in) =
begin
  out.prev_eff_dttm :: temp.cur_eff_dttm;
  out.cur_eff_dttm :: in." + EFFECTIVE_DATE_FIELD_NAME + ";
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.\\n" + 
  ((string_index(EFFECTIVE_DATE_TYPE, "date") != 0)?
        "  out." + END_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + END_DATE_FIELD_NAME + " )
    datetime_add(temp.prev_eff_dttm, 0, microseconds = -(" + ADJACENT_INTERVAL_MICROSECONDS+ "));  // This is skipped for the first record in NK group.
  out." + END_DATE_FIELD_NAME + " :: in." + END_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n":
        "  out." + END_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + END_DATE_FIELD_NAME + " )
    temp.prev_eff_dttm - " + ADJACENT_INTERVAL_MICROSECONDS + ";  // This is skipped for the first record in NK group.
  out." + END_DATE_FIELD_NAME + " :: in." + END_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n") + 
"end;"
else if(FIX_EFFECTIVE_DATE)
"/* Remember the current and previous effective dates. */
type temporary_type =
record
  " + EFFECTIVE_DATE_TYPE + " cur_end_dttm = NULL;
  " + EFFECTIVE_DATE_TYPE + " prev_end_dttm = NULL;
end;


/* Initialize the Effective Date accumulator to NULL. */
temp :: initialize(in) =
begin
  temp :: allocate_with_nulls();
end;


/* Remember the new Effective Date and carry over the Previous (Later) Effective Date. */
out :: scan(temp, in) =
begin
  out.prev_end_dttm :: temp.cur_end_dttm;
  out.cur_end_dttm :: in." + END_DATE_FIELD_NAME + ";
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.\\n" +   
  ((string_index(EFFECTIVE_DATE_TYPE, "date") != 0)?
        "out." + EFFECTIVE_DATE_FIELD_NAME + " :1: if ( temp.prev_end_dttm >= in." + EFFECTIVE_DATE_FIELD_NAME + " )
    datetime_add(temp.prev_end_dttm, 0, microseconds = (" + ADJACENT_INTERVAL_MICROSECONDS+ "));  // This is skipped for the first record in NK group.
  out." + EFFECTIVE_DATE_FIELD_NAME + " :: in." + EFFECTIVE_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*\\n":
        "  out." + EFFECTIVE_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + EFFECTIVE_DATE_FIELD_NAME + " )
    temp.prev_eff_dttm - " + ADJACENT_INTERVAL_MICROSECONDS + ";  // This is skipped for the first record in NK group.
  out." + EFFECTIVE_DATE_FIELD_NAME + " :: in." + EFFECTIVE_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n") + 
"end;"
else ""
]|3|9|j|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ FIX_END_DATE \|\| FIX_EFFECTIVE_DATE ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|402|0|1058|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|403|0|1061|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|404|0|1063|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|405|0|1065|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|406|0|1067|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|407|0|1070|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.4.16:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|408|0|1072|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|409|0|1075|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|410|0|1078|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|411|0|1081|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|412|0|1084|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|413|0|1087|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|414|0|1089|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|415|0|1092|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|416|0|1095|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|417|0|1097|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|418|0|1100|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|419|0|1103|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(EFFECTIVE_DATE_FIELD_NAME) &&
   not is_blank(END_DATE_FIELD_NAME)]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|420|0|1105|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|421|0|1108|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|422|0|1111|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|423|0|1113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|424|0|1116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|425|0|1119|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|426|0|1122|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|427|0|1125|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|428|0|1130|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|429|0|1132|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|430|0|1135|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|431|0|1137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|432|0|1141|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|433|0|1143|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|434|0|1146|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|435|0|1149|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|436|0|1151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|437|0|1154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|438|0|1157|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|439|0|1159|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|440|0|1161|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|441|0|1165|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|442|0|1167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|443|0|1170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|444|0|1173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|445|0|1175|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|446|0|1178|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|447|0|1181|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|448|0|1184|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|449|0|1186|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|450|0|1188|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|451|0|1190|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|452|0|1192|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|453|0|1194|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|454|0|1196|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|455|0|1198|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|456|0|1200|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|457|0|1202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|458|0|1206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|459|0|1210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|460|0|1214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|461|0|1217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|462|0|1220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|463|0|1223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|464|0|1226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|465|0|1229|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|466|0|1232|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|467|0|1235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|468|0|1238|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|469|0|1240|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|470|0|1243|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|471|0|1246|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|472|0|1248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|473|0|1251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|474|0|1254|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|475|0|1257|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|476|0|1260|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|477|0|1263|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|478|0|1266|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@15000|60000|0|0|0|0|15170|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|821000|470000|3|}}
{2010240003|XXGlegend|479|0|1268|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|480|0|1270|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|481|0|1272|0|{@{}@Author|217000|66000|0|0|0|0|99|}}
{2010242002|XXGface|482|0|1274|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|483|0|1276|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|484|0|1278|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|485|0|1280|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|486|0|1282|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|487|0|1284|0|{@{}@1.0|17000|88000|0|0|0|0|105|}}
{2010242002|XXGface|488|0|1286|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|489|0|1288|0|{@{}@Jan 11 2017|82000|88000|0|0|0|0|107|}}
{2010242002|XXGface|490|0|1290|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|491|0|1292|0|{@{}@Mukesh.Singh (Exusia)|187000|88000|0|0|0|0|109|}}
{2010242002|XXGface|492|0|1294|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|493|0|1296|0|{@{}@Initial version - This version only support Data and Index consolidation in 
IDS dimensions
|412000|83000|0|0|0|0|112|}}
{2010242002|XXGface|494|0|1298|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|495|0|1300|0|{@{}@1.0|17000|123000|0|0|0|0|106|}}
{2010242002|XXGface|496|0|1302|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|497|0|1304|0|{@{}@July 11 2017|77000|123000|0|0|0|0|114|}}
{2010242002|XXGface|498|0|1306|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|499|0|1308|0|{@{}@Mukesh.Singh (Exusia)|187000|123000|0|0|0|0|110|}}
{2010242002|XXGface|500|0|1310|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|501|0|1312|0|{@{}@Xref Consolidation functionality is added|412000|123000|0|0|0|0|113|}}
{2010242002|XXGface|502|0|1314|0|{@{}@Arial Narrow|0|100|0|}}
{2010110002|XXGconstant|503|0|1316|0|{@{}@{1|4409285|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_12|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_13|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_14|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_2|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_3|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_4|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_5|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_6|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_9|}1|18|}
{2010601001|XXGgraph_vertex_vertex|18|0|36|0|{De_Dup|}1|19|}
{2010605001|XXGgraph_legend_legend|19|0|38|0|{0|}19|20|}
{2010241001|XXGlegend_face_face|20|0|40|0|{}20|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_2|}19|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_3|}19|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_4|}19|24|}
{2010601001|XXGgraph_vertex_vertex|24|0|48|0|{Dedup_Sorted|}19|25|}
{2010212001|XXGvertex_oport_oport|25|0|50|0|{0|out|}25|26|}
{2010212001|XXGvertex_oport_oport|26|0|52|0|{1|dup|}25|27|}
{2010212001|XXGvertex_oport_oport|27|0|54|0|{2|reject|}25|28|}
{2010212001|XXGvertex_oport_oport|28|0|56|0|{3|error|}25|29|}
{2010212001|XXGvertex_oport_oport|29|0|58|0|{4|log|}25|30|}
{2010211001|XXGvertex_iport_iport|30|0|60|0|{0|in|}25|31|}
{2010214001|XXGiport_src_flow|31|0|62|0|{0|}31|23|}
{2010007001|XXGobject_proto_object|32|0|63|0|{}25|32|}
{2010212001|XXGvertex_oport_oport|33|0|65|0|{0|out|}32|33|}
{2010006001|XXGobject_psameas_object|34|0|67|0|{metadata|out_metadata|1|0|}33|32|}
{2010212001|XXGvertex_oport_oport|35|0|68|0|{1|dup|}32|34|}
{2010006001|XXGobject_psameas_object|36|0|70|0|{metadata|dup_metadata|1|0|}34|32|}
{2010212001|XXGvertex_oport_oport|37|0|71|0|{2|reject|}32|35|}
{2010006001|XXGobject_psameas_object|38|0|73|0|{metadata|reject_metadata|1|0|}35|32|}
{2010212001|XXGvertex_oport_oport|39|0|74|0|{3|error|}32|36|}
{2010006001|XXGobject_psameas_object|40|0|76|0|{metadata|error_metadata|1|0|}36|32|}
{2010212001|XXGvertex_oport_oport|41|0|77|0|{4|log|}32|37|}
{2010006001|XXGobject_psameas_object|42|0|79|0|{metadata|log_metadata|1|0|}37|32|}
{2010211001|XXGvertex_iport_iport|43|0|80|0|{0|in|}32|38|}
{2010006001|XXGobject_psameas_object|44|0|82|0|{metadata|in_metadata|1|0|}38|32|}
{2010006001|XXGobject_psameas_object|45|0|83|0|{Layout|Layout|0|0|}25|39|}
{2010212001|XXGvertex_oport_oport|46|0|85|0|{0|source|}39|40|}
{2010213001|XXGoport_dst_flow|47|0|87|0|{0|}40|41|}
{2010212001|XXGvertex_oport_oport|48|0|89|0|{1|clean|}39|42|}
{2010213001|XXGoport_dst_flow|49|0|91|0|{0|}42|43|}
{2010212001|XXGvertex_oport_oport|50|0|93|0|{2|lkp|}39|44|}
{2010213001|XXGoport_dst_flow|51|0|95|0|{0|}44|45|}
{2010212001|XXGvertex_oport_oport|52|0|97|0|{3|reject0|}39|46|}
{2010212001|XXGvertex_oport_oport|53|0|99|0|{4|reject1|}39|47|}
{2010212001|XXGvertex_oport_oport|54|0|101|0|{5|reject2|}39|48|}
{2010212001|XXGvertex_oport_oport|55|0|103|0|{6|error0|}39|49|}
{2010212001|XXGvertex_oport_oport|56|0|105|0|{7|error1|}39|50|}
{2010212001|XXGvertex_oport_oport|57|0|107|0|{8|error2|}39|51|}
{2010212001|XXGvertex_oport_oport|58|0|109|0|{9|log|}39|52|}
{2010211001|XXGvertex_iport_iport|59|0|111|0|{0|in|}39|53|}
{2010006001|XXGobject_psameas_object|60|0|113|0|{in_metadata|out0_metadata|0|0|}39|54|}
{2010212001|XXGvertex_oport_oport|61|0|115|0|{0|out0|}54|55|}
{2010213001|XXGoport_dst_flow|62|0|117|0|{0|}55|24|}
{2010212001|XXGvertex_oport_oport|63|0|118|0|{1|reject0|}54|56|}
{2010212001|XXGvertex_oport_oport|64|0|120|0|{2|error0|}54|57|}
{2010212001|XXGvertex_oport_oport|65|0|122|0|{3|log|}54|58|}
{2010211001|XXGvertex_iport_iport|66|0|124|0|{0|in|}54|59|}
{2010007001|XXGobject_proto_object|67|0|126|0|{}54|60|}
{2010212001|XXGvertex_oport_oport|68|0|128|0|{0|out0|}60|61|}
{2010006001|XXGobject_psameas_object|69|0|130|0|{metadata|out0_metadata|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|70|0|131|0|{transform0|transform0|1|0|}61|60|}
{2010212001|XXGvertex_oport_oport|71|0|132|0|{1|reject0|}60|62|}
{2010006001|XXGobject_psameas_object|72|0|134|0|{metadata|reject0_metadata|1|0|}62|60|}
{2010212001|XXGvertex_oport_oport|73|0|135|0|{2|error0|}60|63|}
{2010006001|XXGobject_psameas_object|74|0|137|0|{metadata|error0_metadata|1|0|}63|60|}
{2010212001|XXGvertex_oport_oport|75|0|138|0|{3|log|}60|64|}
{2010006001|XXGobject_psameas_object|76|0|140|0|{metadata|log_metadata|1|0|}64|60|}
{2010211001|XXGvertex_iport_iport|77|0|141|0|{0|in|}60|65|}
{2010006001|XXGobject_psameas_object|78|0|143|0|{metadata|in_metadata|1|0|}65|60|}
{2010006001|XXGobject_psameas_object|79|0|144|0|{Layout|Layout|0|0|}54|39|}
{2010006001|XXGobject_psameas_object|80|0|145|0|{in_metadata|read_metadata|0|0|}54|66|}
{2010212001|XXGvertex_oport_oport|81|0|147|0|{0|read|}66|67|}
{2010213001|XXGoport_dst_flow|82|0|149|0|{0|}67|9|}
{2010007001|XXGobject_proto_object|83|0|150|0|{}66|68|}
{2010212001|XXGvertex_oport_oport|84|0|152|0|{0|read|}68|69|}
{2010006001|XXGobject_psameas_object|85|0|154|0|{metadata|read_metadata|1|0|}69|68|}
{2010006001|XXGobject_psameas_object|86|0|155|0|{reject0_metadata|read_metadata|0|0|}54|66|}
{2010006001|XXGobject_psameas_object|87|0|156|0|{out0_metadata|write_metadata|0|0|}39|70|}
{2010211001|XXGvertex_iport_iport|88|0|158|0|{0|write|}70|71|}
{2010214001|XXGiport_src_flow|89|0|160|0|{0|}71|10|}
{2010007001|XXGobject_proto_object|90|0|161|0|{}70|72|}
{2010211001|XXGvertex_iport_iport|91|0|163|0|{0|write|}72|73|}
{2010006001|XXGobject_psameas_object|92|0|165|0|{metadata|write_metadata|1|0|}73|72|}
{2010006001|XXGobject_psameas_object|93|0|166|0|{out1_metadata|write_metadata|0|0|}39|74|}
{2010211001|XXGvertex_iport_iport|94|0|168|0|{0|write|}74|75|}
{2010214001|XXGiport_src_flow|95|0|170|0|{0|}75|11|}
{2010007001|XXGobject_proto_object|96|0|171|0|{}74|76|}
{2010211001|XXGvertex_iport_iport|97|0|173|0|{0|write|}76|77|}
{2010006001|XXGobject_psameas_object|98|0|175|0|{metadata|write_metadata|1|0|}77|76|}
{2010006001|XXGobject_psameas_object|99|0|176|0|{out2_metadata|write_metadata|0|0|}39|78|}
{2010211001|XXGvertex_iport_iport|100|0|178|0|{0|write|}78|79|}
{2010214001|XXGiport_src_flow|101|0|180|0|{0|}79|80|}
{2010006001|XXGobject_psameas_object|102|0|182|0|{reject0_metadata|out0_metadata|0|0|}39|54|}
{2010006001|XXGobject_psameas_object|103|0|183|0|{reject1_metadata|out0_metadata|0|0|}39|54|}
{2010006001|XXGobject_psameas_object|104|0|184|0|{reject2_metadata|out0_metadata|0|0|}39|54|}
{2010006001|XXGobject_psameas_object|105|0|185|0|{dup_metadata|out0_metadata|0|0|}25|54|}
{2010006001|XXGobject_psameas_object|106|0|186|0|{in_metadata|out0_metadata|0|0|}25|54|}
{2010006001|XXGobject_psameas_object|107|0|187|0|{out_metadata|out0_metadata|0|0|}25|54|}
{2010006001|XXGobject_psameas_object|108|0|188|0|{reject_metadata|out0_metadata|0|0|}25|54|}
{2010601001|XXGgraph_vertex_vertex|109|0|189|0|{RFMT_Create_hash_on_NK|}19|54|}
{2010601001|XXGgraph_vertex_vertex|110|0|190|0|{Sort_on_ICFF_KEY|}19|81|}
{2010212001|XXGvertex_oport_oport|111|0|192|0|{0|out|}81|82|}
{2010213001|XXGoport_dst_flow|112|0|194|0|{0|}82|22|}
{2010211001|XXGvertex_iport_iport|113|0|195|0|{0|in|}81|83|}
{2010214001|XXGiport_src_flow|114|0|197|0|{0|}83|24|}
{2010007001|XXGobject_proto_object|115|0|198|0|{}81|84|}
{2010212001|XXGvertex_oport_oport|116|0|200|0|{0|out|}84|85|}
{2010006001|XXGobject_psameas_object|117|0|202|0|{metadata|out_metadata|1|0|}85|84|}
{2010211001|XXGvertex_iport_iport|118|0|203|0|{0|in|}84|86|}
{2010006001|XXGobject_psameas_object|119|0|205|0|{metadata|in_metadata|1|0|}86|84|}
{2010006001|XXGobject_psameas_object|120|0|206|0|{Layout|Layout|0|0|}81|39|}
{2010006001|XXGobject_psameas_object|121|0|207|0|{in_metadata|out0_metadata|0|0|}81|54|}
{2010006001|XXGobject_psameas_object|122|0|208|0|{out_metadata|out0_metadata|0|0|}81|54|}
{2010601001|XXGgraph_vertex_vertex|123|0|209|0|{Sort_within_Groups_1|}19|87|}
{2010212001|XXGvertex_oport_oport|124|0|211|0|{0|out|}87|88|}
{2010213001|XXGoport_dst_flow|125|0|213|0|{0|}88|23|}
{2010211001|XXGvertex_iport_iport|126|0|214|0|{0|in|}87|89|}
{2010214001|XXGiport_src_flow|127|0|216|0|{0|}89|22|}
{2010007001|XXGobject_proto_object|128|0|217|0|{}87|90|}
{2010212001|XXGvertex_oport_oport|129|0|219|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|130|0|221|0|{metadata|out_metadata|1|0|}91|90|}
{2010211001|XXGvertex_iport_iport|131|0|222|0|{0|in|}90|92|}
{2010006001|XXGobject_psameas_object|132|0|224|0|{metadata|in_metadata|1|0|}92|90|}
{2010006001|XXGobject_psameas_object|133|0|225|0|{Layout|Layout|0|0|}87|39|}
{2010006001|XXGobject_psameas_object|134|0|226|0|{in_metadata|out0_metadata|0|0|}87|54|}
{2010006001|XXGobject_psameas_object|135|0|227|0|{out_metadata|out0_metadata|0|0|}87|54|}
{2010212001|XXGvertex_oport_oport|136|0|228|0|{0|out0|}19|93|}
{2010216002|XXGoport_binding_oport|137|0|230|0|{.5|.5|{0|}15147|}93|26|}
{2010213001|XXGoport_dst_flow|138|0|231|0|{0|}93|16|}
{2010211001|XXGvertex_iport_iport|139|0|232|0|{0|in0|}19|94|}
{2010215002|XXGiport_binding_iport|140|0|234|0|{.5|.5|{0|}15146|}94|59|}
{2010214001|XXGiport_src_flow|141|0|235|0|{0|}94|13|}
{2010601001|XXGgraph_vertex_vertex|142|0|236|0|{De_Dup_1|}1|95|}
{2010605001|XXGgraph_legend_legend|143|0|238|0|{0|}95|96|}
{2010241001|XXGlegend_face_face|144|0|240|0|{}96|97|}
{2010604001|XXGgraph_flow_flow|145|0|242|0|{Flow_2|}95|98|}
{2010604001|XXGgraph_flow_flow|146|0|244|0|{Flow_3|}95|99|}
{2010604001|XXGgraph_flow_flow|147|0|246|0|{Flow_4|}95|100|}
{2010601001|XXGgraph_vertex_vertex|148|0|248|0|{Dedup_Sorted|}95|101|}
{2010212001|XXGvertex_oport_oport|149|0|250|0|{0|out|}101|102|}
{2010212001|XXGvertex_oport_oport|150|0|252|0|{1|dup|}101|103|}
{2010212001|XXGvertex_oport_oport|151|0|254|0|{2|reject|}101|104|}
{2010212001|XXGvertex_oport_oport|152|0|256|0|{3|error|}101|105|}
{2010212001|XXGvertex_oport_oport|153|0|258|0|{4|log|}101|106|}
{2010211001|XXGvertex_iport_iport|154|0|260|0|{0|in|}101|107|}
{2010214001|XXGiport_src_flow|155|0|262|0|{0|}107|99|}
{2010007001|XXGobject_proto_object|156|0|263|0|{}101|108|}
{2010212001|XXGvertex_oport_oport|157|0|265|0|{0|out|}108|109|}
{2010006001|XXGobject_psameas_object|158|0|267|0|{metadata|out_metadata|1|0|}109|108|}
{2010212001|XXGvertex_oport_oport|159|0|268|0|{1|dup|}108|110|}
{2010006001|XXGobject_psameas_object|160|0|270|0|{metadata|dup_metadata|1|0|}110|108|}
{2010212001|XXGvertex_oport_oport|161|0|271|0|{2|reject|}108|111|}
{2010006001|XXGobject_psameas_object|162|0|273|0|{metadata|reject_metadata|1|0|}111|108|}
{2010212001|XXGvertex_oport_oport|163|0|274|0|{3|error|}108|112|}
{2010006001|XXGobject_psameas_object|164|0|276|0|{metadata|error_metadata|1|0|}112|108|}
{2010212001|XXGvertex_oport_oport|165|0|277|0|{4|log|}108|113|}
{2010006001|XXGobject_psameas_object|166|0|279|0|{metadata|log_metadata|1|0|}113|108|}
{2010211001|XXGvertex_iport_iport|167|0|280|0|{0|in|}108|114|}
{2010006001|XXGobject_psameas_object|168|0|282|0|{metadata|in_metadata|1|0|}114|108|}
{2010006001|XXGobject_psameas_object|169|0|283|0|{Layout|Layout|0|0|}101|39|}
{2010006001|XXGobject_psameas_object|170|0|284|0|{dup_metadata|out0_metadata|0|0|}101|115|}
{2010212001|XXGvertex_oport_oport|171|0|286|0|{0|out0|}115|116|}
{2010213001|XXGoport_dst_flow|172|0|288|0|{0|}116|100|}
{2010212001|XXGvertex_oport_oport|173|0|289|0|{1|reject0|}115|117|}
{2010212001|XXGvertex_oport_oport|174|0|291|0|{2|error0|}115|118|}
{2010212001|XXGvertex_oport_oport|175|0|293|0|{3|log|}115|119|}
{2010211001|XXGvertex_iport_iport|176|0|295|0|{0|in|}115|120|}
{2010007001|XXGobject_proto_object|177|0|297|0|{}115|121|}
{2010212001|XXGvertex_oport_oport|178|0|299|0|{0|out0|}121|122|}
{2010006001|XXGobject_psameas_object|179|0|301|0|{metadata|out0_metadata|1|0|}122|121|}
{2010006001|XXGobject_psameas_object|180|0|302|0|{transform0|transform0|1|0|}122|121|}
{2010212001|XXGvertex_oport_oport|181|0|303|0|{1|reject0|}121|123|}
{2010006001|XXGobject_psameas_object|182|0|305|0|{metadata|reject0_metadata|1|0|}123|121|}
{2010212001|XXGvertex_oport_oport|183|0|306|0|{2|error0|}121|124|}
{2010006001|XXGobject_psameas_object|184|0|308|0|{metadata|error0_metadata|1|0|}124|121|}
{2010212001|XXGvertex_oport_oport|185|0|309|0|{3|log|}121|125|}
{2010006001|XXGobject_psameas_object|186|0|311|0|{metadata|log_metadata|1|0|}125|121|}
{2010211001|XXGvertex_iport_iport|187|0|312|0|{0|in|}121|126|}
{2010006001|XXGobject_psameas_object|188|0|314|0|{metadata|in_metadata|1|0|}126|121|}
{2010006001|XXGobject_psameas_object|189|0|315|0|{Layout|Layout|0|0|}115|39|}
{2010006001|XXGobject_psameas_object|190|0|316|0|{in_metadata|read_metadata|0|0|}115|127|}
{2010212001|XXGvertex_oport_oport|191|0|318|0|{0|read|}127|128|}
{2010213001|XXGoport_dst_flow|192|0|320|0|{0|}128|18|}
{2010007001|XXGobject_proto_object|193|0|321|0|{}127|129|}
{2010212001|XXGvertex_oport_oport|194|0|323|0|{0|read|}129|130|}
{2010006001|XXGobject_psameas_object|195|0|325|0|{metadata|read_metadata|1|0|}130|129|}
{2010006001|XXGobject_psameas_object|196|0|326|0|{reject0_metadata|read_metadata|0|0|}115|127|}
{2010006001|XXGobject_psameas_object|197|0|327|0|{in_metadata|out0_metadata|0|0|}101|115|}
{2010006001|XXGobject_psameas_object|198|0|328|0|{out_metadata|out0_metadata|0|0|}101|115|}
{2010006001|XXGobject_psameas_object|199|0|329|0|{reject_metadata|out0_metadata|0|0|}101|115|}
{2010601001|XXGgraph_vertex_vertex|200|0|330|0|{RFMT_Create_hash_on_NK|}95|115|}
{2010601001|XXGgraph_vertex_vertex|201|0|331|0|{Sort_on_ICFF_KEY|}95|131|}
{2010212001|XXGvertex_oport_oport|202|0|333|0|{0|out|}131|132|}
{2010213001|XXGoport_dst_flow|203|0|335|0|{0|}132|98|}
{2010211001|XXGvertex_iport_iport|204|0|336|0|{0|in|}131|133|}
{2010214001|XXGiport_src_flow|205|0|338|0|{0|}133|100|}
{2010007001|XXGobject_proto_object|206|0|339|0|{}131|134|}
{2010212001|XXGvertex_oport_oport|207|0|341|0|{0|out|}134|135|}
{2010006001|XXGobject_psameas_object|208|0|343|0|{metadata|out_metadata|1|0|}135|134|}
{2010211001|XXGvertex_iport_iport|209|0|344|0|{0|in|}134|136|}
{2010006001|XXGobject_psameas_object|210|0|346|0|{metadata|in_metadata|1|0|}136|134|}
{2010006001|XXGobject_psameas_object|211|0|347|0|{Layout|Layout|0|0|}131|39|}
{2010006001|XXGobject_psameas_object|212|0|348|0|{in_metadata|out0_metadata|0|0|}131|115|}
{2010006001|XXGobject_psameas_object|213|0|349|0|{out_metadata|out0_metadata|0|0|}131|115|}
{2010601001|XXGgraph_vertex_vertex|214|0|350|0|{Sort_within_Groups_1|}95|137|}
{2010212001|XXGvertex_oport_oport|215|0|352|0|{0|out|}137|138|}
{2010213001|XXGoport_dst_flow|216|0|354|0|{0|}138|99|}
{2010211001|XXGvertex_iport_iport|217|0|355|0|{0|in|}137|139|}
{2010214001|XXGiport_src_flow|218|0|357|0|{0|}139|98|}
{2010007001|XXGobject_proto_object|219|0|358|0|{}137|140|}
{2010212001|XXGvertex_oport_oport|220|0|360|0|{0|out|}140|141|}
{2010006001|XXGobject_psameas_object|221|0|362|0|{metadata|out_metadata|1|0|}141|140|}
{2010211001|XXGvertex_iport_iport|222|0|363|0|{0|in|}140|142|}
{2010006001|XXGobject_psameas_object|223|0|365|0|{metadata|in_metadata|1|0|}142|140|}
{2010006001|XXGobject_psameas_object|224|0|366|0|{Layout|Layout|0|0|}137|39|}
{2010006001|XXGobject_psameas_object|225|0|367|0|{in_metadata|out0_metadata|0|0|}137|115|}
{2010006001|XXGobject_psameas_object|226|0|368|0|{out_metadata|out0_metadata|0|0|}137|115|}
{2010212001|XXGvertex_oport_oport|227|0|369|0|{0|out0|}95|143|}
{2010216002|XXGoport_binding_oport|228|0|371|0|{.5|.5|{0|}15132|}143|102|}
{2010213001|XXGoport_dst_flow|229|0|372|0|{0|}143|17|}
{2010211001|XXGvertex_iport_iport|230|0|373|0|{0|in0|}95|144|}
{2010215002|XXGiport_binding_iport|231|0|375|0|{.5|.5|{0|}15131|}144|120|}
{2010214001|XXGiport_src_flow|232|0|376|0|{0|}144|14|}
{2010601001|XXGgraph_vertex_vertex|233|0|377|0|{Existing_IDS_ICFF|}1|66|}
{2010601001|XXGgraph_vertex_vertex|234|0|378|0|{Filter_by_Expression_1|}1|145|}
{2010212001|XXGvertex_oport_oport|235|0|380|0|{0|out|}145|146|}
{2010213001|XXGoport_dst_flow|236|0|382|0|{0|}146|14|}
{2010212001|XXGvertex_oport_oport|237|0|383|0|{1|deselect|}145|147|}
{2010212001|XXGvertex_oport_oport|238|0|385|0|{2|reject|}145|148|}
{2010212001|XXGvertex_oport_oport|239|0|387|0|{3|error|}145|149|}
{2010212001|XXGvertex_oport_oport|240|0|389|0|{4|log|}145|150|}
{2010211001|XXGvertex_iport_iport|241|0|391|0|{0|in|}145|151|}
{2010214001|XXGiport_src_flow|242|0|393|0|{0|}151|18|}
{2010007001|XXGobject_proto_object|243|0|394|0|{}145|152|}
{2010212001|XXGvertex_oport_oport|244|0|396|0|{0|out|}152|153|}
{2010006001|XXGobject_psameas_object|245|0|398|0|{metadata|out_metadata|1|0|}153|152|}
{2010212001|XXGvertex_oport_oport|246|0|399|0|{1|deselect|}152|154|}
{2010006001|XXGobject_psameas_object|247|0|401|0|{metadata|deselect_metadata|1|0|}154|152|}
{2010212001|XXGvertex_oport_oport|248|0|402|0|{2|reject|}152|155|}
{2010006001|XXGobject_psameas_object|249|0|404|0|{metadata|reject_metadata|1|0|}155|152|}
{2010212001|XXGvertex_oport_oport|250|0|405|0|{3|error|}152|156|}
{2010006001|XXGobject_psameas_object|251|0|407|0|{metadata|error_metadata|1|0|}156|152|}
{2010212001|XXGvertex_oport_oport|252|0|408|0|{4|log|}152|157|}
{2010006001|XXGobject_psameas_object|253|0|410|0|{metadata|log_metadata|1|0|}157|152|}
{2010211001|XXGvertex_iport_iport|254|0|411|0|{0|in|}152|158|}
{2010006001|XXGobject_psameas_object|255|0|413|0|{metadata|in_metadata|1|0|}158|152|}
{2010006001|XXGobject_psameas_object|256|0|414|0|{Layout|Layout|0|0|}145|39|}
{2010006001|XXGobject_psameas_object|257|0|415|0|{deselect_metadata|read_metadata|0|0|}145|127|}
{2010006001|XXGobject_psameas_object|258|0|416|0|{in_metadata|read_metadata|0|0|}145|127|}
{2010006001|XXGobject_psameas_object|259|0|417|0|{out_metadata|read_metadata|0|0|}145|127|}
{2010006001|XXGobject_psameas_object|260|0|418|0|{reject_metadata|read_metadata|0|0|}145|127|}
{2010601001|XXGgraph_vertex_vertex|261|0|419|0|{Filter_by_Expression_2|}1|159|}
{2010212001|XXGvertex_oport_oport|262|0|421|0|{0|out|}159|160|}
{2010213001|XXGoport_dst_flow|263|0|423|0|{0|}160|13|}
{2010212001|XXGvertex_oport_oport|264|0|424|0|{1|deselect|}159|161|}
{2010212001|XXGvertex_oport_oport|265|0|426|0|{2|reject|}159|162|}
{2010212001|XXGvertex_oport_oport|266|0|428|0|{3|error|}159|163|}
{2010212001|XXGvertex_oport_oport|267|0|430|0|{4|log|}159|164|}
{2010211001|XXGvertex_iport_iport|268|0|432|0|{0|in|}159|165|}
{2010214001|XXGiport_src_flow|269|0|434|0|{0|}165|9|}
{2010007001|XXGobject_proto_object|270|0|435|0|{}159|166|}
{2010212001|XXGvertex_oport_oport|271|0|437|0|{0|out|}166|167|}
{2010006001|XXGobject_psameas_object|272|0|439|0|{metadata|out_metadata|1|0|}167|166|}
{2010212001|XXGvertex_oport_oport|273|0|440|0|{1|deselect|}166|168|}
{2010006001|XXGobject_psameas_object|274|0|442|0|{metadata|deselect_metadata|1|0|}168|166|}
{2010212001|XXGvertex_oport_oport|275|0|443|0|{2|reject|}166|169|}
{2010006001|XXGobject_psameas_object|276|0|445|0|{metadata|reject_metadata|1|0|}169|166|}
{2010212001|XXGvertex_oport_oport|277|0|446|0|{3|error|}166|170|}
{2010006001|XXGobject_psameas_object|278|0|448|0|{metadata|error_metadata|1|0|}170|166|}
{2010212001|XXGvertex_oport_oport|279|0|449|0|{4|log|}166|171|}
{2010006001|XXGobject_psameas_object|280|0|451|0|{metadata|log_metadata|1|0|}171|166|}
{2010211001|XXGvertex_iport_iport|281|0|452|0|{0|in|}166|172|}
{2010006001|XXGobject_psameas_object|282|0|454|0|{metadata|in_metadata|1|0|}172|166|}
{2010006001|XXGobject_psameas_object|283|0|455|0|{Layout|Layout|0|0|}159|39|}
{2010006001|XXGobject_psameas_object|284|0|456|0|{deselect_metadata|read_metadata|0|0|}159|66|}
{2010006001|XXGobject_psameas_object|285|0|457|0|{in_metadata|read_metadata|0|0|}159|66|}
{2010006001|XXGobject_psameas_object|286|0|458|0|{out_metadata|read_metadata|0|0|}159|66|}
{2010006001|XXGobject_psameas_object|287|0|459|0|{reject_metadata|read_metadata|0|0|}159|66|}
{2010601001|XXGgraph_vertex_vertex|288|0|460|0|{Input_File_Archive|}1|127|}
{2010601001|XXGgraph_vertex_vertex|289|0|461|0|{Merge|}1|173|}
{2010212001|XXGvertex_oport_oport|290|0|463|0|{0|out|}173|174|}
{2010213001|XXGoport_dst_flow|291|0|465|0|{0|}174|15|}
{2010211001|XXGvertex_iport_iport|292|0|466|0|{0|in|}173|175|}
{2010214001|XXGiport_src_flow|293|0|468|0|{0|}175|16|}
{2010214001|XXGiport_src_flow|294|0|469|0|{1|}175|17|}
{2010007001|XXGobject_proto_object|295|0|470|0|{}173|176|}
{2010212001|XXGvertex_oport_oport|296|0|472|0|{0|out|}176|177|}
{2010006001|XXGobject_psameas_object|297|0|474|0|{metadata|out_metadata|1|0|}177|176|}
{2010211001|XXGvertex_iport_iport|298|0|475|0|{0|in|}176|178|}
{2010006001|XXGobject_psameas_object|299|0|477|0|{metadata|in_metadata|1|0|}178|176|}
{2010006001|XXGobject_psameas_object|300|0|478|0|{Layout|Layout|0|0|}173|39|}
{2010006001|XXGobject_psameas_object|301|0|479|0|{in_metadata|out0_metadata|0|0|}173|54|}
{2010006001|XXGobject_psameas_object|302|0|480|0|{out_metadata|out0_metadata|0|0|}173|54|}
{2010601001|XXGgraph_vertex_vertex|303|0|481|0|{Optional_Clean|}1|74|}
{2010601001|XXGgraph_vertex_vertex|304|0|482|0|{Optional_Lookup|}1|179|}
{2010211001|XXGvertex_iport_iport|305|0|484|0|{0|write|}179|180|}
{2010214001|XXGiport_src_flow|306|0|486|0|{0|}180|12|}
{2010007001|XXGobject_proto_object|307|0|487|0|{}179|181|}
{2010211001|XXGvertex_iport_iport|308|0|489|0|{0|write|}181|182|}
{2010006001|XXGobject_psameas_object|309|0|491|0|{metadata|write_metadata|1|0|}182|181|}
{2010601001|XXGgraph_vertex_vertex|310|0|492|0|{Optional_Source|}1|70|}
{2010601001|XXGgraph_vertex_vertex|311|0|493|0|{Prepare_Output|}1|183|}
{2010605001|XXGgraph_legend_legend|312|0|495|0|{0|}183|184|}
{2010241001|XXGlegend_face_face|313|0|497|0|{}184|185|}
{2010605001|XXGgraph_legend_legend|314|0|499|0|{1|}183|186|}
{2010241001|XXGlegend_face_face|315|0|501|0|{}186|187|}
{2010605001|XXGgraph_legend_legend|316|0|503|0|{2|}183|188|}
{2010241001|XXGlegend_face_face|317|0|505|0|{}188|189|}
{2010605001|XXGgraph_legend_legend|318|0|507|0|{3|}183|190|}
{2010241001|XXGlegend_face_face|319|0|509|0|{}190|191|}
{2010604001|XXGgraph_flow_flow|320|0|511|0|{Flow_1|}183|45|}
{2010604001|XXGgraph_flow_flow|321|0|512|0|{Flow_2|}183|43|}
{2010604001|XXGgraph_flow_flow|322|0|513|0|{Flow_3|}183|192|}
{2010604001|XXGgraph_flow_flow|323|0|515|0|{Flow_4|}183|80|}
{2010604001|XXGgraph_flow_flow|324|0|516|0|{Flow_5|}183|193|}
{2010604001|XXGgraph_flow_flow|325|0|518|0|{Flow_6|}183|194|}
{2010604001|XXGgraph_flow_flow|326|0|520|0|{Flow_7|}183|41|}
{2010604001|XXGgraph_flow_flow|327|0|521|0|{Flow_8|}183|195|}
{2010601001|XXGgraph_vertex_vertex|328|0|523|0|{Copy_Out|}183|196|}
{2010212001|XXGvertex_oport_oport|329|0|525|0|{0|out|}196|197|}
{2010211001|XXGvertex_iport_iport|330|0|527|0|{0|in|}196|198|}
{2010214001|XXGiport_src_flow|331|0|529|0|{0|}198|41|}
{2010006001|XXGobject_psameas_object|332|0|530|0|{Layout|Layout|0|0|}196|70|}
{2010006001|XXGobject_psameas_object|333|0|531|0|{in_metadata|write_metadata|0|0|}196|70|}
{2010006001|XXGobject_psameas_object|334|0|532|0|{out_metadata|write_metadata|0|0|}196|70|}
{2010601001|XXGgraph_vertex_vertex|335|0|533|0|{Copy_Out_|}183|199|}
{2010212001|XXGvertex_oport_oport|336|0|535|0|{0|out|}199|200|}
{2010211001|XXGvertex_iport_iport|337|0|537|0|{0|in|}199|201|}
{2010214001|XXGiport_src_flow|338|0|539|0|{0|}201|43|}
{2010006001|XXGobject_psameas_object|339|0|540|0|{Layout|Layout|0|0|}199|74|}
{2010006001|XXGobject_psameas_object|340|0|541|0|{in_metadata|write_metadata|0|0|}199|74|}
{2010006001|XXGobject_psameas_object|341|0|542|0|{out_metadata|write_metadata|0|0|}199|74|}
{2010601001|XXGgraph_vertex_vertex|342|0|543|0|{Dedup_and_Fix_Intervals|}183|202|}
{2010605001|XXGgraph_legend_legend|343|0|545|0|{0|}202|203|}
{2010241001|XXGlegend_face_face|344|0|547|0|{}203|204|}
{2010605001|XXGgraph_legend_legend|345|0|549|0|{1|}202|205|}
{2010241001|XXGlegend_face_face|346|0|551|0|{}205|206|}
{2010605001|XXGgraph_legend_legend|347|0|553|0|{2|}202|207|}
{2010241001|XXGlegend_face_face|348|0|555|0|{}207|208|}
{2010605001|XXGgraph_legend_legend|349|0|557|0|{3|}202|209|}
{2010241001|XXGlegend_face_face|350|0|559|0|{}209|210|}
{2010605001|XXGgraph_legend_legend|351|0|561|0|{4|}202|211|}
{2010241001|XXGlegend_face_face|352|0|563|0|{}211|212|}
{2010604001|XXGgraph_flow_flow|353|0|565|0|{Flow_1|}202|213|}
{2010604001|XXGgraph_flow_flow|354|0|567|0|{Flow_2|}202|214|}
{2010604001|XXGgraph_flow_flow|355|0|569|0|{Flow_3|}202|215|}
{2010604001|XXGgraph_flow_flow|356|0|571|0|{Flow_4|}202|216|}
{2010604001|XXGgraph_flow_flow|357|0|573|0|{Flow_6|}202|217|}
{2010604001|XXGgraph_flow_flow|358|0|575|0|{Flow_7|}202|218|}
{2010601001|XXGgraph_vertex_vertex|359|0|577|0|{Dedup_by_NK_Eff_Date|}202|219|}
{2010212001|XXGvertex_oport_oport|360|0|579|0|{0|out|}219|220|}
{2010213001|XXGoport_dst_flow|361|0|581|0|{0|}220|215|}
{2010212001|XXGvertex_oport_oport|362|0|582|0|{1|dup|}219|221|}
{2010212001|XXGvertex_oport_oport|363|0|584|0|{2|reject|}219|222|}
{2010212001|XXGvertex_oport_oport|364|0|586|0|{3|error|}219|223|}
{2010212001|XXGvertex_oport_oport|365|0|588|0|{4|log|}219|224|}
{2010211001|XXGvertex_iport_iport|366|0|590|0|{0|in|}219|225|}
{2010214001|XXGiport_src_flow|367|0|592|0|{0|}225|213|}
{2010006001|XXGobject_psameas_object|368|0|593|0|{Layout|Layout|0|0|}219|78|}
{2010006001|XXGobject_psameas_object|369|0|594|0|{dup_metadata|write_metadata|0|0|}219|78|}
{2010006001|XXGobject_psameas_object|370|0|595|0|{in_metadata|write_metadata|0|0|}219|78|}
{2010006001|XXGobject_psameas_object|371|0|596|0|{out_metadata|write_metadata|0|0|}219|78|}
{2010006001|XXGobject_psameas_object|372|0|597|0|{reject_metadata|write_metadata|0|0|}219|78|}
{2010601001|XXGgraph_vertex_vertex|373|0|598|0|{Parition_by_Related_or_NK|}202|226|}
{2010212001|XXGvertex_oport_oport|374|0|600|0|{0|out|}226|227|}
{2010213001|XXGoport_dst_flow|375|0|602|0|{0|}227|214|}
{2010211001|XXGvertex_iport_iport|376|0|603|0|{0|in|}226|228|}
{2010006001|XXGobject_psameas_object|377|0|605|0|{Layout|Layout|0|0|}226|39|}
{2010006001|XXGobject_psameas_object|378|0|606|0|{out_metadata|write_metadata|0|0|}226|78|}
{2010601001|XXGgraph_vertex_vertex|379|0|607|0|{Replicate|}202|229|}
{2010212001|XXGvertex_oport_oport|380|0|609|0|{0|out|}229|230|}
{2010211001|XXGvertex_iport_iport|381|0|611|0|{0|in|}229|231|}
{2010214001|XXGiport_src_flow|382|0|613|0|{0|}231|218|}
{2010006001|XXGobject_psameas_object|383|0|614|0|{Layout|Layout|0|0|}229|78|}
{2010006001|XXGobject_psameas_object|384|0|615|0|{in_metadata|write_metadata|0|0|}229|179|}
{2010006001|XXGobject_psameas_object|385|0|616|0|{out_metadata|write_metadata|0|0|}229|179|}
{2010601001|XXGgraph_vertex_vertex|386|0|617|0|{Rollup_Adjoining_Eff_Dates|}202|232|}
{2010212001|XXGvertex_oport_oport|387|0|619|0|{0|out|}232|233|}
{2010213001|XXGoport_dst_flow|388|0|621|0|{0|}233|218|}
{2010212001|XXGvertex_oport_oport|389|0|622|0|{1|reject|}232|234|}
{2010212001|XXGvertex_oport_oport|390|0|624|0|{2|error|}232|235|}
{2010212001|XXGvertex_oport_oport|391|0|626|0|{3|log|}232|236|}
{2010211001|XXGvertex_iport_iport|392|0|628|0|{0|in|}232|237|}
{2010214001|XXGiport_src_flow|393|0|630|0|{0|}237|217|}
{2010006001|XXGobject_psameas_object|394|0|631|0|{Layout|Layout|0|0|}232|78|}
{2010006001|XXGobject_psameas_object|395|0|632|0|{in_metadata|write_metadata|0|0|}232|78|}
{2010006001|XXGobject_psameas_object|396|0|633|0|{out_metadata|write_metadata|0|0|}232|78|}
{2010006001|XXGobject_psameas_object|397|0|634|0|{reject_metadata|write_metadata|0|0|}232|78|}
{2010601001|XXGgraph_vertex_vertex|398|0|635|0|{Scan_to_Fix_Overlapping_Dates|}202|238|}
{2010212001|XXGvertex_oport_oport|399|0|637|0|{0|out|}238|239|}
{2010213001|XXGoport_dst_flow|400|0|639|0|{0|}239|216|}
{2010212001|XXGvertex_oport_oport|401|0|640|0|{1|reject|}238|240|}
{2010212001|XXGvertex_oport_oport|402|0|642|0|{2|error|}238|241|}
{2010212001|XXGvertex_oport_oport|403|0|644|0|{3|log|}238|242|}
{2010211001|XXGvertex_iport_iport|404|0|646|0|{0|in|}238|243|}
{2010214001|XXGiport_src_flow|405|0|648|0|{0|}243|215|}
{2010006001|XXGobject_psameas_object|406|0|649|0|{Layout|Layout|0|0|}238|78|}
{2010006001|XXGobject_psameas_object|407|0|650|0|{in_metadata|write_metadata|0|0|}238|78|}
{2010006001|XXGobject_psameas_object|408|0|651|0|{out_metadata|write_metadata|0|0|}238|78|}
{2010006001|XXGobject_psameas_object|409|0|652|0|{reject_metadata|write_metadata|0|0|}238|78|}
{2010601001|XXGgraph_vertex_vertex|410|0|653|0|{Sort_for_Dedup|}202|244|}
{2010212001|XXGvertex_oport_oport|411|0|655|0|{0|out|}244|245|}
{2010213001|XXGoport_dst_flow|412|0|657|0|{0|}245|213|}
{2010211001|XXGvertex_iport_iport|413|0|658|0|{0|in|}244|246|}
{2010214001|XXGiport_src_flow|414|0|660|0|{0|}246|214|}
{2010006001|XXGobject_psameas_object|415|0|661|0|{Layout|Layout|0|0|}244|78|}
{2010006001|XXGobject_psameas_object|416|0|662|0|{in_metadata|write_metadata|0|0|}244|78|}
{2010006001|XXGobject_psameas_object|417|0|663|0|{out_metadata|write_metadata|0|0|}244|78|}
{2010601001|XXGgraph_vertex_vertex|418|0|664|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}202|247|}
{2010212001|XXGvertex_oport_oport|419|0|666|0|{0|out|}247|248|}
{2010213001|XXGoport_dst_flow|420|0|668|0|{0|}248|217|}
{2010211001|XXGvertex_iport_iport|421|0|669|0|{0|in|}247|249|}
{2010214001|XXGiport_src_flow|422|0|671|0|{0|}249|216|}
{2010006001|XXGobject_psameas_object|423|0|672|0|{Layout|Layout|0|0|}247|78|}
{2010006001|XXGobject_psameas_object|424|0|673|0|{in_metadata|write_metadata|0|0|}247|78|}
{2010006001|XXGobject_psameas_object|425|0|674|0|{out_metadata|write_metadata|0|0|}247|78|}
{2010212001|XXGvertex_oport_oport|426|0|675|0|{0|out|}202|250|}
{2010216002|XXGoport_binding_oport|427|0|677|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6837|}250|230|}
{2010213001|XXGoport_dst_flow|428|0|678|0|{0|}250|192|}
{2010213001|XXGoport_dst_flow|429|0|679|0|{1|}250|194|}
{2010212001|XXGvertex_oport_oport|430|0|680|0|{1|dups|}202|251|}
{2010216002|XXGoport_binding_oport|431|0|682|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6838|}251|221|}
{2010213001|XXGoport_dst_flow|432|0|683|0|{0|}251|80|}
{2010211001|XXGvertex_iport_iport|433|0|684|0|{0|in|}202|252|}
{2010215002|XXGiport_binding_iport|434|0|686|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6836|}252|228|}
{2010214001|XXGiport_src_flow|435|0|687|0|{0|}252|45|}
{2010006001|XXGobject_psameas_object|436|0|688|0|{INPUT_DML|write_metadata|0|0|}202|78|}
{2010601001|XXGgraph_vertex_vertex|437|0|689|0|{Dups|}183|78|}
{2010601001|XXGgraph_vertex_vertex|438|0|690|0|{Gather|}183|253|}
{2010212001|XXGvertex_oport_oport|439|0|692|0|{0|out|}253|254|}
{2010213001|XXGoport_dst_flow|440|0|694|0|{0|}254|195|}
{2010211001|XXGvertex_iport_iport|441|0|695|0|{0|in|}253|255|}
{2010214001|XXGiport_src_flow|442|0|697|0|{0|}255|194|}
{2010006001|XXGobject_psameas_object|443|0|698|0|{in_metadata|write_metadata|0|0|}253|179|}
{2010006001|XXGobject_psameas_object|444|0|699|0|{out_metadata|write_metadata|0|0|}253|179|}
{2010601001|XXGgraph_vertex_vertex|445|0|700|0|{Gather_|}183|256|}
{2010212001|XXGvertex_oport_oport|446|0|702|0|{0|out|}256|257|}
{2010211001|XXGvertex_iport_iport|447|0|704|0|{0|in|}256|258|}
{2010214001|XXGiport_src_flow|448|0|706|0|{0|}258|193|}
{2010214001|XXGiport_src_flow|449|0|707|0|{1|}258|195|}
{2010006001|XXGobject_psameas_object|450|0|708|0|{Layout|Layout|0|0|}256|179|}
{2010006001|XXGobject_psameas_object|451|0|709|0|{in_metadata|write_metadata|0|0|}256|179|}
{2010006001|XXGobject_psameas_object|452|0|710|0|{out_metadata|write_metadata|0|0|}256|179|}
{2010601001|XXGgraph_vertex_vertex|453|0|711|0|{Map_to_Output|}183|39|}
{2010601001|XXGgraph_vertex_vertex|454|0|712|0|{Merge|}183|259|}
{2010212001|XXGvertex_oport_oport|455|0|714|0|{0|out|}259|260|}
{2010213001|XXGoport_dst_flow|456|0|716|0|{0|}260|193|}
{2010211001|XXGvertex_iport_iport|457|0|717|0|{0|in|}259|261|}
{2010214001|XXGiport_src_flow|458|0|719|0|{0|}261|192|}
{2010006001|XXGobject_psameas_object|459|0|720|0|{in_metadata|write_metadata|0|0|}259|179|}
{2010006001|XXGobject_psameas_object|460|0|721|0|{out_metadata|write_metadata|0|0|}259|179|}
{2010212001|XXGvertex_oport_oport|461|0|722|0|{0|source|}183|262|}
{2010216002|XXGoport_binding_oport|462|0|724|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9938|}262|197|}
{2010213001|XXGoport_dst_flow|463|0|725|0|{0|}262|10|}
{2010212001|XXGvertex_oport_oport|464|0|726|0|{1|clean|}183|263|}
{2010216002|XXGoport_binding_oport|465|0|728|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9939|}263|200|}
{2010213001|XXGoport_dst_flow|466|0|729|0|{0|}263|11|}
{2010212001|XXGvertex_oport_oport|467|0|730|0|{2|lookup|}183|264|}
{2010216002|XXGoport_binding_oport|468|0|732|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9940|}264|257|}
{2010213001|XXGoport_dst_flow|469|0|733|0|{0|}264|12|}
{2010211001|XXGvertex_iport_iport|470|0|734|0|{0|in0|}183|265|}
{2010215002|XXGiport_binding_iport|471|0|736|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9937|}265|53|}
{2010214001|XXGiport_src_flow|472|0|737|0|{0|}265|15|}
{2010007001|XXGobject_proto_object|473|0|738|0|{}183|266|}
{2010605001|XXGgraph_legend_legend|474|0|740|0|{0|}266|267|}
{2010241001|XXGlegend_face_face|475|0|742|0|{}267|268|}
{2010605001|XXGgraph_legend_legend|476|0|744|0|{1|}266|269|}
{2010241001|XXGlegend_face_face|477|0|746|0|{}269|270|}
{2010605001|XXGgraph_legend_legend|478|0|748|0|{2|}266|271|}
{2010241001|XXGlegend_face_face|479|0|750|0|{}271|272|}
{2010605001|XXGgraph_legend_legend|480|0|752|0|{3|}266|273|}
{2010241001|XXGlegend_face_face|481|0|754|0|{}273|274|}
{2010604001|XXGgraph_flow_flow|482|0|756|0|{Flow_1|}266|275|}
{2010604001|XXGgraph_flow_flow|483|0|758|0|{Flow_2|}266|276|}
{2010604001|XXGgraph_flow_flow|484|0|760|0|{Flow_3|}266|277|}
{2010604001|XXGgraph_flow_flow|485|0|762|0|{Flow_4|}266|278|}
{2010604001|XXGgraph_flow_flow|486|0|764|0|{Flow_5|}266|279|}
{2010604001|XXGgraph_flow_flow|487|0|766|0|{Flow_6|}266|280|}
{2010604001|XXGgraph_flow_flow|488|0|768|0|{Flow_7|}266|281|}
{2010604001|XXGgraph_flow_flow|489|0|770|0|{Flow_8|}266|282|}
{2010601001|XXGgraph_vertex_vertex|490|0|772|0|{Copy_Out|}266|283|}
{2010212001|XXGvertex_oport_oport|491|0|774|0|{0|out|}283|284|}
{2010211001|XXGvertex_iport_iport|492|0|776|0|{0|in|}283|285|}
{2010214001|XXGiport_src_flow|493|0|778|0|{0|}285|281|}
{2010007001|XXGobject_proto_object|494|0|779|0|{}283|286|}
{2010212001|XXGvertex_oport_oport|495|0|781|0|{0|out|}286|287|}
{2010006001|XXGobject_psameas_object|496|0|783|0|{metadata|out_metadata|1|0|}287|286|}
{2010211001|XXGvertex_iport_iport|497|0|784|0|{0|in|}286|288|}
{2010006001|XXGobject_psameas_object|498|0|786|0|{metadata|in_metadata|1|0|}288|286|}
{2010601001|XXGgraph_vertex_vertex|499|0|787|0|{Copy_Out_|}266|289|}
{2010212001|XXGvertex_oport_oport|500|0|789|0|{0|out|}289|290|}
{2010211001|XXGvertex_iport_iport|501|0|791|0|{0|in|}289|291|}
{2010214001|XXGiport_src_flow|502|0|793|0|{0|}291|276|}
{2010007001|XXGobject_proto_object|503|0|794|0|{}289|292|}
{2010212001|XXGvertex_oport_oport|504|0|796|0|{0|out|}292|293|}
{2010006001|XXGobject_psameas_object|505|0|798|0|{metadata|out_metadata|1|0|}293|292|}
{2010211001|XXGvertex_iport_iport|506|0|799|0|{0|in|}292|294|}
{2010006001|XXGobject_psameas_object|507|0|801|0|{metadata|in_metadata|1|0|}294|292|}
{2010601001|XXGgraph_vertex_vertex|508|0|802|0|{Dedup_and_Fix_Intervals|}266|295|}
{2010605001|XXGgraph_legend_legend|509|0|804|0|{0|}295|296|}
{2010241001|XXGlegend_face_face|510|0|806|0|{}296|297|}
{2010605001|XXGgraph_legend_legend|511|0|808|0|{1|}295|298|}
{2010241001|XXGlegend_face_face|512|0|810|0|{}298|299|}
{2010605001|XXGgraph_legend_legend|513|0|812|0|{2|}295|300|}
{2010241001|XXGlegend_face_face|514|0|814|0|{}300|301|}
{2010605001|XXGgraph_legend_legend|515|0|816|0|{3|}295|302|}
{2010241001|XXGlegend_face_face|516|0|818|0|{}302|303|}
{2010605001|XXGgraph_legend_legend|517|0|820|0|{4|}295|304|}
{2010241001|XXGlegend_face_face|518|0|822|0|{}304|305|}
{2010604001|XXGgraph_flow_flow|519|0|824|0|{Flow_1|}295|306|}
{2010604001|XXGgraph_flow_flow|520|0|826|0|{Flow_2|}295|307|}
{2010604001|XXGgraph_flow_flow|521|0|828|0|{Flow_3|}295|308|}
{2010604001|XXGgraph_flow_flow|522|0|830|0|{Flow_4|}295|309|}
{2010604001|XXGgraph_flow_flow|523|0|832|0|{Flow_6|}295|310|}
{2010604001|XXGgraph_flow_flow|524|0|834|0|{Flow_7|}295|311|}
{2010601001|XXGgraph_vertex_vertex|525|0|836|0|{Dedup_by_NK_Eff_Date|}295|312|}
{2010212001|XXGvertex_oport_oport|526|0|838|0|{0|out|}312|313|}
{2010213001|XXGoport_dst_flow|527|0|840|0|{0|}313|308|}
{2010212001|XXGvertex_oport_oport|528|0|841|0|{1|dup|}312|314|}
{2010212001|XXGvertex_oport_oport|529|0|843|0|{2|reject|}312|315|}
{2010212001|XXGvertex_oport_oport|530|0|845|0|{3|error|}312|316|}
{2010212001|XXGvertex_oport_oport|531|0|847|0|{4|log|}312|317|}
{2010211001|XXGvertex_iport_iport|532|0|849|0|{0|in|}312|318|}
{2010214001|XXGiport_src_flow|533|0|851|0|{0|}318|306|}
{2010601001|XXGgraph_vertex_vertex|534|0|852|0|{Parition_by_Related_or_NK|}295|319|}
{2010212001|XXGvertex_oport_oport|535|0|854|0|{0|out|}319|320|}
{2010213001|XXGoport_dst_flow|536|0|856|0|{0|}320|307|}
{2010211001|XXGvertex_iport_iport|537|0|857|0|{0|in|}319|321|}
{2010601001|XXGgraph_vertex_vertex|538|0|859|0|{Replicate|}295|322|}
{2010212001|XXGvertex_oport_oport|539|0|861|0|{0|out|}322|323|}
{2010211001|XXGvertex_iport_iport|540|0|863|0|{0|in|}322|324|}
{2010214001|XXGiport_src_flow|541|0|865|0|{0|}324|311|}
{2010601001|XXGgraph_vertex_vertex|542|0|866|0|{Rollup_Adjoining_Eff_Dates|}295|325|}
{2010212001|XXGvertex_oport_oport|543|0|868|0|{0|out|}325|326|}
{2010213001|XXGoport_dst_flow|544|0|870|0|{0|}326|311|}
{2010212001|XXGvertex_oport_oport|545|0|871|0|{1|reject|}325|327|}
{2010212001|XXGvertex_oport_oport|546|0|873|0|{2|error|}325|328|}
{2010212001|XXGvertex_oport_oport|547|0|875|0|{3|log|}325|329|}
{2010211001|XXGvertex_iport_iport|548|0|877|0|{0|in|}325|330|}
{2010214001|XXGiport_src_flow|549|0|879|0|{0|}330|310|}
{2010601001|XXGgraph_vertex_vertex|550|0|880|0|{Scan_to_Fix_Overlapping_Dates|}295|331|}
{2010212001|XXGvertex_oport_oport|551|0|882|0|{0|out|}331|332|}
{2010213001|XXGoport_dst_flow|552|0|884|0|{0|}332|309|}
{2010212001|XXGvertex_oport_oport|553|0|885|0|{1|reject|}331|333|}
{2010212001|XXGvertex_oport_oport|554|0|887|0|{2|error|}331|334|}
{2010212001|XXGvertex_oport_oport|555|0|889|0|{3|log|}331|335|}
{2010211001|XXGvertex_iport_iport|556|0|891|0|{0|in|}331|336|}
{2010214001|XXGiport_src_flow|557|0|893|0|{0|}336|308|}
{2010601001|XXGgraph_vertex_vertex|558|0|894|0|{Sort_for_Dedup|}295|337|}
{2010212001|XXGvertex_oport_oport|559|0|896|0|{0|out|}337|338|}
{2010213001|XXGoport_dst_flow|560|0|898|0|{0|}338|306|}
{2010211001|XXGvertex_iport_iport|561|0|899|0|{0|in|}337|339|}
{2010214001|XXGiport_src_flow|562|0|901|0|{0|}339|307|}
{2010601001|XXGgraph_vertex_vertex|563|0|902|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}295|340|}
{2010212001|XXGvertex_oport_oport|564|0|904|0|{0|out|}340|341|}
{2010213001|XXGoport_dst_flow|565|0|906|0|{0|}341|310|}
{2010211001|XXGvertex_iport_iport|566|0|907|0|{0|in|}340|342|}
{2010214001|XXGiport_src_flow|567|0|909|0|{0|}342|309|}
{2010212001|XXGvertex_oport_oport|568|0|910|0|{0|out|}295|343|}
{2010216002|XXGoport_binding_oport|569|0|912|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6837|}343|323|}
{2010213001|XXGoport_dst_flow|570|0|913|0|{0|}343|277|}
{2010213001|XXGoport_dst_flow|571|0|914|0|{1|}343|280|}
{2010212001|XXGvertex_oport_oport|572|0|915|0|{1|dups|}295|344|}
{2010216002|XXGoport_binding_oport|573|0|917|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6838|}344|314|}
{2010213001|XXGoport_dst_flow|574|0|918|0|{0|}344|278|}
{2010211001|XXGvertex_iport_iport|575|0|919|0|{0|in|}295|345|}
{2010215002|XXGiport_binding_iport|576|0|921|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6836|}345|321|}
{2010214001|XXGiport_src_flow|577|0|922|0|{0|}345|275|}
{2010007001|XXGobject_proto_object|578|0|923|0|{}295|346|}
{2010605001|XXGgraph_legend_legend|579|0|925|0|{0|}346|347|}
{2010241001|XXGlegend_face_face|580|0|927|0|{}347|348|}
{2010605001|XXGgraph_legend_legend|581|0|929|0|{1|}346|349|}
{2010241001|XXGlegend_face_face|582|0|931|0|{}349|350|}
{2010605001|XXGgraph_legend_legend|583|0|933|0|{2|}346|351|}
{2010241001|XXGlegend_face_face|584|0|935|0|{}351|352|}
{2010605001|XXGgraph_legend_legend|585|0|937|0|{3|}346|353|}
{2010241001|XXGlegend_face_face|586|0|939|0|{}353|354|}
{2010605001|XXGgraph_legend_legend|587|0|941|0|{4|}346|355|}
{2010241001|XXGlegend_face_face|588|0|943|0|{}355|356|}
{2010604001|XXGgraph_flow_flow|589|0|945|0|{Flow_1|}346|357|}
{2010604001|XXGgraph_flow_flow|590|0|947|0|{Flow_2|}346|358|}
{2010604001|XXGgraph_flow_flow|591|0|949|0|{Flow_3|}346|359|}
{2010604001|XXGgraph_flow_flow|592|0|951|0|{Flow_4|}346|360|}
{2010604001|XXGgraph_flow_flow|593|0|953|0|{Flow_6|}346|361|}
{2010604001|XXGgraph_flow_flow|594|0|955|0|{Flow_7|}346|362|}
{2010601001|XXGgraph_vertex_vertex|595|0|957|0|{Dedup_by_NK_Eff_Date|}346|363|}
{2010212001|XXGvertex_oport_oport|596|0|959|0|{0|out|}363|364|}
{2010213001|XXGoport_dst_flow|597|0|961|0|{0|}364|359|}
{2010212001|XXGvertex_oport_oport|598|0|962|0|{1|dup|}363|365|}
{2010212001|XXGvertex_oport_oport|599|0|964|0|{2|reject|}363|366|}
{2010212001|XXGvertex_oport_oport|600|0|966|0|{3|error|}363|367|}
{2010212001|XXGvertex_oport_oport|601|0|968|0|{4|log|}363|368|}
{2010211001|XXGvertex_iport_iport|602|0|970|0|{0|in|}363|369|}
{2010214001|XXGiport_src_flow|603|0|972|0|{0|}369|357|}
{2010007001|XXGobject_proto_object|604|0|973|0|{}363|370|}
{2010212001|XXGvertex_oport_oport|605|0|975|0|{0|out|}370|371|}
{2010006001|XXGobject_psameas_object|606|0|977|0|{metadata|out_metadata|1|0|}371|370|}
{2010212001|XXGvertex_oport_oport|607|0|978|0|{1|dup|}370|372|}
{2010006001|XXGobject_psameas_object|608|0|980|0|{metadata|dup_metadata|1|0|}372|370|}
{2010212001|XXGvertex_oport_oport|609|0|981|0|{2|reject|}370|373|}
{2010006001|XXGobject_psameas_object|610|0|983|0|{metadata|reject_metadata|1|0|}373|370|}
{2010212001|XXGvertex_oport_oport|611|0|984|0|{3|error|}370|374|}
{2010006001|XXGobject_psameas_object|612|0|986|0|{metadata|error_metadata|1|0|}374|370|}
{2010212001|XXGvertex_oport_oport|613|0|987|0|{4|log|}370|375|}
{2010006001|XXGobject_psameas_object|614|0|989|0|{metadata|log_metadata|1|0|}375|370|}
{2010211001|XXGvertex_iport_iport|615|0|990|0|{0|in|}370|376|}
{2010006001|XXGobject_psameas_object|616|0|992|0|{metadata|in_metadata|1|0|}376|370|}
{2010601001|XXGgraph_vertex_vertex|617|0|993|0|{Parition_by_Related_or_NK|}346|377|}
{2010212001|XXGvertex_oport_oport|618|0|995|0|{0|out|}377|378|}
{2010213001|XXGoport_dst_flow|619|0|997|0|{0|}378|358|}
{2010211001|XXGvertex_iport_iport|620|0|998|0|{0|in|}377|379|}
{2010007001|XXGobject_proto_object|621|0|1000|0|{}377|380|}
{2010212001|XXGvertex_oport_oport|622|0|1002|0|{0|out|}380|381|}
{2010006001|XXGobject_psameas_object|623|0|1004|0|{metadata|out_metadata|1|0|}381|380|}
{2010211001|XXGvertex_iport_iport|624|0|1005|0|{0|in|}380|382|}
{2010006001|XXGobject_psameas_object|625|0|1007|0|{metadata|in_metadata|1|0|}382|380|}
{2010006001|XXGobject_psameas_object|626|0|1008|0|{in_metadata|INPUT_DML|1|0|}377|346|}
{2010601001|XXGgraph_vertex_vertex|627|0|1009|0|{Replicate|}346|383|}
{2010212001|XXGvertex_oport_oport|628|0|1011|0|{0|out|}383|384|}
{2010211001|XXGvertex_iport_iport|629|0|1013|0|{0|in|}383|385|}
{2010214001|XXGiport_src_flow|630|0|1015|0|{0|}385|362|}
{2010007001|XXGobject_proto_object|631|0|1016|0|{}383|386|}
{2010212001|XXGvertex_oport_oport|632|0|1018|0|{0|out|}386|387|}
{2010006001|XXGobject_psameas_object|633|0|1020|0|{metadata|out_metadata|1|0|}387|386|}
{2010211001|XXGvertex_iport_iport|634|0|1021|0|{0|in|}386|388|}
{2010006001|XXGobject_psameas_object|635|0|1023|0|{metadata|in_metadata|1|0|}388|386|}
{2010601001|XXGgraph_vertex_vertex|636|0|1024|0|{Rollup_Adjoining_Eff_Dates|}346|389|}
{2010212001|XXGvertex_oport_oport|637|0|1026|0|{0|out|}389|390|}
{2010213001|XXGoport_dst_flow|638|0|1028|0|{0|}390|362|}
{2010212001|XXGvertex_oport_oport|639|0|1029|0|{1|reject|}389|391|}
{2010212001|XXGvertex_oport_oport|640|0|1031|0|{2|error|}389|392|}
{2010212001|XXGvertex_oport_oport|641|0|1033|0|{3|log|}389|393|}
{2010211001|XXGvertex_iport_iport|642|0|1035|0|{0|in|}389|394|}
{2010214001|XXGiport_src_flow|643|0|1037|0|{0|}394|361|}
{2010007001|XXGobject_proto_object|644|0|1038|0|{}389|395|}
{2010212001|XXGvertex_oport_oport|645|0|1040|0|{0|out|}395|396|}
{2010006001|XXGobject_psameas_object|646|0|1042|0|{metadata|out_metadata|1|0|}396|395|}
{2010212001|XXGvertex_oport_oport|647|0|1043|0|{1|reject|}395|397|}
{2010006001|XXGobject_psameas_object|648|0|1045|0|{metadata|reject_metadata|1|0|}397|395|}
{2010212001|XXGvertex_oport_oport|649|0|1046|0|{2|error|}395|398|}
{2010006001|XXGobject_psameas_object|650|0|1048|0|{metadata|error_metadata|1|0|}398|395|}
{2010212001|XXGvertex_oport_oport|651|0|1049|0|{3|log|}395|399|}
{2010006001|XXGobject_psameas_object|652|0|1051|0|{metadata|log_metadata|1|0|}399|395|}
{2010211001|XXGvertex_iport_iport|653|0|1052|0|{0|in|}395|400|}
{2010006001|XXGobject_psameas_object|654|0|1054|0|{metadata|in_metadata|1|0|}400|395|}
{2010601001|XXGgraph_vertex_vertex|655|0|1055|0|{Scan_to_Fix_Overlapping_Dates|}346|401|}
{2010212001|XXGvertex_oport_oport|656|0|1057|0|{0|out|}401|402|}
{2010213001|XXGoport_dst_flow|657|0|1059|0|{0|}402|360|}
{2010212001|XXGvertex_oport_oport|658|0|1060|0|{1|reject|}401|403|}
{2010212001|XXGvertex_oport_oport|659|0|1062|0|{2|error|}401|404|}
{2010212001|XXGvertex_oport_oport|660|0|1064|0|{3|log|}401|405|}
{2010211001|XXGvertex_iport_iport|661|0|1066|0|{0|in|}401|406|}
{2010214001|XXGiport_src_flow|662|0|1068|0|{0|}406|359|}
{2010007001|XXGobject_proto_object|663|0|1069|0|{}401|407|}
{2010212001|XXGvertex_oport_oport|664|0|1071|0|{0|out|}407|408|}
{2010006001|XXGobject_psameas_object|665|0|1073|0|{metadata|out_metadata|1|0|}408|407|}
{2010212001|XXGvertex_oport_oport|666|0|1074|0|{1|reject|}407|409|}
{2010006001|XXGobject_psameas_object|667|0|1076|0|{metadata|reject_metadata|1|0|}409|407|}
{2010212001|XXGvertex_oport_oport|668|0|1077|0|{2|error|}407|410|}
{2010006001|XXGobject_psameas_object|669|0|1079|0|{metadata|error_metadata|1|0|}410|407|}
{2010212001|XXGvertex_oport_oport|670|0|1080|0|{3|log|}407|411|}
{2010006001|XXGobject_psameas_object|671|0|1082|0|{metadata|log_metadata|1|0|}411|407|}
{2010211001|XXGvertex_iport_iport|672|0|1083|0|{0|in|}407|412|}
{2010006001|XXGobject_psameas_object|673|0|1085|0|{metadata|in_metadata|1|0|}412|407|}
{2010601001|XXGgraph_vertex_vertex|674|0|1086|0|{Sort_for_Dedup|}346|413|}
{2010212001|XXGvertex_oport_oport|675|0|1088|0|{0|out|}413|414|}
{2010213001|XXGoport_dst_flow|676|0|1090|0|{0|}414|357|}
{2010211001|XXGvertex_iport_iport|677|0|1091|0|{0|in|}413|415|}
{2010214001|XXGiport_src_flow|678|0|1093|0|{0|}415|358|}
{2010007001|XXGobject_proto_object|679|0|1094|0|{}413|416|}
{2010212001|XXGvertex_oport_oport|680|0|1096|0|{0|out|}416|417|}
{2010006001|XXGobject_psameas_object|681|0|1098|0|{metadata|out_metadata|1|0|}417|416|}
{2010211001|XXGvertex_iport_iport|682|0|1099|0|{0|in|}416|418|}
{2010006001|XXGobject_psameas_object|683|0|1101|0|{metadata|in_metadata|1|0|}418|416|}
{2010601001|XXGgraph_vertex_vertex|684|0|1102|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}346|419|}
{2010212001|XXGvertex_oport_oport|685|0|1104|0|{0|out|}419|420|}
{2010213001|XXGoport_dst_flow|686|0|1106|0|{0|}420|361|}
{2010211001|XXGvertex_iport_iport|687|0|1107|0|{0|in|}419|421|}
{2010214001|XXGiport_src_flow|688|0|1109|0|{0|}421|360|}
{2010007001|XXGobject_proto_object|689|0|1110|0|{}419|422|}
{2010212001|XXGvertex_oport_oport|690|0|1112|0|{0|out|}422|423|}
{2010006001|XXGobject_psameas_object|691|0|1114|0|{metadata|out_metadata|1|0|}423|422|}
{2010211001|XXGvertex_iport_iport|692|0|1115|0|{0|in|}422|424|}
{2010006001|XXGobject_psameas_object|693|0|1117|0|{metadata|in_metadata|1|0|}424|422|}
{2010212001|XXGvertex_oport_oport|694|0|1118|0|{0|out|}346|425|}
{2010216002|XXGoport_binding_oport|695|0|1120|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6831|}425|384|}
{2010212001|XXGvertex_oport_oport|696|0|1121|0|{1|dups|}346|426|}
{2010216002|XXGoport_binding_oport|697|0|1123|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6832|}426|365|}
{2010211001|XXGvertex_iport_iport|698|0|1124|0|{0|in|}346|427|}
{2010215002|XXGiport_binding_iport|699|0|1126|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6830|}427|379|}
{2010006001|XXGobject_psameas_object|700|0|1127|0|{FIX_EFFECTIVE_DATE|FIX_EFFECTIVE_DATE|1|0|}295|266|}
{2010006001|XXGobject_psameas_object|701|0|1128|0|{FIX_END_DATE|FIX_END_DATE|1|0|}295|266|}
{2010006001|XXGobject_psameas_object|702|0|1129|0|{INPUT_DML|write_metadata|0|0|}295|428|}
{2010211001|XXGvertex_iport_iport|703|0|1131|0|{0|write|}428|429|}
{2010214001|XXGiport_src_flow|704|0|1133|0|{0|}429|278|}
{2010007001|XXGobject_proto_object|705|0|1134|0|{}428|430|}
{2010211001|XXGvertex_iport_iport|706|0|1136|0|{0|write|}430|431|}
{2010006001|XXGobject_psameas_object|707|0|1138|0|{metadata|write_metadata|1|0|}431|430|}
{2010601001|XXGgraph_vertex_vertex|708|0|1139|0|{Dups|}266|428|}
{2010601001|XXGgraph_vertex_vertex|709|0|1140|0|{Gather|}266|432|}
{2010212001|XXGvertex_oport_oport|710|0|1142|0|{0|out|}432|433|}
{2010213001|XXGoport_dst_flow|711|0|1144|0|{0|}433|282|}
{2010211001|XXGvertex_iport_iport|712|0|1145|0|{0|in|}432|434|}
{2010214001|XXGiport_src_flow|713|0|1147|0|{0|}434|280|}
{2010007001|XXGobject_proto_object|714|0|1148|0|{}432|435|}
{2010212001|XXGvertex_oport_oport|715|0|1150|0|{0|out|}435|436|}
{2010006001|XXGobject_psameas_object|716|0|1152|0|{metadata|out_metadata|1|0|}436|435|}
{2010211001|XXGvertex_iport_iport|717|0|1153|0|{0|in|}435|437|}
{2010006001|XXGobject_psameas_object|718|0|1155|0|{metadata|in_metadata|1|0|}437|435|}
{2010601001|XXGgraph_vertex_vertex|719|0|1156|0|{Gather_|}266|438|}
{2010212001|XXGvertex_oport_oport|720|0|1158|0|{0|out|}438|439|}
{2010211001|XXGvertex_iport_iport|721|0|1160|0|{0|in|}438|440|}
{2010214001|XXGiport_src_flow|722|0|1162|0|{0|}440|279|}
{2010214001|XXGiport_src_flow|723|0|1163|0|{1|}440|282|}
{2010007001|XXGobject_proto_object|724|0|1164|0|{}438|441|}
{2010212001|XXGvertex_oport_oport|725|0|1166|0|{0|out|}441|442|}
{2010006001|XXGobject_psameas_object|726|0|1168|0|{metadata|out_metadata|1|0|}442|441|}
{2010211001|XXGvertex_iport_iport|727|0|1169|0|{0|in|}441|443|}
{2010006001|XXGobject_psameas_object|728|0|1171|0|{metadata|in_metadata|1|0|}443|441|}
{2010601001|XXGgraph_vertex_vertex|729|0|1172|0|{Map_to_Output|}266|444|}
{2010212001|XXGvertex_oport_oport|730|0|1174|0|{0|source|}444|445|}
{2010213001|XXGoport_dst_flow|731|0|1176|0|{0|}445|281|}
{2010212001|XXGvertex_oport_oport|732|0|1177|0|{1|clean|}444|446|}
{2010213001|XXGoport_dst_flow|733|0|1179|0|{0|}446|276|}
{2010212001|XXGvertex_oport_oport|734|0|1180|0|{2|lkp|}444|447|}
{2010213001|XXGoport_dst_flow|735|0|1182|0|{0|}447|275|}
{2010212001|XXGvertex_oport_oport|736|0|1183|0|{3|reject0|}444|448|}
{2010212001|XXGvertex_oport_oport|737|0|1185|0|{4|reject1|}444|449|}
{2010212001|XXGvertex_oport_oport|738|0|1187|0|{5|reject2|}444|450|}
{2010212001|XXGvertex_oport_oport|739|0|1189|0|{6|error0|}444|451|}
{2010212001|XXGvertex_oport_oport|740|0|1191|0|{7|error1|}444|452|}
{2010212001|XXGvertex_oport_oport|741|0|1193|0|{8|error2|}444|453|}
{2010212001|XXGvertex_oport_oport|742|0|1195|0|{9|log|}444|454|}
{2010211001|XXGvertex_iport_iport|743|0|1197|0|{0|in|}444|455|}
{2010007001|XXGobject_proto_object|744|0|1199|0|{}444|456|}
{2010212001|XXGvertex_oport_oport|745|0|1201|0|{0|source|}456|457|}
{2010006001|XXGobject_psameas_object|746|0|1203|0|{metadata|out0_metadata|1|0|}457|456|}
{2010006001|XXGobject_psameas_object|747|0|1204|0|{transform0|transform0|1|0|}457|456|}
{2010212001|XXGvertex_oport_oport|748|0|1205|0|{1|clean|}456|458|}
{2010006001|XXGobject_psameas_object|749|0|1207|0|{metadata|out1_metadata|1|0|}458|456|}
{2010006001|XXGobject_psameas_object|750|0|1208|0|{transform1|transform1|1|0|}458|456|}
{2010212001|XXGvertex_oport_oport|751|0|1209|0|{2|lkp|}456|459|}
{2010006001|XXGobject_psameas_object|752|0|1211|0|{metadata|out2_metadata|1|0|}459|456|}
{2010006001|XXGobject_psameas_object|753|0|1212|0|{transform2|transform2|1|0|}459|456|}
{2010212001|XXGvertex_oport_oport|754|0|1213|0|{3|reject0|}456|460|}
{2010006001|XXGobject_psameas_object|755|0|1215|0|{metadata|reject0_metadata|1|0|}460|456|}
{2010212001|XXGvertex_oport_oport|756|0|1216|0|{4|reject1|}456|461|}
{2010006001|XXGobject_psameas_object|757|0|1218|0|{metadata|reject1_metadata|1|0|}461|456|}
{2010212001|XXGvertex_oport_oport|758|0|1219|0|{5|reject2|}456|462|}
{2010006001|XXGobject_psameas_object|759|0|1221|0|{metadata|reject2_metadata|1|0|}462|456|}
{2010212001|XXGvertex_oport_oport|760|0|1222|0|{6|error0|}456|463|}
{2010006001|XXGobject_psameas_object|761|0|1224|0|{metadata|error0_metadata|1|0|}463|456|}
{2010212001|XXGvertex_oport_oport|762|0|1225|0|{7|error1|}456|464|}
{2010006001|XXGobject_psameas_object|763|0|1227|0|{metadata|error1_metadata|1|0|}464|456|}
{2010212001|XXGvertex_oport_oport|764|0|1228|0|{8|error2|}456|465|}
{2010006001|XXGobject_psameas_object|765|0|1230|0|{metadata|error2_metadata|1|0|}465|456|}
{2010212001|XXGvertex_oport_oport|766|0|1231|0|{9|log|}456|466|}
{2010006001|XXGobject_psameas_object|767|0|1233|0|{metadata|log_metadata|1|0|}466|456|}
{2010211001|XXGvertex_iport_iport|768|0|1234|0|{0|in|}456|467|}
{2010006001|XXGobject_psameas_object|769|0|1236|0|{metadata|in_metadata|1|0|}467|456|}
{2010601001|XXGgraph_vertex_vertex|770|0|1237|0|{Merge|}266|468|}
{2010212001|XXGvertex_oport_oport|771|0|1239|0|{0|out|}468|469|}
{2010213001|XXGoport_dst_flow|772|0|1241|0|{0|}469|279|}
{2010211001|XXGvertex_iport_iport|773|0|1242|0|{0|in|}468|470|}
{2010214001|XXGiport_src_flow|774|0|1244|0|{0|}470|277|}
{2010007001|XXGobject_proto_object|775|0|1245|0|{}468|471|}
{2010212001|XXGvertex_oport_oport|776|0|1247|0|{0|out|}471|472|}
{2010006001|XXGobject_psameas_object|777|0|1249|0|{metadata|out_metadata|1|0|}472|471|}
{2010211001|XXGvertex_iport_iport|778|0|1250|0|{0|in|}471|473|}
{2010006001|XXGobject_psameas_object|779|0|1252|0|{metadata|in_metadata|1|0|}473|471|}
{2010212001|XXGvertex_oport_oport|780|0|1253|0|{0|source|}266|474|}
{2010216002|XXGoport_binding_oport|781|0|1255|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9924|}474|284|}
{2010212001|XXGvertex_oport_oport|782|0|1256|0|{1|clean|}266|475|}
{2010216002|XXGoport_binding_oport|783|0|1258|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9925|}475|290|}
{2010212001|XXGvertex_oport_oport|784|0|1259|0|{2|lookup|}266|476|}
{2010216002|XXGoport_binding_oport|785|0|1261|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9926|}476|439|}
{2010211001|XXGvertex_iport_iport|786|0|1262|0|{0|in0|}266|477|}
{2010215002|XXGiport_binding_iport|787|0|1264|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9923|}477|455|}
{2010601001|XXGgraph_vertex_vertex|788|0|1265|0|{Version_Log|}1|478|}
{2010605001|XXGgraph_legend_legend|789|0|1267|0|{0|}478|479|}
{2010241001|XXGlegend_face_face|790|0|1269|0|{}479|480|}
{2010605001|XXGgraph_legend_legend|791|0|1271|0|{1|}478|481|}
{2010241001|XXGlegend_face_face|792|0|1273|0|{}481|482|}
{2010605001|XXGgraph_legend_legend|793|0|1275|0|{2|}478|483|}
{2010241001|XXGlegend_face_face|794|0|1277|0|{}483|484|}
{2010605001|XXGgraph_legend_legend|795|0|1279|0|{3|}478|485|}
{2010241001|XXGlegend_face_face|796|0|1281|0|{}485|486|}
{2010605001|XXGgraph_legend_legend|797|0|1283|0|{4|}478|487|}
{2010241001|XXGlegend_face_face|798|0|1285|0|{}487|488|}
{2010605001|XXGgraph_legend_legend|799|0|1287|0|{5|}478|489|}
{2010241001|XXGlegend_face_face|800|0|1289|0|{}489|490|}
{2010605001|XXGgraph_legend_legend|801|0|1291|0|{6|}478|491|}
{2010241001|XXGlegend_face_face|802|0|1293|0|{}491|492|}
{2010605001|XXGgraph_legend_legend|803|0|1295|0|{7|}478|493|}
{2010241001|XXGlegend_face_face|804|0|1297|0|{}493|494|}
{2010605001|XXGgraph_legend_legend|805|0|1299|0|{8|}478|495|}
{2010241001|XXGlegend_face_face|806|0|1301|0|{}495|496|}
{2010605001|XXGgraph_legend_legend|807|0|1303|0|{9|}478|497|}
{2010241001|XXGlegend_face_face|808|0|1305|0|{}497|498|}
{2010605001|XXGgraph_legend_legend|809|0|1307|0|{10|}478|499|}
{2010241001|XXGlegend_face_face|810|0|1309|0|{}499|500|}
{2010605001|XXGgraph_legend_legend|811|0|1311|0|{11|}478|501|}
{2010241001|XXGlegend_face_face|812|0|1313|0|{}501|502|}
{2010109001|XXGobject_property_value|813|0|1315|0|{0|TrackingThumbprint|72|}1|503|}
