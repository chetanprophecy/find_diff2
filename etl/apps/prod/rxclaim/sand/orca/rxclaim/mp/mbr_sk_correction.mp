@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|8|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|91|rel_count|155|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS")) now()]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATASET|ids_common.d_member|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|K|@{0|}}
{30001002|XXparameter|PRE_FILTER|@3|9|FK|@{0|}}
{30001002|XXparameter|MAPPING_XFR_FILE|@3|9|FK|@{0|}}
{30001002|XXparameter|POST_FILTER|@3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_IDX_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".idx" ;
end ]|3|9|EK|@{0|}}
{30001002|XXparameter|INPUT_BKP_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.dat.gz.bkp"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".dat.gz.bkp" ;
end ]|3|9|EK|@{0|}}
{30001002|XXparameter|INPUT_IDX_BKP_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.idx.bkp"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".idx.bkp" ;
end ]|3|9|EK|@{0|}}
{30001002|XXparameter|DML_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".dml" ;
end ]|3|9|REFK|@{0|}}
{30001002|XXparameter|OUTPUT_DML_FL|$DML_FL|3|9|FK|@{0|}}
{30001002|XXparameter|ICFF_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.new.dat.gz"  else 
          IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".new.dat.gz"   ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.new.idx"  else 
          IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".new.idx"   ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|EK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|SORT_KEY|$[begin
let string("")[int] v_all_col_vec=record_info_item_expanded(read_type(DML_FL),item="name");
result:: if("ids_updt_dttm" member v_all_col_vec ) "\{dxf_hk_part1;ids_updt_dttm\}" else "\{dxf_hk_part1\}" ;
end ]|3|9|RK|@{0|}}
}}@0|@0|0|0|0|0|0|0|mbr_sk_correction|ymangal|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1680000|350000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{3|1|1|1|}Job 'mbr_sk_correction' Execution Status Report


Job "mbr_sk_correction" Execution started at Monday, November 02, 2020 05:43:54
Job completed successfully at Monday, November 02, 2020 06:24:49

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:40:54
Run performed by user ymangal
Total data moved through all flows: 1192468545 records (358674436244 bytes)
Total CPU time (all processes): 19798 seconds
Average CPU utilization across all nodes: 0.00 percent
|||#Move processed files to /processed directory
if [ $mpjret -eq 0 ]
then
       echo " Graph complted , running end Scripts now " 
        if [[ ( -f $INPUT_FL )  && ( -f $INPUT_IDX_FL ) ]];then
        m_mv $INPUT_FL $INPUT_BKP_FL
                if [ $? -ne 0 ];then
                    echo " failed to rename INPUT_FILE :$INPUT_FL to Backup file :-$INPUT_BK_FL "
                    exit 12
                fi 
        m_mv $INPUT_IDX_FL $INPUT_IDX_BKP_FL
                        if [ $? -ne 0 ];then
                                        echo " failed to rename INPUT_IDX_FILE :$INPUT_IDX_FL to Backup IDX file :-$INPUT_IDX_BKP_FL "
                                exit 12
                         fi 
       fi

       if [[ ( -f $ICFF_FILE )  && ( -f $ICFF_INDEX_FILE ) ]];then
        m_mv $ICFF_FILE $INPUT_FL
                if [ $? -ne 0 ];then
                    echo " failed to rename  new INPUT_FILE :$ICFF_FILE to Main ICFF file :-$INPUT_FL "
                    exit 12
                fi 
        m_mv $ICFF_INDEX_FILE $INPUT_IDX_FL
            if [ $? -ne 0 ];then
                    echo " failed to rename  new INPUT_IDX_FILE :$ICFF_INDEX_FILE to Main ICFF file :-$INPUT_IDX_FL "
                    exit 12
                fi 
       fi
 echo $IDS_DATASET >> $RUN_ID_FILE
 echo " Maintenenace run successfull with RUN ID : $RUN_ID"
else
        echo "Graph Failed"
