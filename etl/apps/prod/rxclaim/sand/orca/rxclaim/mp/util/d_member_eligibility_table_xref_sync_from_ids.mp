@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|414|rel_count|780|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|INCIDENT_NO|ELG_DUP_0519|3|9|FK||{0|}}
{30001002|XXparameter|TABLE_NAME|d_member_eligibility|3|9|RFK|@{0|}}
{30001002|XXparameter|FLTR_EXPR|first_defined(carrier_id,'NA')=='SCUFCW'|3|9|FK||{0|}}
{30001002|XXparameter|WHERE_CLAUSE|update_uid='ELG_DUP_0519'|3|9|FK||{0|}}
{30001002|XXparameter|TABLE_QUERY|select * from orx_idw_dm_etl_prd..BJA_100_D_MEMBER_ELIGIBILITY_REBUILD_SK|3|9|FK||{0|}}
{30001002|XXparameter|TABLE_DML|$DB_RXCLAIM_DML/rxclaim/rxclaim.$TABLE_NAME.dml|3|9|FK||{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|FK||{0|}}
{30001002|XXparameter|SUBJECT_AREA|$(if [ -e $PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/$TABLE_NAME.dat.gz ] 
then
echo "ids_common"
else
echo "ids_rxclaim"
fi
)|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES_HEADER|$(sed -n 12p $PUB_DXF_META/ids_table_properties.dat)|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES|$(awk -F "\|" -v var1=$SUBJECT_AREA.$TABLE_NAME '\{if($1==var1) print $0 \}' $PUB_DXF_META/ids_table_properties.dat)|3|9|RFK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|$(echo $IDS_TABLE_PROPERTIES\|cut -d "\|" -f5)|3|9|RFK|@{0|}}
{30001002|XXparameter|PRIMARY_KEY|$(echo $IDS_TABLE_PROPERTIES\|cut -d "\|" -f4)|3|9|RFK|@{0|}}
{30001002|XXparameter|PRIMARY_KEY1|$[string_filter_out(PRIMARY_KEY,"\{\}")]|3|9|FK||{0|}}
{30001002|XXparameter|DO_DEFAULTING|True|13|9|RFK|@{0|}}
{30001002|XXparameter|IDS_ARCH_FILE_REQ|$(ls -lrt $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.archive.dat.gz \| wc -l)|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_ARCH_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.archive.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_ARCH_FILE_INDEX|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.archive.idx|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.idx|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_KEY_ICFF_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/xref.$\{TABLE_NAME\}.dat.gz_bkp|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_KEY_ICFF_FILE_MAIN|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/xref.$\{TABLE_NAME\}.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_KEY_INDEX_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/xref.$\{TABLE_NAME\}.idx_bkp|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_KEY_INDEX_FILE_MAIN|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/xref.$\{TABLE_NAME\}.idx|3|9|RFK|@{0|}}
{30001002|XXparameter|HASH_RECORD|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = hash_key_combine_type;|7|9|K|Value will come from generic_data_types.dml file defined in PUB_DXF_DML location|{0|}}
{30001002|XXparameter|XREF_LOOKUP_TYPE_DML|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = xref_lookup_type;|7|9|RK|@{0|}}
{30001002|XXparameter|XREF_KEY_FILE_DML|$[join_types(HASH_RECORD,'record\\n integer(8) dxf_sk=0;  \\n end')]|3|9|FK||{0|}}
{30001002|XXparameter|TARGET_NK_DML|$\{PUB_DATAHUB_DML\}/$\{SUBJECT_AREA\}/$\{SUBJECT_AREA\}.$\{TABLE_NAME\}.dml|3|9|FK|@{0|}}
{30001002|XXparameter|JOIN_XFR|/*Join transform*/
out::join(in0,in1)=
begin
out.*::in1.*;
end;|3|9|FK|@{0|}}
{30001002|XXparameter|JOIN_KEY|$[
begin
result :: if(TABLE_NAME=="l_src_env") string_join(record_info_item(remove_fields(read_file(DB_RXCLAIM_DML + "/rxclaim/rxclaim." + TABLE_NAME + ".dml"), [vector "insert_ts", "update_ts", "insert_uid", "update_uid", "newline"]), "name"), "; ")
else if (TABLE_NAME=="d_product") string_join(record_info_item(remove_fields(read_file(DB_RXCLAIM_DML + "/rxclaim/rxclaim." + TABLE_NAME + ".dml"), [vector "spclty_prod_corp_ind", "spclty_prod_corp_nm","fdb_hicl_seq_no", "fdb_hic3_seq_no", "fdb_hic3_cd","insert_ts", "update_ts", "insert_uid", "update_uid", "run_id", "rec_stat_cd", "newline" ]), "name"), "; ")
else string_join(record_info_item(remove_fields(read_file(DB_RXCLAIM_DML + "/rxclaim/rxclaim." + TABLE_NAME + ".dml"), [vector "insert_ts", "update_ts", "insert_uid", "update_uid", "run_id", "rec_stat_cd", "newline" ]), "name"), "; ");
end
]|3|1|RFKl|@{0|}}
{30001002|XXparameter|OUTPUT_FILE1|$AI_SERIAL/$\{TABLE_NAME\}_table_data.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE|/etl/data/qa//serial/orca/rxclaim/main/sshaik70/$\{TABLE_NAME\}_table_data.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_ENTITY|$TABLE_NAME|3|9|FK||{0|}}
{30001002|XXparameter|IDS_META_STRING|$[SUBJECT_AREA + "." + TARGET_ENTITY]|3|9|FK|This string will be used to get value from ids meta property file|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|IS_WRITE_MFS_XREF_ICFF|$[if(get_ids_table_properties(IDS_META_STRING).storage_type=="icff") "Y" else "N" ]|3|9|FK|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(IDS_META_STRING)]|3|9|EFK|@{0|}}
{30001002|XXparameter|xx|$DXF_SERVER_ARCHITECTURE|3|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|azure_abinitio_comparison|spuliko1|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2066000|667000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.3.2|{2|1|1|}Job 'd_member_eligibility_table_xref_sync_from_ids' Execution Status Report

Job completed successfully at Saturday, May 21, 2022 14:03:12
Run performed by user rsontakk
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apvrs55607||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@0|.5|.5|{0|}19535|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@0|.5|.5|{0|}19529|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}19959|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}20005|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@0|.5|.5|{0|}20001|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@0|.5|.5|{0|}19989|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@0|.5|.5|{0|}20008|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@0|.5|.5|{0|}20006|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@0|.5|.5|{0|}20266|1041|}}
{2010210004|XXGflow|14|0|27|0|{@{}@0|.5|.5|{0|}20000|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}19533|529|}}
{2010210004|XXGflow|16|0|31|0|{@{}@0|.5|.5|{0|}19999|2065|}}
{2010210004|XXGflow|17|0|33|0|{@{}@0|.5|.5|{0|}20003|2065|}}
{2010210004|XXGflow|18|0|35|0|{@{}@0|.5|.5|{0|}19996|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@0|.5|.5|{0|}19997|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@0|.5|.5|{0|}19994|1041|}}
{2010210004|XXGflow|21|0|41|0|{@{}@0|.5|.5|{0|}19992|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@0|.5|.5|{0|}19531|17|}}
{2010600005|XXGgraph|23|0|45|0|{Subgraph created from graph "LookUp and CDC on HASH Keys"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@675000|136000|0|0|0|0|19534|Dedup- On Hash of Target NK|Mukesh Singh|Created 6/13/2016 6:54:40 PM|1|100|-1|@9|@32833|{0|}0|0|{0|}{0|}{0|}{0|}1.0|576000|389000|3|}}
{2010240003|XXGlegend|24|0|47|0|{@{}@Handle Log source for record count|-465000|-85000|0|0|0|0|11949|}}
{2010242002|XXGface|25|0|49|0|{@{}@Arial Rounded MT Bold|0|100|0|}}
{2010240003|XXGlegend|26|0|51|0|{@{}@Never Change lebel;|194000|289000|0|0|0|0|12068|}}
{2010242002|XXGface|27|0|53|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}12100|17|}}
{2010501005|XXGpvertex|29|0|57|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2;\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|321000|72500|0|0|0|0|12101|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|30|0|59|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|31|0|61|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|32|0|63|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|33|0|65|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|34|0|67|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|35|0|69|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|36|0|72|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|37|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|38|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|39|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|40|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|41|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|43|0|92|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@354000|85000|0|0|0|0|10632|Xref ICFF Data File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|44|0|94|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|45|0|96|0|{@{}@384|.5|.5|{0|}10636|2065|}}
{2010202004|XXGiport|46|0|98|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|47|0|100|0|{@{}@384|.5|.5|{0|}10633|17|}}
{2010503005|XXGfvertex|48|0|102|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|49|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|50|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|51|0|110|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, $"NATURAL_KEY"));
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
 // out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
   out.dxf_sk::in.mbr_eligty_sk;
  // out.ids_create_dttm::in.insert_ts;
  // out.ids_create_run_id::in.run_id;
  // out.ids_create_uid::in.insert_uid;
  // out.ids_rec_stat_cd::in.rec_stat_cd;
  // out.ids_updt_dttm::in.update_ts;
  // out.ids_updt_run_id::in.run_id;
  // out.ids_updt_uid::in.update_uid;
  // out.dxf_src_sys_id::in.src_env_sk;
   
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record 
unsigned integer(8) dxf_hk_part1=0;
unsigned integer(8) dxf_hk_part2=0;
  integer(8)  dxf_sk = 0;
    datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
end|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|213000|140000|0|0|0|0|19528|RFMT: Get Hash and src_env_rank|Ab Initio Software|Built-in 1.0:|1|100|0||6||4161|1|{1|0|}}}
{2010203004|XXGoport|52|0|112|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|53|0|115|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|54|0|117|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|55|0|119|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|56|0|121|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|57|0|124|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|58|0|126|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|59|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|60|0|133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|61|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|62|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010505005|XXGtvertex|63|0|142|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|table_spec_kind|select|3|1|l|@{0|}}
{30001002|XXparameter|config_file|$DB_RXCLAIM_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0]]|3|9||@{0|}}
{30001002|XXparameter|table_spec|$TABLE_QUERY|3|9||@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated for SQL: SELECT * FROM ORX_IDW_DM_ETL_PRD..BJA_100_D_MEMBER_ELIGIBILITY_REBUILD_SK
 * On: Fri May 20 12:50:40 2022
 */
record
  decimal("\\x01",0) mbr_eligty_sk /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) carrier_id /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40) account_id /*VARCHAR(40) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) employer_group_id /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) mbr_id /*VARCHAR(20) NOT NULL*/;
  decimal("\\x01",0) seq_nbr /*INTEGER NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") insert_ts /*TIMESTAMP(6) NOT NULL*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") update_ts /*TIMESTAMP(6) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@69000|162500|0|0|0|0|19530|IDW_TABLE_ODBC2-1|Ab Initio Software|Built-in 2.2:|1|100|0||6||36929|}}
{2010203004|XXGoport|64|0|144|0|{@{}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|65|0|147|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|66|0|149|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|HelpID|HICOMP_INPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value nza_interface external_table True value nza_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas greenplum_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas postgresql__interface sameas greenplum__interface sameas vertica__interface sameas aster__interface sameas hana__interface sameas hbase__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{9|none|index|table|both|exttable_only|exttable_index|extindex_only|extindex_table|all|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of statements to pack into a Tpump request|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{2|rowid|subpartition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_in|value postgresql_interface utility True value postgresql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_in.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_out|value postgresql__interface utility True value postgresql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_out.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_in|value greenplum_interface utility True value greenplum_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_in.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_out|value greenplum__interface utility True value greenplum__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_out.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_error_table||3|2|FK$|[SQL statement modifier] CREATE EXTERNAL TABLE ... [ LOG ERRORS INTO error_table ... ] ...  The value of 'error_table' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_error_table.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count|0|1|2|FK$|[SQL statement modifier] ... [ LOG ERRORS INTO error_table ... SEGMENT REJECT count ... ] ...  The value of 'count' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_metric|rows|15|1|FKl|[SQL statement modifier] ... [ SEGMENT REJECT count [ROWS \| PERCENT] ] ...  Reject limit metric.  (See Greenplum Database User Guide.)|{2|rows|percents|}}
{30001002|XXparameter|ss_segment_reject_limit_metric.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family+colname|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|67|0|151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|68|0|154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|69|0|164|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; update_ts descending\}|3|2|$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|65000|65000|0|0|0|0|12099|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|70|0|166|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|71|0|169|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|72|0|171|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|73|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|74|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|75|0|182|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|76|0|186|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|77|0|190|0|{Subgraph created from graph "LookUp and CDC on HASH Keys"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@1095000|261000|0|0|0|0|20007|Dedup- On Hash of Target NK-1|Mukesh Singh|Created 6/13/2016 6:54:40 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|576000|389000|3|}}
{2010240003|XXGlegend|78|0|192|0|{@{}@Handle Log source for record count|-465000|-85000|0|0|0|0|11949|}}
{2010242002|XXGface|79|0|194|0|{@{}@Arial Rounded MT Bold|0|100|0|}}
{2010240003|XXGlegend|80|0|196|0|{@{}@Never Change lebel;|194000|289000|0|0|0|0|12068|}}
{2010242002|XXGface|81|0|198|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|82|0|200|0|{@{}@384|.5|.5|{0|}12110|17|}}
{2010501005|XXGpvertex|83|0|202|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2;\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|321000|72500|0|0|0|0|12109|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|84|0|204|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|85|0|206|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|86|0|208|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|87|0|210|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|88|0|212|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|214|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|90|0|217|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|91|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|92|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|93|0|225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|94|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|95|0|231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|96|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|97|0|237|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@354000|85000|0|0|0|0|10649|Xref ICFF Data File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|98|0|239|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|99|0|241|0|{@{}@384|.5|.5|{0|}10648|2065|}}
{2010202004|XXGiport|100|0|243|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|101|0|245|0|{@{}@384|.5|.5|{0|}10647|17|}}
{2010503005|XXGfvertex|102|0|247|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|103|0|249|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|104|0|252|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|105|0|255|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|/* DML Generated by IDS Table DML Onboarding Process for table: ids_common.d_member_eligibility
 * On: THU JUN 30 2016 05:04:51
 */

