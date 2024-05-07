@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|32|rel_count|47|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|SYS_ID||3|9|K|Obsolete|{0|}}
{30001002|XXparameter|SOURCE_FILE_NAME|$AI_MFS/ilm/ilm.rxclaim_ctrx.rcex1p..ctrx_f_claim_transaction_cdur.$RUN_ID.dat.gz|3|9|EFK|Path to the clean file produced by a clean step.  Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$AI_DML/ilm/ilm.ctrx_f_claim_transaction_cdur.dml|3|9|EFK|Path to the record format for the clean source.  Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ expand_type(read_type(SOURCE_DML_FILE)) ]|3|9|RK|The record format for the clean source.|{0|}}
{30001002|XXparameter|SPLIT_DML_FILE|$AI_DML/split.ids_rxclaim/split.ids_rxclaim.f_claim_transaction_cli_in_t.dml|3|9|REK|Path to the record format for the ILM.  Defaults to a file name based on the ILM name.|{0|}}
{30001002|XXparameter|SPLIT_DML|$[ expand_type(read_file(SPLIT_DML_FILE)) ]|3|9|RK|The record format for the ILM.|{0|}}
{30001002|XXparameter|SPLIT_URL|mfile:$AI_MFS/split/split.ctrx_f_claim_transaction_cli_in_t.ids_rxclaim.f_claim_transaction_cli_in_t.$RUN_ID.dat.gz|28|9|REFK|The URL for the results of the mapping.  Exported from the ILM dataset.|{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|892000|480000|0|map.rxclaim.f_claim_transaction_cli_in_t|Kimbo Mundy|Created 5/27/2011 11:27:06 PM|1|10|0||9||34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1696000|340000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'map.rxclaim_ctrx.f_claim_transaction_cli_in_t' Execution Status Report


Job "map.rxclaim_ctrx.f_claim_transaction_cli_in_t" Execution started at Thursday, September 29, 2016 09:25:59
Job completed successfully at Thursday, September 29, 2016 09:26:09

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:10
Run performed by user jmishra3
Total data moved through all flows: 0 records (0 bytes)
Total CPU time (all processes): 1 seconds
Average CPU utilization across all nodes: 0.00 percent
||# Make sure the serial directories exist.
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/map.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_REJECT/map.$SOURCE_SYSTEM"

# Make sure the multifile directories exist.
for d in "$AI_MFS/ilm" "$AI_MFS_REJECT/map.$SOURCE_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d ")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done

export AB_REPORT="summary=$AI_SERIAL_LOG/map.$SOURCE_SYSTEM/map.$SOURCE_LOWER.$ILM_NAME.summary.log $AB_REPORT"

# This is a hack to make sure that all *_LOOKUP parameters are exported to the environment so that AB_CATALOG works as expected.
eval "$(set \| sed -n '/_LOOKUP=/s/\\(^[^=]*\\).*/export \\1="$\\1"/p')"
|if [[ ( x"$AB_APPCONF_EXECUTION" = x"true" \|\| x"$AB_APPCONF_EXECUTION" = x"True" ) && -f "$AI_RAW_TRACKING_FILE" ]]; then
  # These grep patterns need tweaking.
  AB_REPORT="monitor,flows totals" m_report_tracking -phase-end "$AI_RAW_TRACKING_FILE" \| egrep '_Filter * out\|Map_.** out0$\| dup\| [out0%]*reject\| second' 1>&2
fi


|@CLAIM_DW_SBOXSt|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|0|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Runs Once per Source/ILM Pair|374905|165440|305000|105000|315000|24000|6065|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|160|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Map a Cleansed Source to an ILM and multiple SPLIT files|15000|35155|0|0|0|0|6287|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|360|1|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}6327|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}6328|2065|}}
{2010501005|XXGpvertex|11|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|limit|$MAP_REJECT_LIMIT|3|2|$|@{0|}}
{30001002|XXparameter|ramp|$MAP_REJECT_RAMP|3|2|$|@{0|}}
{30001002|XXparameter|logging|True|3|1|l|@{0|}}
{30001002|XXparameter|log_reject|1000|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|doc_transform||3|2|$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin

  out.* :: in.f_c_tx_cdr.*;
  out.clt_awp_discount_rate :1: in.f_c_tx_cdr.clt_awp_discount_rate;
  out.app_awp_discount_rate  :2: 0;
  out.app_awp_discount_rate  :1: in.f_c_tx_cdr.app_awp_discount_rate ;
  out.clt_awp_discount_rate :2: 0;
  
 
  out.pbr_id :: in.d_pres_adjud.pbr_id; //Mapped on 12/14
  out.compound_cd :: in.compound.compound_cd;
  out.dea_cd :: in.dea.dea_cd;
  out.gpi_id :: in.gpi.gpi_id;
  out.gpi_list_qlfr_nm :: in.d_prod_adj.gpi_list_qlfr_nm;
  out.drg_admin_rte_hitsb_desc :: in.d_prod_adj.drg_admin_rte_hitsb_desc;
  out.ahfs_cd :: in.ahfs_cd.ahfs_cd;
  out.pbr_ntwrk_id :: in.d_pres_adjud.pbr_ntwrk_id;
  out.prod_id_qlfr_cd :: in.prod.prod_id_qlfr_cd;
  out.prod_id :: in.prod.prod_id;
  out.relationship_cd :: in.l_relnshp.relationship_cd;
  out.drg_maint_src :: in.d_prod_adj.drg_maint_src;
  out.drg_maint_cd :: in.d_prod_adj.drg_maint_cd;
  out.drg_nm_extn_id :: in.drug.drg_nm_extn_id;
  out.gender_cd :: in.gender.gender_cd;
  out.phr_ntwrk_carr_nm :: in.d_phrm_adj.phr_ntwrk_carr_nm;
  out.phr_ntwrk_typ_cd :: in.d_phrm_adj.phr_ntwrk_typ_cd;
  out.phr_ntwrk_qlfr_ind :: in.d_phrm_adj.phr_ntwrk_qlfr_ind;
  out.phr_ntwrk_prity_cd :: in.d_phrm_adj.phr_ntwrk_prity_cd;
  out.phr_ntwrk_nm :: in.d_phrm_adj.phr_ntwrk_nm;
  out.phr_ntwrk_id :: in.d_phrm_adj.phr_ntwrk_id;
  out.submd_phr_id_qlfr_cd :: in.d_phrm_adj.submd_phr_id_qlfr_cd;
  out.submd_phr_id :: in.d_phrm_adj.submd_phr_id;
  out.phr_id :: in.pharmacy.phr_id;
  out.pbr_spclty_cd :: in.pbr_spclty.pbr_spclty_cd;
  out.mbr_mcre_covrg_from_dt :: in.d_mem_adj.mbr_mcre_covrg_from_dt;
  out.mbr_id :: in.d_mbr.mbr_id;
  out.employer_group_id :: in.d_cag.employer_group_id;
  out.account_id :: in.d_cag.account_id;
  out.carrier_id :: in.d_cag.carrier_id;
  out.legacy_src_env_id :: in.f_c_tx_cdr.src_env_sk;
  out.pbr_id_st_cd::in.d_pres_adjud.pbr_id_st_cd;
  out.drg_ndc_id :: in.d_prod_adj.drg_ndc_id;
  out.residence_cd :: in.res_cd.residence_cd;
  out.pbr_dea_id :: in.d_pres_adjud.pbr_dea_id;
  out.pbr_npi    :: in.d_pres_adjud.pbr_npi;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@607681|231431|536000|156000|134000|107000|6329|Map to Split|Ab Initio Software|Built-in|1|100|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|12|0|23|0|{@{}@669000|204000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|13|0|26|0|{@{}@559000|262000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|14|0|28|0|{@{}@599000|262000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|15|0|30|0|{@{}@639000|262000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|16|0|32|0|{@{}@526000|204000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|17|0|35|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|output_index_signature|int out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1311717854|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|18|0|37|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|19|0|41|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|20|0|44|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|21|0|47|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|22|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|23|0|53|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout|$SPLIT_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@864162|248000|825000|185000|56000|50000|6326|Split File||@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|24|0|55|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|25|0|58|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|26|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|27|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|mfile:$SOURCE_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SOURCE_FILE_NAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@374231|250368|51000|185000|56000|50000|6325|Source||@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|28|0|65|0|{@{}@106000|204000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|29|0|68|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|30|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010110002|XXGconstant|31|0|77|0|{@{}@{1|5321873|}}}
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
{2010601001|XXGgraph_vertex_vertex|10|0|20|0|{Map_to_Split|}1|11|}
{2010212001|XXGvertex_oport_oport|11|0|22|0|{0|out0|}11|12|}
{2010213001|XXGoport_dst_flow|12|0|24|0|{0|}12|10|}
{2010212001|XXGvertex_oport_oport|13|0|25|0|{1|reject0|}11|13|}
{2010212001|XXGvertex_oport_oport|14|0|27|0|{2|error0|}11|14|}
{2010212001|XXGvertex_oport_oport|15|0|29|0|{3|log|}11|15|}
{2010211001|XXGvertex_iport_iport|16|0|31|0|{0|in|}11|16|}
{2010214001|XXGiport_src_flow|17|0|33|0|{0|}16|9|}
{2010007001|XXGobject_proto_object|18|0|34|0|{}11|17|}
{2010212001|XXGvertex_oport_oport|19|0|36|0|{0|out0|}17|18|}
{2010006001|XXGobject_psameas_object|20|0|38|0|{metadata|out0_metadata|1|0|}18|17|}
{2010006001|XXGobject_psameas_object|21|0|39|0|{transform0|transform0|1|0|}18|17|}
{2010212001|XXGvertex_oport_oport|22|0|40|0|{1|reject0|}17|19|}
{2010006001|XXGobject_psameas_object|23|0|42|0|{metadata|reject0_metadata|1|0|}19|17|}
{2010212001|XXGvertex_oport_oport|24|0|43|0|{2|error0|}17|20|}
{2010006001|XXGobject_psameas_object|25|0|45|0|{metadata|error0_metadata|1|0|}20|17|}
{2010212001|XXGvertex_oport_oport|26|0|46|0|{3|log|}17|21|}
{2010006001|XXGobject_psameas_object|27|0|48|0|{metadata|log_metadata|1|0|}21|17|}
{2010211001|XXGvertex_iport_iport|28|0|49|0|{0|in|}17|22|}
{2010006001|XXGobject_psameas_object|29|0|51|0|{metadata|in_metadata|1|0|}22|17|}
{2010006001|XXGobject_psameas_object|30|0|52|0|{Layout|Layout|0|0|}11|23|}
{2010211001|XXGvertex_iport_iport|31|0|54|0|{0|write|}23|24|}
{2010214001|XXGiport_src_flow|32|0|56|0|{0|}24|10|}
{2010007001|XXGobject_proto_object|33|0|57|0|{}23|25|}
{2010211001|XXGvertex_iport_iport|34|0|59|0|{0|write|}25|26|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{metadata|write_metadata|1|0|}26|25|}
{2010006001|XXGobject_psameas_object|36|0|62|0|{in_metadata|read_metadata|0|0|}11|27|}
{2010212001|XXGvertex_oport_oport|37|0|64|0|{0|read|}27|28|}
{2010213001|XXGoport_dst_flow|38|0|66|0|{0|}28|9|}
{2010007001|XXGobject_proto_object|39|0|67|0|{}27|29|}
{2010212001|XXGvertex_oport_oport|40|0|69|0|{0|read|}29|30|}
{2010006001|XXGobject_psameas_object|41|0|71|0|{metadata|read_metadata|1|0|}30|29|}
{2010006001|XXGobject_psameas_object|42|0|72|0|{out0_metadata|write_metadata|0|0|}11|23|}
{2010006001|XXGobject_psameas_object|43|0|73|0|{reject0_metadata|read_metadata|0|0|}11|27|}
{2010601001|XXGgraph_vertex_vertex|44|0|74|0|{Source|}1|27|}
{2010601001|XXGgraph_vertex_vertex|45|0|75|0|{Split_File|}1|23|}
{2010109001|XXGobject_property_value|46|0|76|0|{0|TrackingThumbprint|72|}1|31|}