fi
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@HT2_NK_QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@ICFF_KEY: $SORT_KEY  |918000|103000|0|0|0|0|21|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}162|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}157|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@0|.5|.5|{0|}167|17|}}
{2010243001|XXGwatcher|10|0|19|0|{@{}@1|4000|-1||2|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}155|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@0|.5|.5|{0|}166|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}121|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}153|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}119|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@0|.5|.5|{0|}164|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@0|.5|.5|{0|}163|17|}}
{2010501005|XXGpvertex|18|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|lookup_match("correct_wrong_sk_lookup", dxf_sk) or (cag_sk==0 and first_defined(carrier_id,"-")=='HT2USMS' and src_env_sk==770) or (cag_sk==23995070 and src_env_sk==770) or dxf_sk member [vector 1200022756, 1199072003,1199456328,1199737942]|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|310000|120000|0|0|0|0|165|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|19|0|37|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|20|0|40|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|21|0|43|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|22|0|45|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|23|0|47|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|24|0|49|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|25|0|52|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|operation6|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|26|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|27|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|28|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|29|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|30|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|31|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|32|0|72|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_common/specialty.f_payment_claim_txn.d_member.insert.20201023174912.dat.gz ", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP/mbr_sk_match.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/ids_common/ids_common.d_member.dml|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@0|Input File|692000|280000|0|0|0|0|158|matched_records|Ab Initio Software|@1|13000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|33|0|74|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|34|0|77|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|35|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|36|0|82|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FL|3|2|$|@{0|}}
}}@0|Input File|163000|137000|0|0|0|0|152|ICFF_FILE|Ab Initio Software|@1|13000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|37|0|84|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|38|0|87|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|39|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|40|0|96|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0047|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@1|@1442000|65000|0|0|0|0|154|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|41|0|98|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|42|0|101|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|43|0|104|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|44|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|45|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|46|0|112|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@1|@1443000|200000|0|0|0|0|115|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|47|0|114|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|48|0|117|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|49|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|50|0|122|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@1158000|105000|0|0|0|0|120|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|51|0|124|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|52|0|127|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|53|0|130|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|54|0|132|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|55|0|135|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|56|0|137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|57|0|140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|58|0|143|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|59|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|60|0|152|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

out :: reformat(in) =
begin
  let string("\\x01",charset="iso-8859-15", maximum_length=30)   carrier_id =if(in.cag_sk==23995070)first_defined(in.carrier_id,"-") else in.carrier_id /*VARCHAR(30)*/;
  let string("\\x01",charset="iso-8859-15", maximum_length=40)   account_id = if(( in.cag_sk==23995070 or in.cag_sk==0) and in.src_env_sk==770)first_defined(in.account_id,"-") else in.account_id/*VARCHAR(40)*/;
  let string("\\x01",charset="iso-8859-15", maximum_length=30)   employer_group_id = if((in.cag_sk==23995070 or in.cag_sk==0) and in.src_env_sk==770)first_defined(in.employer_group_id,"-") else in.employer_group_id /*VARCHAR(30)*/;
  let string("\\x01",charset="iso-8859-15", maximum_length=20)   mbr_id = in.mbr_id /*VARCHAR(20)*/;

   let hash_key_combine_type dxf_hk = reinterpret(get_hash([record carrier_id carrier_id account_id account_id employer_group_id employer_group_id mbr_id mbr_id], '\{carrier_id; account_id; employer_group_id; mbr_id\}' )) ;
   out.dxf_hk_part1 :: if((in.cag_sk==0 or in.cag_sk==23995070) and in.src_env_sk==770)dxf_hk.dxf_hk_part1 else in.dxf_hk_part1;
   out.dxf_hk_part2 :: if((in.cag_sk==0 or in.cag_sk==23995070) and in.src_env_sk==770)dxf_hk.dxf_hk_part2 else in.dxf_hk_part2;
   out.carrier_id::carrier_id;
   out.account_id::  account_id;
   out.employer_group_id:: employer_group_id;
   out.dxf_sk :: if (lookup_match("correct_wrong_sk_lookup", in.dxf_sk)) lookup("correct_wrong_sk_lookup", in.dxf_sk).correct_mbr_sk else in.dxf_sk;
   out.cag_sk:: if (in.cag_sk==23995070)16332907 else if (in.cag_sk==0)23203536 else in.cag_sk;
   out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|select|!dxf_sk member [vector 1200022756, 1199072003,1199456328,1199737942]|3|2|$|@{0|}}
}}@0|Reformat|704000|95000|0|0|0|0|168|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|61|0|154|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|62|0|157|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|63|0|159|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|64|0|161|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|65|0|163|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|66|0|166|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|67|0|168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|68|0|172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|69|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|70|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|71|0|181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|72|0|188|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|591000|130000|0|0|0|0|88|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|73|0|190|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|74|0|194|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|75|0|197|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|76|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|77|0|202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|78|0|208|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1;ids_updt_dttm\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|919000|141000|0|0|0|0|122|Sort on SORT_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|79|0|210|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|80|0|213|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|81|0|217|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|82|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|83|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|84|0|228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$DML_FL|3|2|f$|@{0|}}
}}@2|@1592000|65000|0|0|0|0|156|View Data|Ab Initio Software|@1|150|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|85|0|230|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|86|0|233|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|87|0|235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|88|0|239|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/mbr_sk_lkp.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|RecordFormat|record
  decimal(",") wrong_mbr_sk/*BIGINT NOT NULL*/;
  decimal("\\n") correct_mbr_sk /*BIGINT NOT NULL*/;