record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");  
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string(1)  newline =  "\\n";
end
;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|659000|290000|0|0|0|0|19960|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|106|0|257|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|107|0|260|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|108|0|262|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|109|0|264|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|110|0|266|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|111|0|270|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|112|0|272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|113|0|276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|114|0|279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|115|0|282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|116|0|285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|117|0|288|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/d_member_eligibility.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DATAHUB_DML/ids_common/ids_common.d_member_eligibility.dml|3|2|f$|@{0|}}
{30001002|XXparameter|Layout|mfile:$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/d_member_eligibility.dat.gz|3|2|$|@{0|}}
}}@0|Input File|45000|315000|0|0|0|0|19982|IDS|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|118|0|290|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|119|0|293|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|120|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|121|0|303|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending; ids_create_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|65000|65000|0|0|0|0|12111|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|122|0|305|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|123|0|308|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|124|0|310|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|125|0|312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|126|0|315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|127|0|321|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|128|0|325|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|129|0|329|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|(date("YYYYMMDD")) first_defined(ids_create_dttm,ids_updt_dttm,'20190101') >= (date("YYYYMMDD")) '20190101'|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|423000|382000|0|0|0|0|19990|FILTER inactives createtime > 20190101|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|130|0|331|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|131|0|334|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|132|0|336|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|133|0|338|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|134|0|340|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|135|0|342|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|136|0|345|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select); deselect=filter_xfr(package.select);|3|2|H$||{0|}}
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
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|137|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|138|0|350|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|139|0|353|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|140|0|356|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|141|0|359|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|142|0|362|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|143|0|370|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|first_defined(mel_stat_cd,'I') == 'A'|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|196000|296000|0|0|0|0|20002|Filter Actives|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|144|0|372|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|145|0|375|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|146|0|378|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|147|0|380|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|148|0|382|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|149|0|384|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|150|0|387|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select); deselect=filter_xfr(package.select);|3|2|H$||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|151|0|389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|152|0|392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|153|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|154|0|398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|155|0|401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|156|0|404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|157|0|414|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1) =
begin
  out.dxf_hk_part1 :1: in1.dxf_hk_part1;
  out.dxf_hk_part2 :1: in1.dxf_hk_part2;
  out.dxf_sk :1: in1.dxf_sk; //XREF Takes Precedence
  out.dxf_sk :2: in0.dxf_sk;  
  out.dxf_hk_part1 :2: in0.dxf_hk_part1;
  out.dxf_hk_part2 :2: in0.dxf_hk_part2;