end|3|9||@{0|}}
{30001002|XXparameter|key|\{wrong_mbr_sk\}|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/mbr_sk_lkp.dat|3|2|$|@{0|}}
}}@0|@84000|46000|0|0|0|0|125|correct_wrong_sk_lookup|Ab Initio Software|@1|130|-1||6||33025|-1|-1|}}
{2010503005|XXGfvertex|89|0|241|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
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
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010110002|XXGconstant|90|0|244|0|{@{}@{1|8004959|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_10|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_2|}1|9|}
{2010244001|XXGflow_watcher_watcher|9|0|18|0|{}9|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_3|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_4|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_5|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_6|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_7|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_8|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_9|}1|17|}
{2010601001|XXGgraph_vertex_vertex|17|0|34|0|{Filter_by_Expression|}1|18|}
{2010212001|XXGvertex_oport_oport|18|0|36|0|{0|out|}18|19|}
{2010213001|XXGoport_dst_flow|19|0|38|0|{0|}19|17|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{1|deselect|}18|20|}
{2010213001|XXGoport_dst_flow|21|0|41|0|{0|}20|16|}
{2010212001|XXGvertex_oport_oport|22|0|42|0|{2|reject|}18|21|}
{2010212001|XXGvertex_oport_oport|23|0|44|0|{3|error|}18|22|}
{2010212001|XXGvertex_oport_oport|24|0|46|0|{4|log|}18|23|}
{2010211001|XXGvertex_iport_iport|25|0|48|0|{0|in|}18|24|}
{2010214001|XXGiport_src_flow|26|0|50|0|{0|}24|7|}
{2010007001|XXGobject_proto_object|27|0|51|0|{}18|25|}
{2010212001|XXGvertex_oport_oport|28|0|53|0|{0|out|}25|26|}
{2010006001|XXGobject_psameas_object|29|0|55|0|{metadata|out_metadata|1|0|}26|25|}
{2010212001|XXGvertex_oport_oport|30|0|56|0|{1|deselect|}25|27|}
{2010006001|XXGobject_psameas_object|31|0|58|0|{metadata|deselect_metadata|1|0|}27|25|}
{2010212001|XXGvertex_oport_oport|32|0|59|0|{2|reject|}25|28|}
{2010006001|XXGobject_psameas_object|33|0|61|0|{metadata|reject_metadata|1|0|}28|25|}
{2010212001|XXGvertex_oport_oport|34|0|62|0|{3|error|}25|29|}
{2010006001|XXGobject_psameas_object|35|0|64|0|{metadata|error_metadata|1|0|}29|25|}
{2010212001|XXGvertex_oport_oport|36|0|65|0|{4|log|}25|30|}
{2010006001|XXGobject_psameas_object|37|0|67|0|{metadata|log_metadata|1|0|}30|25|}
{2010211001|XXGvertex_iport_iport|38|0|68|0|{0|in|}25|31|}
{2010006001|XXGobject_psameas_object|39|0|70|0|{metadata|in_metadata|1|0|}31|25|}
{2010006001|XXGobject_psameas_object|40|0|71|0|{Layout|Layout|0|0|}18|32|}
{2010211001|XXGvertex_iport_iport|41|0|73|0|{0|write|}32|33|}
{2010214001|XXGiport_src_flow|42|0|75|0|{0|}33|8|}
{2010007001|XXGobject_proto_object|43|0|76|0|{}32|34|}
{2010211001|XXGvertex_iport_iport|44|0|78|0|{0|write|}34|35|}
{2010006001|XXGobject_psameas_object|45|0|80|0|{metadata|write_metadata|1|0|}35|34|}
{2010006001|XXGobject_psameas_object|46|0|81|0|{deselect_metadata|read_metadata|0|0|}18|36|}
{2010212001|XXGvertex_oport_oport|47|0|83|0|{0|read|}36|37|}
{2010213001|XXGoport_dst_flow|48|0|85|0|{0|}37|7|}
{2010007001|XXGobject_proto_object|49|0|86|0|{}36|38|}
{2010212001|XXGvertex_oport_oport|50|0|88|0|{0|read|}38|39|}
{2010006001|XXGobject_psameas_object|51|0|90|0|{metadata|read_metadata|1|0|}39|38|}
{2010006001|XXGobject_psameas_object|52|0|91|0|{in_metadata|read_metadata|0|0|}18|36|}
{2010006001|XXGobject_psameas_object|53|0|92|0|{out_metadata|read_metadata|0|0|}18|36|}
{2010006001|XXGobject_psameas_object|54|0|93|0|{reject_metadata|read_metadata|0|0|}18|36|}
{2010601001|XXGgraph_vertex_vertex|55|0|94|0|{ICFF_FILE|}1|36|}
{2010601001|XXGgraph_vertex_vertex|56|0|95|0|{IDS_ICFF|}1|40|}
{2010212001|XXGvertex_oport_oport|57|0|97|0|{0|read|}40|41|}
{2010213001|XXGoport_dst_flow|58|0|99|0|{0|}41|11|}
{2010211001|XXGvertex_iport_iport|59|0|100|0|{0|write|}40|42|}
{2010214001|XXGiport_src_flow|60|0|102|0|{0|}42|14|}
{2010007001|XXGobject_proto_object|61|0|103|0|{}40|43|}
{2010212001|XXGvertex_oport_oport|62|0|105|0|{0|read|}43|44|}
{2010006001|XXGobject_psameas_object|63|0|107|0|{metadata|read_metadata|1|0|}44|43|}
{2010211001|XXGvertex_iport_iport|64|0|108|0|{0|write|}43|45|}
{2010006001|XXGobject_psameas_object|65|0|110|0|{metadata|write_metadata|1|0|}45|43|}
{2010601001|XXGgraph_vertex_vertex|66|0|111|0|{IDS_Index_File|}1|46|}
{2010211001|XXGvertex_iport_iport|67|0|113|0|{0|write|}46|47|}
{2010214001|XXGiport_src_flow|68|0|115|0|{0|}47|15|}
{2010007001|XXGobject_proto_object|69|0|116|0|{}46|48|}
{2010211001|XXGvertex_iport_iport|70|0|118|0|{0|write|}48|49|}
{2010006001|XXGobject_psameas_object|71|0|120|0|{metadata|write_metadata|1|0|}49|48|}
{2010006001|XXGobject_psameas_object|72|0|121|0|{write_metadata|index_metadata|0|0|}46|50|}
{2010212001|XXGvertex_oport_oport|73|0|123|0|{0|out|}50|51|}
{2010213001|XXGoport_dst_flow|74|0|125|0|{0|}51|14|}
{2010212001|XXGvertex_oport_oport|75|0|126|0|{1|index|}50|52|}
{2010213001|XXGoport_dst_flow|76|0|128|0|{0|}52|15|}
{2010212001|XXGvertex_oport_oport|77|0|129|0|{2|address|}50|53|}
{2010211001|XXGvertex_iport_iport|78|0|131|0|{0|in|}50|54|}
{2010214001|XXGiport_src_flow|79|0|133|0|{0|}54|13|}
{2010007001|XXGobject_proto_object|80|0|134|0|{}50|55|}
{2010212001|XXGvertex_oport_oport|81|0|136|0|{0|out|}55|56|}
{2010006001|XXGobject_psameas_object|82|0|138|0|{metadata|out_metadata|1|0|}56|55|}
{2010212001|XXGvertex_oport_oport|83|0|139|0|{1|index|}55|57|}
{2010006001|XXGobject_psameas_object|84|0|141|0|{metadata|index_metadata|1|0|}57|55|}
{2010212001|XXGvertex_oport_oport|85|0|142|0|{2|address|}55|58|}
{2010006001|XXGobject_psameas_object|86|0|144|0|{metadata|address_metadata|1|0|}58|55|}
{2010211001|XXGvertex_iport_iport|87|0|145|0|{0|in|}55|59|}
{2010006001|XXGobject_psameas_object|88|0|147|0|{metadata|in_metadata|1|0|}59|55|}
{2010006001|XXGobject_psameas_object|89|0|148|0|{Layout|Layout|0|0|}50|40|}
{2010006001|XXGobject_psameas_object|90|0|149|0|{in_metadata|read_metadata|0|0|}50|36|}
{2010006001|XXGobject_psameas_object|91|0|150|0|{out_metadata|write_metadata|0|0|}50|40|}
{2010601001|XXGgraph_vertex_vertex|92|0|151|0|{Reformat|}1|60|}
{2010212001|XXGvertex_oport_oport|93|0|153|0|{0|out0|}60|61|}
{2010213001|XXGoport_dst_flow|94|0|155|0|{0|}61|9|}
{2010212001|XXGvertex_oport_oport|95|0|156|0|{1|reject0|}60|62|}
{2010212001|XXGvertex_oport_oport|96|0|158|0|{2|error0|}60|63|}
{2010212001|XXGvertex_oport_oport|97|0|160|0|{3|log|}60|64|}
{2010211001|XXGvertex_iport_iport|98|0|162|0|{0|in|}60|65|}
{2010214001|XXGiport_src_flow|99|0|164|0|{0|}65|12|}
{2010007001|XXGobject_proto_object|100|0|165|0|{}60|66|}
{2010212001|XXGvertex_oport_oport|101|0|167|0|{0|out0|}66|67|}
{2010006001|XXGobject_psameas_object|102|0|169|0|{metadata|out0_metadata|1|0|}67|66|}
{2010006001|XXGobject_psameas_object|103|0|170|0|{transform0|transform0|1|0|}67|66|}
{2010212001|XXGvertex_oport_oport|104|0|171|0|{1|reject0|}66|68|}
{2010006001|XXGobject_psameas_object|105|0|173|0|{metadata|reject0_metadata|1|0|}68|66|}
{2010212001|XXGvertex_oport_oport|106|0|174|0|{2|error0|}66|69|}
{2010006001|XXGobject_psameas_object|107|0|176|0|{metadata|error0_metadata|1|0|}69|66|}
{2010212001|XXGvertex_oport_oport|108|0|177|0|{3|log|}66|70|}
{2010006001|XXGobject_psameas_object|109|0|179|0|{metadata|log_metadata|1|0|}70|66|}
{2010211001|XXGvertex_iport_iport|110|0|180|0|{0|in|}66|71|}
{2010006001|XXGobject_psameas_object|111|0|182|0|{metadata|in_metadata|1|0|}71|66|}
{2010006001|XXGobject_psameas_object|112|0|183|0|{Layout|Layout|0|0|}60|40|}
{2010006001|XXGobject_psameas_object|113|0|184|0|{in_metadata|write_metadata|0|0|}60|32|}
{2010006001|XXGobject_psameas_object|114|0|185|0|{out0_metadata|write_metadata|0|0|}60|32|}
{2010006001|XXGobject_psameas_object|115|0|186|0|{reject0_metadata|write_metadata|0|0|}60|32|}
{2010601001|XXGgraph_vertex_vertex|116|0|187|0|{Replicate|}1|72|}
{2010212001|XXGvertex_oport_oport|117|0|189|0|{0|out|}72|73|}
{2010213001|XXGoport_dst_flow|118|0|191|0|{0|}73|12|}
{2010213001|XXGoport_dst_flow|119|0|192|0|{1|}73|8|}
{2010211001|XXGvertex_iport_iport|120|0|193|0|{0|in|}72|74|}
{2010214001|XXGiport_src_flow|121|0|195|0|{0|}74|17|}
{2010007001|XXGobject_proto_object|122|0|196|0|{}72|75|}
{2010212001|XXGvertex_oport_oport|123|0|198|0|{0|out|}75|76|}
{2010006001|XXGobject_psameas_object|124|0|200|0|{metadata|out_metadata|1|0|}76|75|}
{2010211001|XXGvertex_iport_iport|125|0|201|0|{0|in|}75|77|}
{2010006001|XXGobject_psameas_object|126|0|203|0|{metadata|in_metadata|1|0|}77|75|}
{2010006001|XXGobject_psameas_object|127|0|204|0|{Layout|Layout|0|0|}72|32|}
{2010006001|XXGobject_psameas_object|128|0|205|0|{in_metadata|write_metadata|0|0|}72|32|}
{2010006001|XXGobject_psameas_object|129|0|206|0|{out_metadata|write_metadata|0|0|}72|32|}
{2010601001|XXGgraph_vertex_vertex|130|0|207|0|{Sort_on_SORT_KEY|}1|78|}
{2010212001|XXGvertex_oport_oport|131|0|209|0|{0|out|}78|79|}
{2010213001|XXGoport_dst_flow|132|0|211|0|{0|}79|13|}
{2010211001|XXGvertex_iport_iport|133|0|212|0|{0|in|}78|80|}
{2010214001|XXGiport_src_flow|134|0|214|0|{0|}80|9|}
{2010214001|XXGiport_src_flow|135|0|215|0|{1|}80|16|}
{2010007001|XXGobject_proto_object|136|0|216|0|{}78|81|}
{2010212001|XXGvertex_oport_oport|137|0|218|0|{0|out|}81|82|}
{2010006001|XXGobject_psameas_object|138|0|220|0|{metadata|out_metadata|1|0|}82|81|}
{2010211001|XXGvertex_iport_iport|139|0|221|0|{0|in|}81|83|}
{2010006001|XXGobject_psameas_object|140|0|223|0|{metadata|in_metadata|1|0|}83|81|}
{2010006001|XXGobject_psameas_object|141|0|224|0|{Layout|Layout|0|0|}78|40|}
{2010006001|XXGobject_psameas_object|142|0|225|0|{in_metadata|read_metadata|0|0|}78|36|}
{2010006001|XXGobject_psameas_object|143|0|226|0|{out_metadata|read_metadata|0|0|}78|36|}
{2010601001|XXGgraph_vertex_vertex|144|0|227|0|{View_Data|}1|84|}
{2010211001|XXGvertex_iport_iport|145|0|229|0|{0|write|}84|85|}
{2010214001|XXGiport_src_flow|146|0|231|0|{0|}85|11|}
{2010007001|XXGobject_proto_object|147|0|232|0|{}84|86|}
{2010211001|XXGvertex_iport_iport|148|0|234|0|{0|write|}86|87|}
{2010006001|XXGobject_psameas_object|149|0|236|0|{metadata|write_metadata|1|0|}87|86|}
{2010601001|XXGgraph_vertex_vertex|150|0|237|0|{Write_Block_Compressed_Lookup|}1|50|}
{2010601001|XXGgraph_vertex_vertex|151|0|238|0|{correct_wrong_sk_lookup|}1|88|}
{2010007001|XXGobject_proto_object|152|0|240|0|{}88|89|}
{2010601001|XXGgraph_vertex_vertex|153|0|242|0|{matched_records|}1|32|}
{2010109001|XXGobject_property_value|154|0|243|0|{0|TrackingThumbprint|72|}1|90|}