end;|3|1|l|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|max_memory|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Join|1453000|485000|0|0|0|0|19998|Join \{dxf_hk_part1; dxf_hk_part2\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|158|0|416|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|159|0|419|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|160|0|422|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|161|0|424|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|162|0|426|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|163|0|428|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|164|0|430|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|165|0|432|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|166|0|434|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|167|0|437|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|168|0|440|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-required parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|driving|0|1|2|FK$|The largest input; all other inputs will be read into memory|{0|}}
{30001002|XXparameter|driving.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.2.2: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (for non-driving inputs before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_memory|8388608|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_memory.display_name|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.keyword|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|sql_null_comparisons|False|13|1|FKl|When matching against null fields, use SQL semantics instead of DML semantics|{0|}}
{30001002|XXparameter|sql_null_comparisons.display_name|sql-null-comparisons|3|9|P|@{0|}}
{30001002|XXparameter|sql_null_comparisons.keyword|sql-null-comparisons|3|9|P|@{0|}}
{30001002|XXparameter|sql_null_comparisons.condition|version 3.3.1.r3:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|unused_port_version|2.4.18:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|legacy_xfr;reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=join(*);unused=join(*)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|169|0|442|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|170|0|445|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|171|0|448|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|172|0|451|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|173|0|454|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|174|0|457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|175|0|460|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|176|0|463|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|177|0|466|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|178|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010503005|XXGfvertex|179|0|503|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/xref/xref.d_member_eligibility.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|file:/tmp/xref.dml|3|2|f$|@{0|}}
{30001002|XXparameter|Layout|mfile:$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/xref/xref.d_member_eligibility.dat.gz|3|2|$|@{0|}}
}}@0|Input File|50000|575000|0|0|0|0|19932|XREF|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|180|0|505|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|181|0|508|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|182|0|510|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|183|0|519|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@438000|151000|0|0|481000|303000|19532|PBKS:\{ICFF_KEY\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36929|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|184|0|521|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|185|0|523|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|186|0|525|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|187|0|528|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|188|0|532|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|189|0|534|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|190|0|536|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|191|0|541|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|192|0|545|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|193|0|549|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|194|0|551|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|195|0|553|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|196|0|555|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|197|0|558|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|198|0|560|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|199|0|562|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|200|0|565|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|201|0|570|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|202|0|572|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|203|0|574|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|204|0|577|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|205|0|579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|206|0|582|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|207|0|588|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|208|0|591|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|209|0|596|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@1673000|511000|0|0|481000|303000|19993|PBKS:\{ICFF_KEY\}-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|210|0|598|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|211|0|600|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|212|0|602|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|213|0|605|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|214|0|609|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|215|0|611|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|216|0|613|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|217|0|618|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|218|0|622|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|219|0|627|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|220|0|629|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|221|0|631|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|222|0|633|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|223|0|636|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|224|0|638|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|225|0|640|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|226|0|643|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|227|0|648|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|228|0|650|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|229|0|652|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|230|0|655|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|231|0|657|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|232|0|660|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|233|0|666|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|234|0|669|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|235|0|674|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@873000|286000|0|0|481000|303000|19942|PBKS:\{ICFF_KEY\}-2|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|236|0|676|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|237|0|678|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|238|0|680|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|239|0|683|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|240|0|687|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|241|0|689|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|242|0|691|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|243|0|696|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|244|0|700|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|245|0|704|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|246|0|706|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|247|0|708|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|248|0|710|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|249|0|713|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|250|0|715|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|251|0|717|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|252|0|720|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|253|0|725|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|254|0|727|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|255|0|729|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|256|0|732|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|257|0|734|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|258|0|737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|259|0|743|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|260|0|746|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|261|0|751|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@723000|561000|0|0|481000|303000|20004|PBKS:\{ICFF_KEY\}-3|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|262|0|753|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|263|0|755|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|264|0|757|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|265|0|760|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|266|0|764|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|267|0|766|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|268|0|768|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|269|0|773|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|270|0|777|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|271|0|781|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|272|0|783|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|273|0|785|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|274|0|787|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|275|0|790|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|276|0|792|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|277|0|794|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|278|0|797|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|279|0|802|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|280|0|804|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|281|0|806|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|282|0|809|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|283|0|811|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|284|0|814|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|285|0|820|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|286|0|823|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|287|0|830|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|1336000|290000|0|0|0|0|19969|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|288|0|832|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|289|0|835|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|290|0|837|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|291|0|839|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|292|0|841|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|293|0|844|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|294|0|846|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|295|0|850|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|296|0|853|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|297|0|856|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|298|0|859|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|299|0|866|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|1110000|550000|0|0|0|0|20267|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|300|0|868|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|301|0|871|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|302|0|874|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|303|0|876|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|304|0|879|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|305|0|885|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|1|3|2|F$||{0|}}
}}@0|@911000|137500|0|0|0|0|19536|Write Xref files|Mukesh Singh|Created 5/4/2016 8:35:29 PM|1|100|-1|@9|@34881|{0|}0|0|{0|}{0|}{0|}{0|}1.0|972000|480000|3|}}
{2010240003|XXGlegend|306|0|887|0|{@{}@This kind of Xref will be created for very
 large dimension and FACT datasets|461000|28000|0|0|0|0|10705|}}
{2010242002|XXGface|307|0|889|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|308|0|891|0|{@{}@This kind of Xref will be created for small to medium 
 sized dimensions|451000|408000|0|0|0|0|10706|}}
{2010242002|XXGface|309|0|893|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|310|0|895|0|{@{}@384|.5|.5|{0|}10870|529|}}
{2010210004|XXGflow|311|0|897|0|{@{}@384|.5|.5|{0|}10868|17|}}
{2010210004|XXGflow|312|0|899|0|{@{}@384|.5|.5|{0|}10872|17|}}
{2010501005|XXGpvertex|313|0|901|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|438000|211500|0|0|0|0|10871|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|314|0|903|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|315|0|906|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|316|0|909|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|317|0|911|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|318|0|914|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|319|0|918|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|81000|176500|0|0|0|0|10867|RFMT: Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|320|0|920|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|321|0|923|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|322|0|925|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|323|0|927|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|324|0|929|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|325|0|931|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|326|0|933|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|327|0|937|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|328|0|940|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|329|0|943|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|330|0|946|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|331|0|954|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|306000|215000|0|0|0|0|10869|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|332|0|956|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|333|0|959|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|334|0|962|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|335|0|964|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|336|0|967|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|337|0|973|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="Y" or DATASET_IDENTIFIER == "many" ]|3|9|F||{0|}}
}}@0|@589000|70000|0|0|0|0|10873|Write Multifile Xref ICFF LookUp|Mukesh Singh|Created 6/22/2016 2:01:49 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|631000|309000|3|}}
{2010210004|XXGflow|338|0|977|0|{@{}@384|.5|.5|{0|}10634|17|}}
{2010503005|XXGfvertex|339|0|979|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
}}@1|@514000|85000|0|0|0|0|10637|View Data|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|340|0|981|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|341|0|984|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|342|0|986|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|343|0|989|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|45000|100000|0|0|0|0|10635|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|344|0|991|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|345|0|994|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|346|0|997|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|347|0|999|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|348|0|1001|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|349|0|1003|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|350|0|1006|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|351|0|1009|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|352|0|1012|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|353|0|1019|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@354000|220000|0|0|0|0|10624|Xref ICFF Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|354|0|1021|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|355|0|1024|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|356|0|1026|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|357|0|1030|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|358|0|1034|0|{@{}@0|0|0|0|in0|.5318181818181819|@@@13840|0|}}
{2010600005|XXGgraph|359|0|1038|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|1|3|2|F$||{0|}}
}}@0|@1906000|497500|0|0|0|0|19991|Write Xref files-1|Mukesh Singh|Created 5/4/2016 8:35:29 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|972000|480000|3|}}
{2010240003|XXGlegend|360|0|1040|0|{@{}@This kind of Xref will be created for very
 large dimension and FACT datasets|461000|28000|0|0|0|0|10705|}}
{2010242002|XXGface|361|0|1042|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|362|0|1044|0|{@{}@This kind of Xref will be created for small to medium 
 sized dimensions|451000|408000|0|0|0|0|10706|}}
{2010242002|XXGface|363|0|1046|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|364|0|1048|0|{@{}@384|.5|.5|{0|}10870|529|}}
{2010210004|XXGflow|365|0|1050|0|{@{}@384|.5|.5|{0|}10872|17|}}
{2010210004|XXGflow|366|0|1052|0|{@{}@384|.5|.5|{0|}10874|17|}}
{2010501005|XXGpvertex|367|0|1054|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|423000|211500|0|0|0|0|10871|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|368|0|1056|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|369|0|1059|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|370|0|1062|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|371|0|1064|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|372|0|1067|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|373|0|1071|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|81000|176500|0|0|0|0|10873|RFMT: Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|374|0|1073|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|375|0|1076|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|376|0|1078|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|377|0|1080|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|378|0|1082|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|379|0|1084|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|380|0|1086|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|381|0|1090|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|382|0|1093|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|383|0|1096|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|384|0|1099|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|385|0|1107|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|296000|215000|0|0|0|0|10869|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|386|0|1109|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|387|0|1112|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|388|0|1115|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|389|0|1117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|390|0|1120|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|391|0|1126|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="Y" or DATASET_IDENTIFIER == "many" ]|3|9|F||{0|}}
}}@0|@549000|165000|0|0|0|0|10875|Write Multifile Xref ICFF LookUp|Mukesh Singh|Created 6/22/2016 2:01:49 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|631000|309000|3|}}
{2010210004|XXGflow|392|0|1130|0|{@{}@384|.5|.5|{0|}10650|17|}}
{2010503005|XXGfvertex|393|0|1132|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
}}@1|@514000|85000|0|0|0|0|10637|View Data|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|394|0|1134|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|395|0|1137|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|396|0|1139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|397|0|1142|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|45000|100000|0|0|0|0|10644|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|398|0|1144|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|399|0|1147|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|400|0|1150|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|401|0|1152|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|402|0|1154|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|403|0|1156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|404|0|1159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|405|0|1162|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|406|0|1165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|407|0|1172|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@354000|220000|0|0|0|0|10651|Xref ICFF Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|408|0|1174|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|409|0|1177|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|410|0|1179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|411|0|1183|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|412|0|1187|0|{@{}@0|0|0|0|in0|.5318181818181819|@@@13840|0|}}
{2010110002|XXGconstant|413|0|1192|0|{@{}@{1|5744019|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_11|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_12|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_13|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_14|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_15|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_16|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_17|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_2|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_21|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_3|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_4|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_5|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_6|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_7|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_8|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_9|}1|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{Dedup_On_Hash_of_Target_NK|}1|23|}
{2010605001|XXGgraph_legend_legend|23|0|46|0|{0|}23|24|}
{2010241001|XXGlegend_face_face|24|0|48|0|{}24|25|}
{2010605001|XXGgraph_legend_legend|25|0|50|0|{1|}23|26|}
{2010241001|XXGlegend_face_face|26|0|52|0|{}26|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_3|}23|28|}
{2010601001|XXGgraph_vertex_vertex|28|0|56|0|{Dedup_Sorted|}23|29|}
{2010212001|XXGvertex_oport_oport|29|0|58|0|{0|out|}29|30|}
{2010212001|XXGvertex_oport_oport|30|0|60|0|{1|dup|}29|31|}
{2010212001|XXGvertex_oport_oport|31|0|62|0|{2|reject|}29|32|}
{2010212001|XXGvertex_oport_oport|32|0|64|0|{3|error|}29|33|}
{2010212001|XXGvertex_oport_oport|33|0|66|0|{4|log|}29|34|}
{2010211001|XXGvertex_iport_iport|34|0|68|0|{0|in|}29|35|}
{2010214001|XXGiport_src_flow|35|0|70|0|{0|}35|28|}
{2010007001|XXGobject_proto_object|36|0|71|0|{}29|36|}
{2010212001|XXGvertex_oport_oport|37|0|73|0|{0|out|}36|37|}
{2010006001|XXGobject_psameas_object|38|0|75|0|{metadata|out_metadata|1|0|}37|36|}
{2010212001|XXGvertex_oport_oport|39|0|76|0|{1|dup|}36|38|}
{2010006001|XXGobject_psameas_object|40|0|78|0|{metadata|dup_metadata|1|0|}38|36|}
{2010212001|XXGvertex_oport_oport|41|0|79|0|{2|reject|}36|39|}
{2010006001|XXGobject_psameas_object|42|0|81|0|{metadata|reject_metadata|1|0|}39|36|}
{2010212001|XXGvertex_oport_oport|43|0|82|0|{3|error|}36|40|}
{2010006001|XXGobject_psameas_object|44|0|84|0|{metadata|error_metadata|1|0|}40|36|}
{2010212001|XXGvertex_oport_oport|45|0|85|0|{4|log|}36|41|}
{2010006001|XXGobject_psameas_object|46|0|87|0|{metadata|log_metadata|1|0|}41|36|}
{2010211001|XXGvertex_iport_iport|47|0|88|0|{0|in|}36|42|}
{2010006001|XXGobject_psameas_object|48|0|90|0|{metadata|in_metadata|1|0|}42|36|}
{2010006001|XXGobject_psameas_object|49|0|91|0|{Layout|Layout|0|0|}29|43|}
{2010212001|XXGvertex_oport_oport|50|0|93|0|{0|read|}43|44|}
{2010213001|XXGoport_dst_flow|51|0|95|0|{0|}44|45|}
{2010211001|XXGvertex_iport_iport|52|0|97|0|{0|write|}43|46|}
{2010214001|XXGiport_src_flow|53|0|99|0|{0|}46|47|}
{2010007001|XXGobject_proto_object|54|0|101|0|{}43|48|}
{2010212001|XXGvertex_oport_oport|55|0|103|0|{0|read|}48|49|}
{2010006001|XXGobject_psameas_object|56|0|105|0|{metadata|read_metadata|1|0|}49|48|}
{2010211001|XXGvertex_iport_iport|57|0|106|0|{0|write|}48|50|}
{2010006001|XXGobject_psameas_object|58|0|108|0|{metadata|write_metadata|1|0|}50|48|}
{2010006001|XXGobject_psameas_object|59|0|109|0|{dup_metadata|out0_metadata|0|0|}29|51|}
{2010212001|XXGvertex_oport_oport|60|0|111|0|{0|out0|}51|52|}
{2010213001|XXGoport_dst_flow|61|0|113|0|{0|}52|22|}
{2010212001|XXGvertex_oport_oport|62|0|114|0|{1|reject0|}51|53|}
{2010212001|XXGvertex_oport_oport|63|0|116|0|{2|error0|}51|54|}
{2010212001|XXGvertex_oport_oport|64|0|118|0|{3|log|}51|55|}
{2010211001|XXGvertex_iport_iport|65|0|120|0|{0|in|}51|56|}
{2010214001|XXGiport_src_flow|66|0|122|0|{0|}56|6|}
{2010007001|XXGobject_proto_object|67|0|123|0|{}51|57|}
{2010212001|XXGvertex_oport_oport|68|0|125|0|{0|out0|}57|58|}
{2010006001|XXGobject_psameas_object|69|0|127|0|{metadata|out0_metadata|1|0|}58|57|}
{2010006001|XXGobject_psameas_object|70|0|128|0|{transform0|transform0|1|0|}58|57|}
{2010212001|XXGvertex_oport_oport|71|0|129|0|{1|reject0|}57|59|}
{2010006001|XXGobject_psameas_object|72|0|131|0|{metadata|reject0_metadata|1|0|}59|57|}
{2010212001|XXGvertex_oport_oport|73|0|132|0|{2|error0|}57|60|}
{2010006001|XXGobject_psameas_object|74|0|134|0|{metadata|error0_metadata|1|0|}60|57|}
{2010212001|XXGvertex_oport_oport|75|0|135|0|{3|log|}57|61|}
{2010006001|XXGobject_psameas_object|76|0|137|0|{metadata|log_metadata|1|0|}61|57|}
{2010211001|XXGvertex_iport_iport|77|0|138|0|{0|in|}57|62|}
{2010006001|XXGobject_psameas_object|78|0|140|0|{metadata|in_metadata|1|0|}62|57|}
{2010006001|XXGobject_psameas_object|79|0|141|0|{Layout|Layout|0|0|}51|63|}
{2010212001|XXGvertex_oport_oport|80|0|143|0|{0|read|}63|64|}
{2010213001|XXGoport_dst_flow|81|0|145|0|{0|}64|6|}
{2010212001|XXGvertex_oport_oport|82|0|146|0|{1|log|}63|65|}
{2010007001|XXGobject_proto_object|83|0|148|0|{}63|66|}
{2010212001|XXGvertex_oport_oport|84|0|150|0|{0|read|}66|67|}
{2010006001|XXGobject_psameas_object|85|0|152|0|{metadata|read_metadata|1|0|}67|66|}
{2010212001|XXGvertex_oport_oport|86|0|153|0|{1|log|}66|68|}
{2010006001|XXGobject_psameas_object|87|0|155|0|{metadata|log_metadata|1|0|}68|66|}
{2010006001|XXGobject_psameas_object|88|0|156|0|{Layout|table_spec|0|1|}66|66|}
{2010006001|XXGobject_psameas_object|89|0|157|0|{Layout|table_spec|0|1|}63|63|}
{2010006001|XXGobject_psameas_object|90|0|158|0|{in_metadata|read_metadata|0|0|}51|63|}
{2010006001|XXGobject_psameas_object|91|0|159|0|{reject0_metadata|read_metadata|0|0|}51|63|}
{2010006001|XXGobject_psameas_object|92|0|160|0|{in_metadata|out0_metadata|0|0|}29|51|}
{2010006001|XXGobject_psameas_object|93|0|161|0|{out_metadata|out0_metadata|0|0|}29|51|}
{2010006001|XXGobject_psameas_object|94|0|162|0|{reject_metadata|out0_metadata|0|0|}29|51|}
{2010601001|XXGgraph_vertex_vertex|95|0|163|0|{Sort_within_Groups|}23|69|}
{2010212001|XXGvertex_oport_oport|96|0|165|0|{0|out|}69|70|}
{2010213001|XXGoport_dst_flow|97|0|167|0|{0|}70|28|}
{2010211001|XXGvertex_iport_iport|98|0|168|0|{0|in|}69|71|}
{2010007001|XXGobject_proto_object|99|0|170|0|{}69|72|}
{2010212001|XXGvertex_oport_oport|100|0|172|0|{0|out|}72|73|}
{2010006001|XXGobject_psameas_object|101|0|174|0|{metadata|out_metadata|1|0|}73|72|}
{2010211001|XXGvertex_iport_iport|102|0|175|0|{0|in|}72|74|}
{2010006001|XXGobject_psameas_object|103|0|177|0|{metadata|in_metadata|1|0|}74|72|}
{2010006001|XXGobject_psameas_object|104|0|178|0|{Layout|Layout|0|0|}69|43|}
{2010006001|XXGobject_psameas_object|105|0|179|0|{in_metadata|out0_metadata|0|0|}69|51|}
{2010006001|XXGobject_psameas_object|106|0|180|0|{out_metadata|out0_metadata|0|0|}69|51|}
{2010212001|XXGvertex_oport_oport|107|0|181|0|{0|out0|}23|75|}
{2010216002|XXGoport_binding_oport|108|0|183|0|{.5|.5|{0|}12084|}75|30|}
{2010213001|XXGoport_dst_flow|109|0|184|0|{0|}75|5|}
{2010211001|XXGvertex_iport_iport|110|0|185|0|{0|in0|}23|76|}
{2010215002|XXGiport_binding_iport|111|0|187|0|{.5|.5|{0|}12083|}76|71|}
{2010214001|XXGiport_src_flow|112|0|188|0|{0|}76|15|}
{2010601001|XXGgraph_vertex_vertex|113|0|189|0|{Dedup_On_Hash_of_Target_NK_1|}1|77|}
{2010605001|XXGgraph_legend_legend|114|0|191|0|{0|}77|78|}
{2010241001|XXGlegend_face_face|115|0|193|0|{}78|79|}
{2010605001|XXGgraph_legend_legend|116|0|195|0|{1|}77|80|}
{2010241001|XXGlegend_face_face|117|0|197|0|{}80|81|}
{2010604001|XXGgraph_flow_flow|118|0|199|0|{Flow_3|}77|82|}
{2010601001|XXGgraph_vertex_vertex|119|0|201|0|{Dedup_Sorted|}77|83|}
{2010212001|XXGvertex_oport_oport|120|0|203|0|{0|out|}83|84|}
{2010212001|XXGvertex_oport_oport|121|0|205|0|{1|dup|}83|85|}
{2010212001|XXGvertex_oport_oport|122|0|207|0|{2|reject|}83|86|}
{2010212001|XXGvertex_oport_oport|123|0|209|0|{3|error|}83|87|}
{2010212001|XXGvertex_oport_oport|124|0|211|0|{4|log|}83|88|}
{2010211001|XXGvertex_iport_iport|125|0|213|0|{0|in|}83|89|}
{2010214001|XXGiport_src_flow|126|0|215|0|{0|}89|82|}
{2010007001|XXGobject_proto_object|127|0|216|0|{}83|90|}
{2010212001|XXGvertex_oport_oport|128|0|218|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|129|0|220|0|{metadata|out_metadata|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|130|0|221|0|{1|dup|}90|92|}
{2010006001|XXGobject_psameas_object|131|0|223|0|{metadata|dup_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|132|0|224|0|{2|reject|}90|93|}
{2010006001|XXGobject_psameas_object|133|0|226|0|{metadata|reject_metadata|1|0|}93|90|}
{2010212001|XXGvertex_oport_oport|134|0|227|0|{3|error|}90|94|}
{2010006001|XXGobject_psameas_object|135|0|229|0|{metadata|error_metadata|1|0|}94|90|}
{2010212001|XXGvertex_oport_oport|136|0|230|0|{4|log|}90|95|}
{2010006001|XXGobject_psameas_object|137|0|232|0|{metadata|log_metadata|1|0|}95|90|}
{2010211001|XXGvertex_iport_iport|138|0|233|0|{0|in|}90|96|}
{2010006001|XXGobject_psameas_object|139|0|235|0|{metadata|in_metadata|1|0|}96|90|}
{2010006001|XXGobject_psameas_object|140|0|236|0|{Layout|Layout|0|0|}83|97|}
{2010212001|XXGvertex_oport_oport|141|0|238|0|{0|read|}97|98|}
{2010213001|XXGoport_dst_flow|142|0|240|0|{0|}98|99|}
{2010211001|XXGvertex_iport_iport|143|0|242|0|{0|write|}97|100|}
{2010214001|XXGiport_src_flow|144|0|244|0|{0|}100|101|}
{2010007001|XXGobject_proto_object|145|0|246|0|{}97|102|}
{2010212001|XXGvertex_oport_oport|146|0|248|0|{0|read|}102|103|}
{2010006001|XXGobject_psameas_object|147|0|250|0|{metadata|read_metadata|1|0|}103|102|}
{2010211001|XXGvertex_iport_iport|148|0|251|0|{0|write|}102|104|}
{2010006001|XXGobject_psameas_object|149|0|253|0|{metadata|write_metadata|1|0|}104|102|}
{2010006001|XXGobject_psameas_object|150|0|254|0|{dup_metadata|out0_metadata|0|0|}83|105|}
{2010212001|XXGvertex_oport_oport|151|0|256|0|{0|out0|}105|106|}
{2010213001|XXGoport_dst_flow|152|0|258|0|{0|}106|7|}
{2010212001|XXGvertex_oport_oport|153|0|259|0|{1|reject0|}105|107|}
{2010212001|XXGvertex_oport_oport|154|0|261|0|{2|error0|}105|108|}
{2010212001|XXGvertex_oport_oport|155|0|263|0|{3|log|}105|109|}
{2010211001|XXGvertex_iport_iport|156|0|265|0|{0|in|}105|110|}
{2010214001|XXGiport_src_flow|157|0|267|0|{0|}110|14|}
{2010214001|XXGiport_src_flow|158|0|268|0|{1|}110|10|}
{2010007001|XXGobject_proto_object|159|0|269|0|{}105|111|}
{2010212001|XXGvertex_oport_oport|160|0|271|0|{0|out0|}111|112|}
{2010006001|XXGobject_psameas_object|161|0|273|0|{metadata|out0_metadata|1|0|}112|111|}
{2010006001|XXGobject_psameas_object|162|0|274|0|{transform0|transform0|1|0|}112|111|}
{2010212001|XXGvertex_oport_oport|163|0|275|0|{1|reject0|}111|113|}
{2010006001|XXGobject_psameas_object|164|0|277|0|{metadata|reject0_metadata|1|0|}113|111|}
{2010212001|XXGvertex_oport_oport|165|0|278|0|{2|error0|}111|114|}
{2010006001|XXGobject_psameas_object|166|0|280|0|{metadata|error0_metadata|1|0|}114|111|}
{2010212001|XXGvertex_oport_oport|167|0|281|0|{3|log|}111|115|}
{2010006001|XXGobject_psameas_object|168|0|283|0|{metadata|log_metadata|1|0|}115|111|}
{2010211001|XXGvertex_iport_iport|169|0|284|0|{0|in|}111|116|}
{2010006001|XXGobject_psameas_object|170|0|286|0|{metadata|in_metadata|1|0|}116|111|}
{2010006001|XXGobject_psameas_object|171|0|287|0|{Layout|Layout|0|0|}105|117|}
{2010212001|XXGvertex_oport_oport|172|0|289|0|{0|read|}117|118|}
{2010213001|XXGoport_dst_flow|173|0|291|0|{0|}118|16|}
{2010007001|XXGobject_proto_object|174|0|292|0|{}117|119|}
{2010212001|XXGvertex_oport_oport|175|0|294|0|{0|read|}119|120|}
{2010006001|XXGobject_psameas_object|176|0|296|0|{metadata|read_metadata|1|0|}120|119|}
{2010006001|XXGobject_psameas_object|177|0|297|0|{in_metadata|read_metadata|0|0|}105|117|}
{2010006001|XXGobject_psameas_object|178|0|298|0|{reject0_metadata|read_metadata|0|0|}105|117|}
{2010006001|XXGobject_psameas_object|179|0|299|0|{in_metadata|out0_metadata|0|0|}83|105|}
{2010006001|XXGobject_psameas_object|180|0|300|0|{out_metadata|out0_metadata|0|0|}83|105|}
{2010006001|XXGobject_psameas_object|181|0|301|0|{reject_metadata|out0_metadata|0|0|}83|105|}
{2010601001|XXGgraph_vertex_vertex|182|0|302|0|{Sort_within_Groups|}77|121|}
{2010212001|XXGvertex_oport_oport|183|0|304|0|{0|out|}121|122|}
{2010213001|XXGoport_dst_flow|184|0|306|0|{0|}122|82|}
{2010211001|XXGvertex_iport_iport|185|0|307|0|{0|in|}121|123|}
{2010007001|XXGobject_proto_object|186|0|309|0|{}121|124|}
{2010212001|XXGvertex_oport_oport|187|0|311|0|{0|out|}124|125|}
{2010006001|XXGobject_psameas_object|188|0|313|0|{metadata|out_metadata|1|0|}125|124|}
{2010211001|XXGvertex_iport_iport|189|0|314|0|{0|in|}124|126|}
{2010006001|XXGobject_psameas_object|190|0|316|0|{metadata|in_metadata|1|0|}126|124|}
{2010006001|XXGobject_psameas_object|191|0|317|0|{Layout|Layout|0|0|}121|97|}
{2010006001|XXGobject_psameas_object|192|0|318|0|{in_metadata|out0_metadata|0|0|}121|105|}
{2010006001|XXGobject_psameas_object|193|0|319|0|{out_metadata|out0_metadata|0|0|}121|105|}
{2010212001|XXGvertex_oport_oport|194|0|320|0|{0|out0|}77|127|}
{2010216002|XXGoport_binding_oport|195|0|322|0|{.5|.5|{0|}12084|}127|84|}
{2010213001|XXGoport_dst_flow|196|0|323|0|{0|}127|12|}
{2010211001|XXGvertex_iport_iport|197|0|324|0|{0|in0|}77|128|}
{2010215002|XXGiport_binding_iport|198|0|326|0|{.5|.5|{0|}12083|}128|123|}
{2010214001|XXGiport_src_flow|199|0|327|0|{0|}128|8|}
{2010601001|XXGgraph_vertex_vertex|200|0|328|0|{FILTER_inactives_createtime_20190101|}1|129|}
{2010212001|XXGvertex_oport_oport|201|0|330|0|{0|out|}129|130|}
{2010213001|XXGoport_dst_flow|202|0|332|0|{0|}130|10|}
{2010212001|XXGvertex_oport_oport|203|0|333|0|{1|deselect|}129|131|}
{2010212001|XXGvertex_oport_oport|204|0|335|0|{2|reject|}129|132|}
{2010212001|XXGvertex_oport_oport|205|0|337|0|{3|error|}129|133|}
{2010212001|XXGvertex_oport_oport|206|0|339|0|{4|log|}129|134|}
{2010211001|XXGvertex_iport_iport|207|0|341|0|{0|in|}129|135|}
{2010214001|XXGiport_src_flow|208|0|343|0|{0|}135|9|}
{2010007001|XXGobject_proto_object|209|0|344|0|{}129|136|}
{2010212001|XXGvertex_oport_oport|210|0|346|0|{0|out|}136|137|}
{2010006001|XXGobject_psameas_object|211|0|348|0|{metadata|out_metadata|1|0|}137|136|}
{2010212001|XXGvertex_oport_oport|212|0|349|0|{1|deselect|}136|138|}
{2010006001|XXGobject_psameas_object|213|0|351|0|{metadata|deselect_metadata|1|0|}138|136|}
{2010212001|XXGvertex_oport_oport|214|0|352|0|{2|reject|}136|139|}
{2010006001|XXGobject_psameas_object|215|0|354|0|{metadata|reject_metadata|1|0|}139|136|}
{2010212001|XXGvertex_oport_oport|216|0|355|0|{3|error|}136|140|}
{2010006001|XXGobject_psameas_object|217|0|357|0|{metadata|error_metadata|1|0|}140|136|}
{2010212001|XXGvertex_oport_oport|218|0|358|0|{4|log|}136|141|}
{2010006001|XXGobject_psameas_object|219|0|360|0|{metadata|log_metadata|1|0|}141|136|}
{2010211001|XXGvertex_iport_iport|220|0|361|0|{0|in|}136|142|}
{2010006001|XXGobject_psameas_object|221|0|363|0|{metadata|in_metadata|1|0|}142|136|}
{2010006001|XXGobject_psameas_object|222|0|364|0|{Layout|Layout|0|0|}129|117|}
{2010006001|XXGobject_psameas_object|223|0|365|0|{deselect_metadata|read_metadata|0|0|}129|117|}
{2010006001|XXGobject_psameas_object|224|0|366|0|{in_metadata|read_metadata|0|0|}129|117|}
{2010006001|XXGobject_psameas_object|225|0|367|0|{out_metadata|read_metadata|0|0|}129|117|}
{2010006001|XXGobject_psameas_object|226|0|368|0|{reject_metadata|read_metadata|0|0|}129|117|}
{2010601001|XXGgraph_vertex_vertex|227|0|369|0|{Filter_Actives|}1|143|}
{2010212001|XXGvertex_oport_oport|228|0|371|0|{0|out|}143|144|}
{2010213001|XXGoport_dst_flow|229|0|373|0|{0|}144|14|}
{2010212001|XXGvertex_oport_oport|230|0|374|0|{1|deselect|}143|145|}
{2010213001|XXGoport_dst_flow|231|0|376|0|{0|}145|9|}
{2010212001|XXGvertex_oport_oport|232|0|377|0|{2|reject|}143|146|}
{2010212001|XXGvertex_oport_oport|233|0|379|0|{3|error|}143|147|}
{2010212001|XXGvertex_oport_oport|234|0|381|0|{4|log|}143|148|}
{2010211001|XXGvertex_iport_iport|235|0|383|0|{0|in|}143|149|}
{2010214001|XXGiport_src_flow|236|0|385|0|{0|}149|16|}
{2010007001|XXGobject_proto_object|237|0|386|0|{}143|150|}
{2010212001|XXGvertex_oport_oport|238|0|388|0|{0|out|}150|151|}
{2010006001|XXGobject_psameas_object|239|0|390|0|{metadata|out_metadata|1|0|}151|150|}
{2010212001|XXGvertex_oport_oport|240|0|391|0|{1|deselect|}150|152|}
{2010006001|XXGobject_psameas_object|241|0|393|0|{metadata|deselect_metadata|1|0|}152|150|}
{2010212001|XXGvertex_oport_oport|242|0|394|0|{2|reject|}150|153|}
{2010006001|XXGobject_psameas_object|243|0|396|0|{metadata|reject_metadata|1|0|}153|150|}
{2010212001|XXGvertex_oport_oport|244|0|397|0|{3|error|}150|154|}
{2010006001|XXGobject_psameas_object|245|0|399|0|{metadata|error_metadata|1|0|}154|150|}
{2010212001|XXGvertex_oport_oport|246|0|400|0|{4|log|}150|155|}
{2010006001|XXGobject_psameas_object|247|0|402|0|{metadata|log_metadata|1|0|}155|150|}
{2010211001|XXGvertex_iport_iport|248|0|403|0|{0|in|}150|156|}
{2010006001|XXGobject_psameas_object|249|0|405|0|{metadata|in_metadata|1|0|}156|150|}
{2010006001|XXGobject_psameas_object|250|0|406|0|{Layout|Layout|0|0|}143|117|}
{2010006001|XXGobject_psameas_object|251|0|407|0|{deselect_metadata|read_metadata|0|0|}143|117|}
{2010006001|XXGobject_psameas_object|252|0|408|0|{in_metadata|read_metadata|0|0|}143|117|}
{2010006001|XXGobject_psameas_object|253|0|409|0|{out_metadata|read_metadata|0|0|}143|117|}
{2010006001|XXGobject_psameas_object|254|0|410|0|{reject_metadata|read_metadata|0|0|}143|117|}
{2010601001|XXGgraph_vertex_vertex|255|0|411|0|{IDS|}1|117|}
{2010601001|XXGgraph_vertex_vertex|256|0|412|0|{IDW_TABLE_ODBC2_1|}1|63|}
{2010601001|XXGgraph_vertex_vertex|257|0|413|0|{Join_dxf_hk_part1_dxf_hk_part2_|}1|157|}
{2010212001|XXGvertex_oport_oport|258|0|415|0|{0|out|}157|158|}
{2010213001|XXGoport_dst_flow|259|0|417|0|{0|}158|18|}
{2010212001|XXGvertex_oport_oport|260|0|418|0|{1|unused0|}157|159|}
{2010213001|XXGoport_dst_flow|261|0|420|0|{0|}159|19|}
{2010212001|XXGvertex_oport_oport|262|0|421|0|{2|unused1|}157|160|}
{2010212001|XXGvertex_oport_oport|263|0|423|0|{3|reject0|}157|161|}
{2010212001|XXGvertex_oport_oport|264|0|425|0|{4|reject1|}157|162|}
{2010212001|XXGvertex_oport_oport|265|0|427|0|{5|error0|}157|163|}
{2010212001|XXGvertex_oport_oport|266|0|429|0|{6|error1|}157|164|}
{2010212001|XXGvertex_oport_oport|267|0|431|0|{7|log|}157|165|}
{2010211001|XXGvertex_iport_iport|268|0|433|0|{0|in0|}157|166|}
{2010214001|XXGiport_src_flow|269|0|435|0|{0|}166|20|}
{2010211001|XXGvertex_iport_iport|270|0|436|0|{1|in1|}157|167|}
{2010214001|XXGiport_src_flow|271|0|438|0|{0|}167|13|}
{2010007001|XXGobject_proto_object|272|0|439|0|{}157|168|}
{2010212001|XXGvertex_oport_oport|273|0|441|0|{0|out|}168|169|}
{2010006001|XXGobject_psameas_object|274|0|443|0|{metadata|out_metadata|1|0|}169|168|}
{2010212001|XXGvertex_oport_oport|275|0|444|0|{1|unused0|}168|170|}
{2010006001|XXGobject_psameas_object|276|0|446|0|{metadata|unused0_metadata|1|0|}170|168|}
{2010212001|XXGvertex_oport_oport|277|0|447|0|{2|unused1|}168|171|}
{2010006001|XXGobject_psameas_object|278|0|449|0|{metadata|unused1_metadata|1|0|}171|168|}
{2010212001|XXGvertex_oport_oport|279|0|450|0|{3|reject0|}168|172|}
{2010006001|XXGobject_psameas_object|280|0|452|0|{metadata|reject0_metadata|1|0|}172|168|}
{2010212001|XXGvertex_oport_oport|281|0|453|0|{4|reject1|}168|173|}
{2010006001|XXGobject_psameas_object|282|0|455|0|{metadata|reject1_metadata|1|0|}173|168|}
{2010212001|XXGvertex_oport_oport|283|0|456|0|{5|error0|}168|174|}
{2010006001|XXGobject_psameas_object|284|0|458|0|{metadata|error0_metadata|1|0|}174|168|}
{2010212001|XXGvertex_oport_oport|285|0|459|0|{6|error1|}168|175|}
{2010006001|XXGobject_psameas_object|286|0|461|0|{metadata|error1_metadata|1|0|}175|168|}
{2010212001|XXGvertex_oport_oport|287|0|462|0|{7|log|}168|176|}
{2010006001|XXGobject_psameas_object|288|0|464|0|{metadata|log_metadata|1|0|}176|168|}
{2010211001|XXGvertex_iport_iport|289|0|465|0|{0|in0|}168|177|}
{2010006001|XXGobject_psameas_object|290|0|467|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|291|0|468|0|{dedup0|dedup0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|292|0|469|0|{dedup_keyword0|dedup_keyword0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|293|0|470|0|{dedup_positional0|dedup_positional0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|294|0|471|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|295|0|472|0|{matchoptional_positional0|matchoptional_positional0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|296|0|473|0|{metadata|in0_metadata|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|297|0|474|0|{override_key0|override_key0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|298|0|475|0|{record_match_required0|record_match_required0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|299|0|476|0|{record_match_required_not0|record_match_required_not0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|300|0|477|0|{record_required0|record_required0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|301|0|478|0|{record_required_keyword0|record_required_keyword0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|302|0|479|0|{record_required_positional0|record_required_positional0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|303|0|480|0|{select0|select0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|304|0|481|0|{select_keyword0|select_keyword0|1|0|}177|168|}
{2010006001|XXGobject_psameas_object|305|0|482|0|{select_positional0|select_positional0|1|0|}177|168|}
{2010211001|XXGvertex_iport_iport|306|0|483|0|{1|in1|}168|178|}
{2010006001|XXGobject_psameas_object|307|0|485|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|308|0|486|0|{dedup1|dedup1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|309|0|487|0|{dedup_keyword1|dedup_keyword1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|310|0|488|0|{dedup_positional1|dedup_positional1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|311|0|489|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|312|0|490|0|{matchoptional_positional1|matchoptional_positional1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|313|0|491|0|{metadata|in1_metadata|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|314|0|492|0|{override_key1|override_key1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|315|0|493|0|{record_match_required1|record_match_required1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|316|0|494|0|{record_match_required_not1|record_match_required_not1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|317|0|495|0|{record_required1|record_required1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|318|0|496|0|{record_required_keyword1|record_required_keyword1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|319|0|497|0|{record_required_positional1|record_required_positional1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|320|0|498|0|{select1|select1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|321|0|499|0|{select_keyword1|select_keyword1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|322|0|500|0|{select_positional1|select_positional1|1|0|}178|168|}
{2010006001|XXGobject_psameas_object|323|0|501|0|{Layout|Layout|0|0|}157|97|}
{2010006001|XXGobject_psameas_object|324|0|502|0|{in0_metadata|read_metadata|0|0|}157|179|}
{2010212001|XXGvertex_oport_oport|325|0|504|0|{0|read|}179|180|}
{2010213001|XXGoport_dst_flow|326|0|506|0|{0|}180|17|}
{2010007001|XXGobject_proto_object|327|0|507|0|{}179|181|}
{2010212001|XXGvertex_oport_oport|328|0|509|0|{0|read|}181|182|}
{2010006001|XXGobject_psameas_object|329|0|511|0|{metadata|read_metadata|1|0|}182|181|}
{2010006001|XXGobject_psameas_object|330|0|512|0|{in1_metadata|read_metadata|0|0|}157|179|}
{2010006001|XXGobject_psameas_object|331|0|513|0|{out_metadata|read_metadata|0|0|}157|179|}
{2010006001|XXGobject_psameas_object|332|0|514|0|{reject0_metadata|read_metadata|0|0|}157|179|}
{2010006001|XXGobject_psameas_object|333|0|515|0|{reject1_metadata|read_metadata|0|0|}157|179|}
{2010006001|XXGobject_psameas_object|334|0|516|0|{unused0_metadata|read_metadata|0|0|}157|179|}
{2010006001|XXGobject_psameas_object|335|0|517|0|{unused1_metadata|read_metadata|0|0|}157|179|}
{2010601001|XXGgraph_vertex_vertex|336|0|518|0|{PBKS_ICFF_KEY_|}1|183|}
{2010604001|XXGgraph_flow_flow|337|0|520|0|{Flow_1|}183|184|}
{2010601001|XXGgraph_vertex_vertex|338|0|522|0|{Partition_by_Key|}183|185|}
{2010212001|XXGvertex_oport_oport|339|0|524|0|{0|out|}185|186|}
{2010213001|XXGoport_dst_flow|340|0|526|0|{0|}186|184|}
{2010211001|XXGvertex_iport_iport|341|0|527|0|{0|in|}185|187|}
{2010006001|XXGobject_psameas_object|342|0|529|0|{in_metadata|out0_metadata|0|0|}185|51|}
{2010006001|XXGobject_psameas_object|343|0|530|0|{out_metadata|out0_metadata|0|0|}185|51|}
{2010601001|XXGgraph_vertex_vertex|344|0|531|0|{Sort|}183|188|}
{2010212001|XXGvertex_oport_oport|345|0|533|0|{0|out|}188|189|}
{2010211001|XXGvertex_iport_iport|346|0|535|0|{0|in|}188|190|}
{2010214001|XXGiport_src_flow|347|0|537|0|{0|}190|184|}
{2010006001|XXGobject_psameas_object|348|0|538|0|{in_metadata|out0_metadata|0|0|}188|51|}
{2010006001|XXGobject_psameas_object|349|0|539|0|{out_metadata|out0_metadata|0|0|}188|51|}
{2010212001|XXGvertex_oport_oport|350|0|540|0|{0|out0|}183|191|}
{2010216002|XXGoport_binding_oport|351|0|542|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}191|189|}
{2010213001|XXGoport_dst_flow|352|0|543|0|{0|}191|15|}
{2010211001|XXGvertex_iport_iport|353|0|544|0|{0|in0|}183|192|}
{2010215002|XXGiport_binding_iport|354|0|546|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}192|187|}
{2010214001|XXGiport_src_flow|355|0|547|0|{0|}192|22|}
{2010007001|XXGobject_proto_object|356|0|548|0|{}183|193|}
{2010604001|XXGgraph_flow_flow|357|0|550|0|{Flow_1|}193|194|}
{2010601001|XXGgraph_vertex_vertex|358|0|552|0|{Partition_by_Key|}193|195|}
{2010212001|XXGvertex_oport_oport|359|0|554|0|{0|out|}195|196|}
{2010213001|XXGoport_dst_flow|360|0|556|0|{0|}196|194|}
{2010211001|XXGvertex_iport_iport|361|0|557|0|{0|in|}195|197|}
{2010007001|XXGobject_proto_object|362|0|559|0|{}195|198|}
{2010212001|XXGvertex_oport_oport|363|0|561|0|{0|out|}198|199|}
{2010006001|XXGobject_psameas_object|364|0|563|0|{metadata|out_metadata|1|0|}199|198|}
{2010211001|XXGvertex_iport_iport|365|0|564|0|{0|in|}198|200|}
{2010006001|XXGobject_psameas_object|366|0|566|0|{metadata|in_metadata|1|0|}200|198|}
{2010006001|XXGobject_psameas_object|367|0|567|0|{Layout|InputLayout|1|0|}195|193|}
{2010006001|XXGobject_psameas_object|368|0|568|0|{key|Key|1|0|}195|193|}
{2010601001|XXGgraph_vertex_vertex|369|0|569|0|{Sort|}193|201|}
{2010212001|XXGvertex_oport_oport|370|0|571|0|{0|out|}201|202|}
{2010211001|XXGvertex_iport_iport|371|0|573|0|{0|in|}201|203|}
{2010214001|XXGiport_src_flow|372|0|575|0|{0|}203|194|}
{2010007001|XXGobject_proto_object|373|0|576|0|{}201|204|}
{2010212001|XXGvertex_oport_oport|374|0|578|0|{0|out|}204|205|}
{2010006001|XXGobject_psameas_object|375|0|580|0|{metadata|out_metadata|1|0|}205|204|}
{2010211001|XXGvertex_iport_iport|376|0|581|0|{0|in|}204|206|}
{2010006001|XXGobject_psameas_object|377|0|583|0|{metadata|in_metadata|1|0|}206|204|}
{2010006001|XXGobject_psameas_object|378|0|584|0|{Layout|OutputLayout|1|0|}201|193|}
{2010006001|XXGobject_psameas_object|379|0|585|0|{key|Key|1|0|}201|193|}
{2010006001|XXGobject_psameas_object|380|0|586|0|{max_core|Max_core|1|0|}201|193|}
{2010212001|XXGvertex_oport_oport|381|0|587|0|{0|out0|}193|207|}
{2010216002|XXGoport_binding_oport|382|0|589|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}207|202|}
{2010211001|XXGvertex_iport_iport|383|0|590|0|{0|in0|}193|208|}
{2010215002|XXGiport_binding_iport|384|0|592|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}208|197|}
{2010006001|XXGobject_psameas_object|385|0|593|0|{InputLayout|Layout|0|0|}183|63|}
{2010006001|XXGobject_psameas_object|386|0|594|0|{OutputLayout|Layout|0|0|}183|43|}
{2010601001|XXGgraph_vertex_vertex|387|0|595|0|{PBKS_ICFF_KEY_1|}1|209|}
{2010604001|XXGgraph_flow_flow|388|0|597|0|{Flow_1|}209|210|}
{2010601001|XXGgraph_vertex_vertex|389|0|599|0|{Partition_by_Key|}209|211|}
{2010212001|XXGvertex_oport_oport|390|0|601|0|{0|out|}211|212|}
{2010213001|XXGoport_dst_flow|391|0|603|0|{0|}212|210|}
{2010211001|XXGvertex_iport_iport|392|0|604|0|{0|in|}211|213|}
{2010006001|XXGobject_psameas_object|393|0|606|0|{in_metadata|read_metadata|0|0|}211|179|}
{2010006001|XXGobject_psameas_object|394|0|607|0|{out_metadata|read_metadata|0|0|}211|179|}
{2010601001|XXGgraph_vertex_vertex|395|0|608|0|{Sort|}209|214|}
{2010212001|XXGvertex_oport_oport|396|0|610|0|{0|out|}214|215|}
{2010211001|XXGvertex_iport_iport|397|0|612|0|{0|in|}214|216|}
{2010214001|XXGiport_src_flow|398|0|614|0|{0|}216|210|}
{2010006001|XXGobject_psameas_object|399|0|615|0|{in_metadata|read_metadata|0|0|}214|179|}
{2010006001|XXGobject_psameas_object|400|0|616|0|{out_metadata|read_metadata|0|0|}214|179|}
{2010212001|XXGvertex_oport_oport|401|0|617|0|{0|out0|}209|217|}
{2010216002|XXGoport_binding_oport|402|0|619|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}217|215|}
{2010213001|XXGoport_dst_flow|403|0|620|0|{0|}217|21|}
{2010211001|XXGvertex_iport_iport|404|0|621|0|{0|in0|}209|218|}
{2010215002|XXGiport_binding_iport|405|0|623|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}218|213|}
{2010214001|XXGiport_src_flow|406|0|624|0|{0|}218|18|}
{2010214001|XXGiport_src_flow|407|0|625|0|{1|}218|19|}
{2010007001|XXGobject_proto_object|408|0|626|0|{}209|219|}
{2010604001|XXGgraph_flow_flow|409|0|628|0|{Flow_1|}219|220|}
{2010601001|XXGgraph_vertex_vertex|410|0|630|0|{Partition_by_Key|}219|221|}
{2010212001|XXGvertex_oport_oport|411|0|632|0|{0|out|}221|222|}
{2010213001|XXGoport_dst_flow|412|0|634|0|{0|}222|220|}
{2010211001|XXGvertex_iport_iport|413|0|635|0|{0|in|}221|223|}
{2010007001|XXGobject_proto_object|414|0|637|0|{}221|224|}
{2010212001|XXGvertex_oport_oport|415|0|639|0|{0|out|}224|225|}
{2010006001|XXGobject_psameas_object|416|0|641|0|{metadata|out_metadata|1|0|}225|224|}
{2010211001|XXGvertex_iport_iport|417|0|642|0|{0|in|}224|226|}
{2010006001|XXGobject_psameas_object|418|0|644|0|{metadata|in_metadata|1|0|}226|224|}
{2010006001|XXGobject_psameas_object|419|0|645|0|{Layout|InputLayout|1|0|}221|219|}
{2010006001|XXGobject_psameas_object|420|0|646|0|{key|Key|1|0|}221|219|}
{2010601001|XXGgraph_vertex_vertex|421|0|647|0|{Sort|}219|227|}
{2010212001|XXGvertex_oport_oport|422|0|649|0|{0|out|}227|228|}
{2010211001|XXGvertex_iport_iport|423|0|651|0|{0|in|}227|229|}
{2010214001|XXGiport_src_flow|424|0|653|0|{0|}229|220|}
{2010007001|XXGobject_proto_object|425|0|654|0|{}227|230|}
{2010212001|XXGvertex_oport_oport|426|0|656|0|{0|out|}230|231|}
{2010006001|XXGobject_psameas_object|427|0|658|0|{metadata|out_metadata|1|0|}231|230|}
{2010211001|XXGvertex_iport_iport|428|0|659|0|{0|in|}230|232|}
{2010006001|XXGobject_psameas_object|429|0|661|0|{metadata|in_metadata|1|0|}232|230|}
{2010006001|XXGobject_psameas_object|430|0|662|0|{Layout|OutputLayout|1|0|}227|219|}
{2010006001|XXGobject_psameas_object|431|0|663|0|{key|Key|1|0|}227|219|}
{2010006001|XXGobject_psameas_object|432|0|664|0|{max_core|Max_core|1|0|}227|219|}
{2010212001|XXGvertex_oport_oport|433|0|665|0|{0|out0|}219|233|}
{2010216002|XXGoport_binding_oport|434|0|667|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}233|228|}
{2010211001|XXGvertex_iport_iport|435|0|668|0|{0|in0|}219|234|}
{2010215002|XXGiport_binding_iport|436|0|670|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}234|223|}
{2010006001|XXGobject_psameas_object|437|0|671|0|{InputLayout|Layout|0|0|}209|97|}
{2010006001|XXGobject_psameas_object|438|0|672|0|{OutputLayout|Layout|0|0|}209|97|}
{2010601001|XXGgraph_vertex_vertex|439|0|673|0|{PBKS_ICFF_KEY_2|}1|235|}
{2010604001|XXGgraph_flow_flow|440|0|675|0|{Flow_1|}235|236|}
{2010601001|XXGgraph_vertex_vertex|441|0|677|0|{Partition_by_Key|}235|237|}
{2010212001|XXGvertex_oport_oport|442|0|679|0|{0|out|}237|238|}
{2010213001|XXGoport_dst_flow|443|0|681|0|{0|}238|236|}
{2010211001|XXGvertex_iport_iport|444|0|682|0|{0|in|}237|239|}
{2010006001|XXGobject_psameas_object|445|0|684|0|{in_metadata|out0_metadata|0|0|}237|105|}
{2010006001|XXGobject_psameas_object|446|0|685|0|{out_metadata|out0_metadata|0|0|}237|105|}
{2010601001|XXGgraph_vertex_vertex|447|0|686|0|{Sort|}235|240|}
{2010212001|XXGvertex_oport_oport|448|0|688|0|{0|out|}240|241|}
{2010211001|XXGvertex_iport_iport|449|0|690|0|{0|in|}240|242|}
{2010214001|XXGiport_src_flow|450|0|692|0|{0|}242|236|}
{2010006001|XXGobject_psameas_object|451|0|693|0|{in_metadata|out0_metadata|0|0|}240|105|}
{2010006001|XXGobject_psameas_object|452|0|694|0|{out_metadata|out0_metadata|0|0|}240|105|}
{2010212001|XXGvertex_oport_oport|453|0|695|0|{0|out0|}235|243|}
{2010216002|XXGoport_binding_oport|454|0|697|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}243|241|}
{2010213001|XXGoport_dst_flow|455|0|698|0|{0|}243|8|}
{2010211001|XXGvertex_iport_iport|456|0|699|0|{0|in0|}235|244|}
{2010215002|XXGiport_binding_iport|457|0|701|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}244|239|}
{2010214001|XXGiport_src_flow|458|0|702|0|{0|}244|7|}
{2010007001|XXGobject_proto_object|459|0|703|0|{}235|245|}
{2010604001|XXGgraph_flow_flow|460|0|705|0|{Flow_1|}245|246|}
{2010601001|XXGgraph_vertex_vertex|461|0|707|0|{Partition_by_Key|}245|247|}
{2010212001|XXGvertex_oport_oport|462|0|709|0|{0|out|}247|248|}
{2010213001|XXGoport_dst_flow|463|0|711|0|{0|}248|246|}
{2010211001|XXGvertex_iport_iport|464|0|712|0|{0|in|}247|249|}
{2010007001|XXGobject_proto_object|465|0|714|0|{}247|250|}
{2010212001|XXGvertex_oport_oport|466|0|716|0|{0|out|}250|251|}
{2010006001|XXGobject_psameas_object|467|0|718|0|{metadata|out_metadata|1|0|}251|250|}
{2010211001|XXGvertex_iport_iport|468|0|719|0|{0|in|}250|252|}
{2010006001|XXGobject_psameas_object|469|0|721|0|{metadata|in_metadata|1|0|}252|250|}
{2010006001|XXGobject_psameas_object|470|0|722|0|{Layout|InputLayout|1|0|}247|245|}
{2010006001|XXGobject_psameas_object|471|0|723|0|{key|Key|1|0|}247|245|}
{2010601001|XXGgraph_vertex_vertex|472|0|724|0|{Sort|}245|253|}
{2010212001|XXGvertex_oport_oport|473|0|726|0|{0|out|}253|254|}
{2010211001|XXGvertex_iport_iport|474|0|728|0|{0|in|}253|255|}
{2010214001|XXGiport_src_flow|475|0|730|0|{0|}255|246|}
{2010007001|XXGobject_proto_object|476|0|731|0|{}253|256|}
{2010212001|XXGvertex_oport_oport|477|0|733|0|{0|out|}256|257|}
{2010006001|XXGobject_psameas_object|478|0|735|0|{metadata|out_metadata|1|0|}257|256|}
{2010211001|XXGvertex_iport_iport|479|0|736|0|{0|in|}256|258|}
{2010006001|XXGobject_psameas_object|480|0|738|0|{metadata|in_metadata|1|0|}258|256|}
{2010006001|XXGobject_psameas_object|481|0|739|0|{Layout|OutputLayout|1|0|}253|245|}
{2010006001|XXGobject_psameas_object|482|0|740|0|{key|Key|1|0|}253|245|}
{2010006001|XXGobject_psameas_object|483|0|741|0|{max_core|Max_core|1|0|}253|245|}
{2010212001|XXGvertex_oport_oport|484|0|742|0|{0|out0|}245|259|}
{2010216002|XXGoport_binding_oport|485|0|744|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}259|254|}
{2010211001|XXGvertex_iport_iport|486|0|745|0|{0|in0|}245|260|}
{2010215002|XXGiport_binding_iport|487|0|747|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}260|249|}
{2010006001|XXGobject_psameas_object|488|0|748|0|{InputLayout|Layout|0|0|}235|117|}
{2010006001|XXGobject_psameas_object|489|0|749|0|{OutputLayout|Layout|0|0|}235|97|}
{2010601001|XXGgraph_vertex_vertex|490|0|750|0|{PBKS_ICFF_KEY_3|}1|261|}
{2010604001|XXGgraph_flow_flow|491|0|752|0|{Flow_1|}261|262|}
{2010601001|XXGgraph_vertex_vertex|492|0|754|0|{Partition_by_Key|}261|263|}
{2010212001|XXGvertex_oport_oport|493|0|756|0|{0|out|}263|264|}
{2010213001|XXGoport_dst_flow|494|0|758|0|{0|}264|262|}
{2010211001|XXGvertex_iport_iport|495|0|759|0|{0|in|}263|265|}
{2010006001|XXGobject_psameas_object|496|0|761|0|{in_metadata|read_metadata|0|0|}263|179|}
{2010006001|XXGobject_psameas_object|497|0|762|0|{out_metadata|read_metadata|0|0|}263|179|}
{2010601001|XXGgraph_vertex_vertex|498|0|763|0|{Sort|}261|266|}
{2010212001|XXGvertex_oport_oport|499|0|765|0|{0|out|}266|267|}
{2010211001|XXGvertex_iport_iport|500|0|767|0|{0|in|}266|268|}
{2010214001|XXGiport_src_flow|501|0|769|0|{0|}268|262|}
{2010006001|XXGobject_psameas_object|502|0|770|0|{in_metadata|read_metadata|0|0|}266|179|}
{2010006001|XXGobject_psameas_object|503|0|771|0|{out_metadata|read_metadata|0|0|}266|179|}
{2010212001|XXGvertex_oport_oport|504|0|772|0|{0|out0|}261|269|}
{2010216002|XXGoport_binding_oport|505|0|774|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}269|267|}
{2010213001|XXGoport_dst_flow|506|0|775|0|{0|}269|11|}
{2010211001|XXGvertex_iport_iport|507|0|776|0|{0|in0|}261|270|}
{2010215002|XXGiport_binding_iport|508|0|778|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}270|265|}
{2010214001|XXGiport_src_flow|509|0|779|0|{0|}270|17|}
{2010007001|XXGobject_proto_object|510|0|780|0|{}261|271|}
{2010604001|XXGgraph_flow_flow|511|0|782|0|{Flow_1|}271|272|}
{2010601001|XXGgraph_vertex_vertex|512|0|784|0|{Partition_by_Key|}271|273|}
{2010212001|XXGvertex_oport_oport|513|0|786|0|{0|out|}273|274|}
{2010213001|XXGoport_dst_flow|514|0|788|0|{0|}274|272|}
{2010211001|XXGvertex_iport_iport|515|0|789|0|{0|in|}273|275|}
{2010007001|XXGobject_proto_object|516|0|791|0|{}273|276|}
{2010212001|XXGvertex_oport_oport|517|0|793|0|{0|out|}276|277|}
{2010006001|XXGobject_psameas_object|518|0|795|0|{metadata|out_metadata|1|0|}277|276|}
{2010211001|XXGvertex_iport_iport|519|0|796|0|{0|in|}276|278|}
{2010006001|XXGobject_psameas_object|520|0|798|0|{metadata|in_metadata|1|0|}278|276|}
{2010006001|XXGobject_psameas_object|521|0|799|0|{Layout|InputLayout|1|0|}273|271|}
{2010006001|XXGobject_psameas_object|522|0|800|0|{key|Key|1|0|}273|271|}
{2010601001|XXGgraph_vertex_vertex|523|0|801|0|{Sort|}271|279|}
{2010212001|XXGvertex_oport_oport|524|0|803|0|{0|out|}279|280|}
{2010211001|XXGvertex_iport_iport|525|0|805|0|{0|in|}279|281|}
{2010214001|XXGiport_src_flow|526|0|807|0|{0|}281|272|}
{2010007001|XXGobject_proto_object|527|0|808|0|{}279|282|}
{2010212001|XXGvertex_oport_oport|528|0|810|0|{0|out|}282|283|}
{2010006001|XXGobject_psameas_object|529|0|812|0|{metadata|out_metadata|1|0|}283|282|}
{2010211001|XXGvertex_iport_iport|530|0|813|0|{0|in|}282|284|}
{2010006001|XXGobject_psameas_object|531|0|815|0|{metadata|in_metadata|1|0|}284|282|}
{2010006001|XXGobject_psameas_object|532|0|816|0|{Layout|OutputLayout|1|0|}279|271|}
{2010006001|XXGobject_psameas_object|533|0|817|0|{key|Key|1|0|}279|271|}
{2010006001|XXGobject_psameas_object|534|0|818|0|{max_core|Max_core|1|0|}279|271|}
{2010212001|XXGvertex_oport_oport|535|0|819|0|{0|out0|}271|285|}
{2010216002|XXGoport_binding_oport|536|0|821|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}285|280|}
{2010211001|XXGvertex_iport_iport|537|0|822|0|{0|in0|}271|286|}
{2010215002|XXGiport_binding_iport|538|0|824|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}286|275|}
{2010006001|XXGobject_psameas_object|539|0|825|0|{InputLayout|Layout|0|0|}261|179|}
{2010006001|XXGobject_psameas_object|540|0|826|0|{OutputLayout|Layout|0|0|}261|97|}
{2010601001|XXGgraph_vertex_vertex|541|0|827|0|{RFMT_Get_Hash_and_src_env_rank|}1|51|}
{2010601001|XXGgraph_vertex_vertex|542|0|828|0|{Reformat|}1|105|}
{2010601001|XXGgraph_vertex_vertex|543|0|829|0|{Reformat_1|}1|287|}
{2010212001|XXGvertex_oport_oport|544|0|831|0|{0|out0|}287|288|}
{2010213001|XXGoport_dst_flow|545|0|833|0|{0|}288|20|}
{2010212001|XXGvertex_oport_oport|546|0|834|0|{1|reject0|}287|289|}
{2010212001|XXGvertex_oport_oport|547|0|836|0|{2|error0|}287|290|}
{2010212001|XXGvertex_oport_oport|548|0|838|0|{3|log|}287|291|}
{2010211001|XXGvertex_iport_iport|549|0|840|0|{0|in|}287|292|}
{2010214001|XXGiport_src_flow|550|0|842|0|{0|}292|12|}
{2010007001|XXGobject_proto_object|551|0|843|0|{}287|293|}
{2010212001|XXGvertex_oport_oport|552|0|845|0|{0|out0|}293|294|}
{2010006001|XXGobject_psameas_object|553|0|847|0|{metadata|out0_metadata|1|0|}294|293|}
{2010006001|XXGobject_psameas_object|554|0|848|0|{transform0|transform0|1|0|}294|293|}
{2010212001|XXGvertex_oport_oport|555|0|849|0|{1|reject0|}293|295|}
{2010006001|XXGobject_psameas_object|556|0|851|0|{metadata|reject0_metadata|1|0|}295|293|}
{2010212001|XXGvertex_oport_oport|557|0|852|0|{2|error0|}293|296|}
{2010006001|XXGobject_psameas_object|558|0|854|0|{metadata|error0_metadata|1|0|}296|293|}
{2010212001|XXGvertex_oport_oport|559|0|855|0|{3|log|}293|297|}
{2010006001|XXGobject_psameas_object|560|0|857|0|{metadata|log_metadata|1|0|}297|293|}
{2010211001|XXGvertex_iport_iport|561|0|858|0|{0|in|}293|298|}
{2010006001|XXGobject_psameas_object|562|0|860|0|{metadata|in_metadata|1|0|}298|293|}
{2010006001|XXGobject_psameas_object|563|0|861|0|{Layout|Layout|0|0|}287|97|}
{2010006001|XXGobject_psameas_object|564|0|862|0|{in_metadata|out0_metadata|0|0|}287|105|}
{2010006001|XXGobject_psameas_object|565|0|863|0|{out0_metadata|read_metadata|0|0|}287|179|}
{2010006001|XXGobject_psameas_object|566|0|864|0|{reject0_metadata|out0_metadata|0|0|}287|105|}
{2010601001|XXGgraph_vertex_vertex|567|0|865|0|{Sort_within_Groups|}1|299|}
{2010212001|XXGvertex_oport_oport|568|0|867|0|{0|out|}299|300|}
{2010213001|XXGoport_dst_flow|569|0|869|0|{0|}300|13|}
{2010211001|XXGvertex_iport_iport|570|0|870|0|{0|in|}299|301|}
{2010214001|XXGiport_src_flow|571|0|872|0|{0|}301|11|}
{2010007001|XXGobject_proto_object|572|0|873|0|{}299|302|}
{2010212001|XXGvertex_oport_oport|573|0|875|0|{0|out|}302|303|}
{2010006001|XXGobject_psameas_object|574|0|877|0|{metadata|out_metadata|1|0|}303|302|}
{2010211001|XXGvertex_iport_iport|575|0|878|0|{0|in|}302|304|}
{2010006001|XXGobject_psameas_object|576|0|880|0|{metadata|in_metadata|1|0|}304|302|}
{2010006001|XXGobject_psameas_object|577|0|881|0|{Layout|Layout|0|0|}299|97|}
{2010006001|XXGobject_psameas_object|578|0|882|0|{in_metadata|read_metadata|0|0|}299|179|}
{2010006001|XXGobject_psameas_object|579|0|883|0|{out_metadata|read_metadata|0|0|}299|179|}
{2010601001|XXGgraph_vertex_vertex|580|0|884|0|{Write_Xref_files|}1|305|}
{2010605001|XXGgraph_legend_legend|581|0|886|0|{0|}305|306|}
{2010241001|XXGlegend_face_face|582|0|888|0|{}306|307|}
{2010605001|XXGgraph_legend_legend|583|0|890|0|{1|}305|308|}
{2010241001|XXGlegend_face_face|584|0|892|0|{}308|309|}
{2010604001|XXGgraph_flow_flow|585|0|894|0|{Flow_1|}305|310|}
{2010604001|XXGgraph_flow_flow|586|0|896|0|{Flow_2|}305|311|}
{2010604001|XXGgraph_flow_flow|587|0|898|0|{Flow_3|}305|312|}
{2010601001|XXGgraph_vertex_vertex|588|0|900|0|{Dummy_Replicate|}305|313|}
{2010212001|XXGvertex_oport_oport|589|0|902|0|{0|out|}313|314|}
{2010213001|XXGoport_dst_flow|590|0|904|0|{0|}314|312|}
{2010211001|XXGvertex_iport_iport|591|0|905|0|{0|in|}313|315|}
{2010214001|XXGiport_src_flow|592|0|907|0|{0|}315|310|}
{2010007001|XXGobject_proto_object|593|0|908|0|{}313|316|}
{2010212001|XXGvertex_oport_oport|594|0|910|0|{0|out|}316|317|}
{2010006001|XXGobject_psameas_object|595|0|912|0|{metadata|out_metadata|1|0|}317|316|}
{2010211001|XXGvertex_iport_iport|596|0|913|0|{0|in|}316|318|}
{2010006001|XXGobject_psameas_object|597|0|915|0|{metadata|in_metadata|1|0|}318|316|}
{2010006001|XXGobject_psameas_object|598|0|916|0|{Layout|Layout|0|0|}313|43|}
{2010006001|XXGobject_psameas_object|599|0|917|0|{in_metadata|out0_metadata|0|0|}313|319|}
{2010212001|XXGvertex_oport_oport|600|0|919|0|{0|out0|}319|320|}
{2010213001|XXGoport_dst_flow|601|0|921|0|{0|}320|311|}
{2010212001|XXGvertex_oport_oport|602|0|922|0|{1|reject0|}319|321|}
{2010212001|XXGvertex_oport_oport|603|0|924|0|{2|error0|}319|322|}
{2010212001|XXGvertex_oport_oport|604|0|926|0|{3|log|}319|323|}
{2010211001|XXGvertex_iport_iport|605|0|928|0|{0|in|}319|324|}
{2010007001|XXGobject_proto_object|606|0|930|0|{}319|325|}
{2010212001|XXGvertex_oport_oport|607|0|932|0|{0|out0|}325|326|}
{2010006001|XXGobject_psameas_object|608|0|934|0|{metadata|out0_metadata|1|0|}326|325|}
{2010006001|XXGobject_psameas_object|609|0|935|0|{transform0|transform0|1|0|}326|325|}
{2010212001|XXGvertex_oport_oport|610|0|936|0|{1|reject0|}325|327|}
{2010006001|XXGobject_psameas_object|611|0|938|0|{metadata|reject0_metadata|1|0|}327|325|}
{2010212001|XXGvertex_oport_oport|612|0|939|0|{2|error0|}325|328|}
{2010006001|XXGobject_psameas_object|613|0|941|0|{metadata|error0_metadata|1|0|}328|325|}
{2010212001|XXGvertex_oport_oport|614|0|942|0|{3|log|}325|329|}
{2010006001|XXGobject_psameas_object|615|0|944|0|{metadata|log_metadata|1|0|}329|325|}
{2010211001|XXGvertex_iport_iport|616|0|945|0|{0|in|}325|330|}
{2010006001|XXGobject_psameas_object|617|0|947|0|{metadata|in_metadata|1|0|}330|325|}
{2010006001|XXGobject_psameas_object|618|0|948|0|{Layout|Layout|0|0|}319|43|}
{2010006001|XXGobject_psameas_object|619|0|949|0|{in_metadata|out0_metadata|0|0|}319|51|}
{2010006001|XXGobject_psameas_object|620|0|950|0|{reject0_metadata|out0_metadata|0|0|}319|51|}
{2010006001|XXGobject_psameas_object|621|0|951|0|{out_metadata|out0_metadata|0|0|}313|319|}
{2010601001|XXGgraph_vertex_vertex|622|0|952|0|{RFMT_Drop_columns|}305|319|}
{2010601001|XXGgraph_vertex_vertex|623|0|953|0|{Replicate|}305|331|}
{2010212001|XXGvertex_oport_oport|624|0|955|0|{0|out|}331|332|}
{2010213001|XXGoport_dst_flow|625|0|957|0|{0|}332|310|}
{2010211001|XXGvertex_iport_iport|626|0|958|0|{0|in|}331|333|}
{2010214001|XXGiport_src_flow|627|0|960|0|{0|}333|311|}
{2010007001|XXGobject_proto_object|628|0|961|0|{}331|334|}
{2010212001|XXGvertex_oport_oport|629|0|963|0|{0|out|}334|335|}
{2010006001|XXGobject_psameas_object|630|0|965|0|{metadata|out_metadata|1|0|}335|334|}
{2010211001|XXGvertex_iport_iport|631|0|966|0|{0|in|}334|336|}
{2010006001|XXGobject_psameas_object|632|0|968|0|{metadata|in_metadata|1|0|}336|334|}
{2010006001|XXGobject_psameas_object|633|0|969|0|{Layout|Layout|0|0|}331|43|}
{2010006001|XXGobject_psameas_object|634|0|970|0|{in_metadata|out0_metadata|0|0|}331|319|}
{2010006001|XXGobject_psameas_object|635|0|971|0|{out_metadata|out0_metadata|0|0|}331|319|}
{2010601001|XXGgraph_vertex_vertex|636|0|972|0|{Write_Multifile_Xref_ICFF_LookUp|}305|337|}
{2010604001|XXGgraph_flow_flow|637|0|974|0|{Flow_2|}337|45|}
{2010604001|XXGgraph_flow_flow|638|0|975|0|{Flow_6|}337|47|}
{2010604001|XXGgraph_flow_flow|639|0|976|0|{Flow_7|}337|338|}
{2010601001|XXGgraph_vertex_vertex|640|0|978|0|{View_Data|}337|339|}
{2010211001|XXGvertex_iport_iport|641|0|980|0|{0|write|}339|340|}
{2010214001|XXGiport_src_flow|642|0|982|0|{0|}340|45|}
{2010007001|XXGobject_proto_object|643|0|983|0|{}339|341|}
{2010211001|XXGvertex_iport_iport|644|0|985|0|{0|write|}341|342|}
{2010006001|XXGobject_psameas_object|645|0|987|0|{metadata|write_metadata|1|0|}342|341|}
{2010601001|XXGgraph_vertex_vertex|646|0|988|0|{Write_Block_Compressed_Lookup|}337|343|}
{2010212001|XXGvertex_oport_oport|647|0|990|0|{0|out|}343|344|}
{2010213001|XXGoport_dst_flow|648|0|992|0|{0|}344|47|}
{2010212001|XXGvertex_oport_oport|649|0|993|0|{1|index|}343|345|}
{2010213001|XXGoport_dst_flow|650|0|995|0|{0|}345|338|}
{2010212001|XXGvertex_oport_oport|651|0|996|0|{2|address|}343|346|}
{2010211001|XXGvertex_iport_iport|652|0|998|0|{0|in|}343|347|}
{2010007001|XXGobject_proto_object|653|0|1000|0|{}343|348|}
{2010212001|XXGvertex_oport_oport|654|0|1002|0|{0|out|}348|349|}
{2010006001|XXGobject_psameas_object|655|0|1004|0|{metadata|out_metadata|1|0|}349|348|}
{2010212001|XXGvertex_oport_oport|656|0|1005|0|{1|index|}348|350|}
{2010006001|XXGobject_psameas_object|657|0|1007|0|{metadata|index_metadata|1|0|}350|348|}
{2010212001|XXGvertex_oport_oport|658|0|1008|0|{2|address|}348|351|}
{2010006001|XXGobject_psameas_object|659|0|1010|0|{metadata|address_metadata|1|0|}351|348|}
{2010211001|XXGvertex_iport_iport|660|0|1011|0|{0|in|}348|352|}
{2010006001|XXGobject_psameas_object|661|0|1013|0|{metadata|in_metadata|1|0|}352|348|}
{2010006001|XXGobject_psameas_object|662|0|1014|0|{Layout|Layout|0|0|}343|43|}
{2010006001|XXGobject_psameas_object|663|0|1015|0|{in_metadata|out0_metadata|0|0|}343|319|}
{2010006001|XXGobject_psameas_object|664|0|1016|0|{out_metadata|write_metadata|0|0|}343|43|}
{2010601001|XXGgraph_vertex_vertex|665|0|1017|0|{Xref_ICFF_Data_File|}337|43|}
{2010601001|XXGgraph_vertex_vertex|666|0|1018|0|{Xref_ICFF_Index_File|}337|353|}
{2010211001|XXGvertex_iport_iport|667|0|1020|0|{0|write|}353|354|}
{2010214001|XXGiport_src_flow|668|0|1022|0|{0|}354|338|}
{2010007001|XXGobject_proto_object|669|0|1023|0|{}353|355|}
{2010211001|XXGvertex_iport_iport|670|0|1025|0|{0|write|}355|356|}
{2010006001|XXGobject_psameas_object|671|0|1027|0|{metadata|write_metadata|1|0|}356|355|}
{2010006001|XXGobject_psameas_object|672|0|1028|0|{write_metadata|index_metadata|0|0|}353|343|}
{2010211001|XXGvertex_iport_iport|673|0|1029|0|{0|in0|}337|357|}
{2010215002|XXGiport_binding_iport|674|0|1031|0|{.5|.5|{0|}10590|}357|347|}
{2010214001|XXGiport_src_flow|675|0|1032|0|{0|}357|312|}
{2010211001|XXGvertex_iport_iport|676|0|1033|0|{0|in0|}305|358|}
{2010215002|XXGiport_binding_iport|677|0|1035|0|{.5|.5|{0|}10815|}358|324|}
{2010214001|XXGiport_src_flow|678|0|1036|0|{0|}358|5|}
{2010601001|XXGgraph_vertex_vertex|679|0|1037|0|{Write_Xref_files_1|}1|359|}
{2010605001|XXGgraph_legend_legend|680|0|1039|0|{0|}359|360|}
{2010241001|XXGlegend_face_face|681|0|1041|0|{}360|361|}
{2010605001|XXGgraph_legend_legend|682|0|1043|0|{1|}359|362|}
{2010241001|XXGlegend_face_face|683|0|1045|0|{}362|363|}
{2010604001|XXGgraph_flow_flow|684|0|1047|0|{Flow_1|}359|364|}
{2010604001|XXGgraph_flow_flow|685|0|1049|0|{Flow_2|}359|365|}
{2010604001|XXGgraph_flow_flow|686|0|1051|0|{Flow_3|}359|366|}
{2010601001|XXGgraph_vertex_vertex|687|0|1053|0|{Dummy_Replicate|}359|367|}
{2010212001|XXGvertex_oport_oport|688|0|1055|0|{0|out|}367|368|}
{2010213001|XXGoport_dst_flow|689|0|1057|0|{0|}368|366|}
{2010211001|XXGvertex_iport_iport|690|0|1058|0|{0|in|}367|369|}
{2010214001|XXGiport_src_flow|691|0|1060|0|{0|}369|364|}
{2010007001|XXGobject_proto_object|692|0|1061|0|{}367|370|}
{2010212001|XXGvertex_oport_oport|693|0|1063|0|{0|out|}370|371|}
{2010006001|XXGobject_psameas_object|694|0|1065|0|{metadata|out_metadata|1|0|}371|370|}
{2010211001|XXGvertex_iport_iport|695|0|1066|0|{0|in|}370|372|}
{2010006001|XXGobject_psameas_object|696|0|1068|0|{metadata|in_metadata|1|0|}372|370|}
{2010006001|XXGobject_psameas_object|697|0|1069|0|{Layout|Layout|0|0|}367|97|}
{2010006001|XXGobject_psameas_object|698|0|1070|0|{in_metadata|out0_metadata|0|0|}367|373|}
{2010212001|XXGvertex_oport_oport|699|0|1072|0|{0|out0|}373|374|}
{2010213001|XXGoport_dst_flow|700|0|1074|0|{0|}374|365|}
{2010212001|XXGvertex_oport_oport|701|0|1075|0|{1|reject0|}373|375|}
{2010212001|XXGvertex_oport_oport|702|0|1077|0|{2|error0|}373|376|}
{2010212001|XXGvertex_oport_oport|703|0|1079|0|{3|log|}373|377|}
{2010211001|XXGvertex_iport_iport|704|0|1081|0|{0|in|}373|378|}
{2010007001|XXGobject_proto_object|705|0|1083|0|{}373|379|}
{2010212001|XXGvertex_oport_oport|706|0|1085|0|{0|out0|}379|380|}
{2010006001|XXGobject_psameas_object|707|0|1087|0|{metadata|out0_metadata|1|0|}380|379|}
{2010006001|XXGobject_psameas_object|708|0|1088|0|{transform0|transform0|1|0|}380|379|}
{2010212001|XXGvertex_oport_oport|709|0|1089|0|{1|reject0|}379|381|}
{2010006001|XXGobject_psameas_object|710|0|1091|0|{metadata|reject0_metadata|1|0|}381|379|}
{2010212001|XXGvertex_oport_oport|711|0|1092|0|{2|error0|}379|382|}
{2010006001|XXGobject_psameas_object|712|0|1094|0|{metadata|error0_metadata|1|0|}382|379|}
{2010212001|XXGvertex_oport_oport|713|0|1095|0|{3|log|}379|383|}
{2010006001|XXGobject_psameas_object|714|0|1097|0|{metadata|log_metadata|1|0|}383|379|}
{2010211001|XXGvertex_iport_iport|715|0|1098|0|{0|in|}379|384|}
{2010006001|XXGobject_psameas_object|716|0|1100|0|{metadata|in_metadata|1|0|}384|379|}
{2010006001|XXGobject_psameas_object|717|0|1101|0|{Layout|Layout|0|0|}373|97|}
{2010006001|XXGobject_psameas_object|718|0|1102|0|{in_metadata|read_metadata|0|0|}373|179|}
{2010006001|XXGobject_psameas_object|719|0|1103|0|{reject0_metadata|read_metadata|0|0|}373|179|}
{2010006001|XXGobject_psameas_object|720|0|1104|0|{out_metadata|out0_metadata|0|0|}367|373|}
{2010601001|XXGgraph_vertex_vertex|721|0|1105|0|{RFMT_Drop_columns|}359|373|}
{2010601001|XXGgraph_vertex_vertex|722|0|1106|0|{Replicate|}359|385|}
{2010212001|XXGvertex_oport_oport|723|0|1108|0|{0|out|}385|386|}
{2010213001|XXGoport_dst_flow|724|0|1110|0|{0|}386|364|}
{2010211001|XXGvertex_iport_iport|725|0|1111|0|{0|in|}385|387|}
{2010214001|XXGiport_src_flow|726|0|1113|0|{0|}387|365|}
{2010007001|XXGobject_proto_object|727|0|1114|0|{}385|388|}
{2010212001|XXGvertex_oport_oport|728|0|1116|0|{0|out|}388|389|}
{2010006001|XXGobject_psameas_object|729|0|1118|0|{metadata|out_metadata|1|0|}389|388|}
{2010211001|XXGvertex_iport_iport|730|0|1119|0|{0|in|}388|390|}
{2010006001|XXGobject_psameas_object|731|0|1121|0|{metadata|in_metadata|1|0|}390|388|}
{2010006001|XXGobject_psameas_object|732|0|1122|0|{Layout|Layout|0|0|}385|97|}
{2010006001|XXGobject_psameas_object|733|0|1123|0|{in_metadata|out0_metadata|0|0|}385|373|}
{2010006001|XXGobject_psameas_object|734|0|1124|0|{out_metadata|out0_metadata|0|0|}385|373|}
{2010601001|XXGgraph_vertex_vertex|735|0|1125|0|{Write_Multifile_Xref_ICFF_LookUp|}359|391|}
{2010604001|XXGgraph_flow_flow|736|0|1127|0|{Flow_2|}391|99|}
{2010604001|XXGgraph_flow_flow|737|0|1128|0|{Flow_6|}391|101|}
{2010604001|XXGgraph_flow_flow|738|0|1129|0|{Flow_7|}391|392|}
{2010601001|XXGgraph_vertex_vertex|739|0|1131|0|{View_Data|}391|393|}
{2010211001|XXGvertex_iport_iport|740|0|1133|0|{0|write|}393|394|}
{2010214001|XXGiport_src_flow|741|0|1135|0|{0|}394|99|}
{2010007001|XXGobject_proto_object|742|0|1136|0|{}393|395|}
{2010211001|XXGvertex_iport_iport|743|0|1138|0|{0|write|}395|396|}
{2010006001|XXGobject_psameas_object|744|0|1140|0|{metadata|write_metadata|1|0|}396|395|}
{2010601001|XXGgraph_vertex_vertex|745|0|1141|0|{Write_Block_Compressed_Lookup|}391|397|}
{2010212001|XXGvertex_oport_oport|746|0|1143|0|{0|out|}397|398|}
{2010213001|XXGoport_dst_flow|747|0|1145|0|{0|}398|101|}
{2010212001|XXGvertex_oport_oport|748|0|1146|0|{1|index|}397|399|}
{2010213001|XXGoport_dst_flow|749|0|1148|0|{0|}399|392|}
{2010212001|XXGvertex_oport_oport|750|0|1149|0|{2|address|}397|400|}
{2010211001|XXGvertex_iport_iport|751|0|1151|0|{0|in|}397|401|}
{2010007001|XXGobject_proto_object|752|0|1153|0|{}397|402|}
{2010212001|XXGvertex_oport_oport|753|0|1155|0|{0|out|}402|403|}
{2010006001|XXGobject_psameas_object|754|0|1157|0|{metadata|out_metadata|1|0|}403|402|}
{2010212001|XXGvertex_oport_oport|755|0|1158|0|{1|index|}402|404|}
{2010006001|XXGobject_psameas_object|756|0|1160|0|{metadata|index_metadata|1|0|}404|402|}
{2010212001|XXGvertex_oport_oport|757|0|1161|0|{2|address|}402|405|}
{2010006001|XXGobject_psameas_object|758|0|1163|0|{metadata|address_metadata|1|0|}405|402|}
{2010211001|XXGvertex_iport_iport|759|0|1164|0|{0|in|}402|406|}
{2010006001|XXGobject_psameas_object|760|0|1166|0|{metadata|in_metadata|1|0|}406|402|}
{2010006001|XXGobject_psameas_object|761|0|1167|0|{Layout|Layout|0|0|}397|97|}
{2010006001|XXGobject_psameas_object|762|0|1168|0|{in_metadata|out0_metadata|0|0|}397|373|}
{2010006001|XXGobject_psameas_object|763|0|1169|0|{out_metadata|write_metadata|0|0|}397|97|}
{2010601001|XXGgraph_vertex_vertex|764|0|1170|0|{Xref_ICFF_Data_File|}391|97|}
{2010601001|XXGgraph_vertex_vertex|765|0|1171|0|{Xref_ICFF_Index_File|}391|407|}
{2010211001|XXGvertex_iport_iport|766|0|1173|0|{0|write|}407|408|}
{2010214001|XXGiport_src_flow|767|0|1175|0|{0|}408|392|}
{2010007001|XXGobject_proto_object|768|0|1176|0|{}407|409|}
{2010211001|XXGvertex_iport_iport|769|0|1178|0|{0|write|}409|410|}
{2010006001|XXGobject_psameas_object|770|0|1180|0|{metadata|write_metadata|1|0|}410|409|}
{2010006001|XXGobject_psameas_object|771|0|1181|0|{write_metadata|index_metadata|0|0|}407|397|}
{2010211001|XXGvertex_iport_iport|772|0|1182|0|{0|in0|}391|411|}
{2010215002|XXGiport_binding_iport|773|0|1184|0|{.5|.5|{0|}10590|}411|401|}
{2010214001|XXGiport_src_flow|774|0|1185|0|{0|}411|366|}
{2010211001|XXGvertex_iport_iport|775|0|1186|0|{0|in0|}359|412|}
{2010215002|XXGiport_binding_iport|776|0|1188|0|{.5|.5|{0|}10815|}412|378|}
{2010214001|XXGiport_src_flow|777|0|1189|0|{0|}412|21|}
{2010601001|XXGgraph_vertex_vertex|778|0|1190|0|{XREF|}1|179|}
{2010109001|XXGobject_property_value|779|0|1191|0|{0|TrackingThumbprint|72|}1|413|}
