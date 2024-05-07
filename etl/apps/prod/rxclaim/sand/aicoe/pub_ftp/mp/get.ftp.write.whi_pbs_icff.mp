@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|350|rel_count|581|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_parameters_of_Updated_Source_File|@34|9|FHK|@{0|}}
{30001002|XXparameter|SOURCE|whi_pbs.address|3|9|RFK||{0|}}
{30001002|XXparameter|LOGICAL_FILENAMES|whi_pbs_address_\{source_system\}_\{start_date\}_\{end_date\}_\{timestamp\}.txt|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_BASE|$[ re_replace(SOURCE, '\\\\..*', '')]|3|9|RK||{0|}}
{30001002|XXparameter|SOURCE_TYPE|$[string_replace(SOURCE, SOURCE_BASE + '.', '')]|3|9|K||{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$AI_DML/$SOURCE_BASE/$SOURCE.dml|3|9|RFK||{0|}}
{30001002|XXparameter|CLEAN_DML|$AI_DML/$SOURCE_BASE/$SOURCE.dml|3|2|FK$||{0|}}
{30001002|XXparameter|WORKDIR|$AI_SERIAL_TEMP|3|2|RFK$||{0|}}
{30001002|XXparameter|FLATTEN_XFR|$AI_XFR/get.ftp.write.whi_pbs.xfr|3|9|RFK||{0|}}
{30001002|XXparameter|DROP_HEADER_EXPRESSION|1|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_DML|$[ read_type(CLEAN_DML) ]|3|9|RK|A vector of field level information.|{0|}}
{30001002|XXparameter|NATURAL_KEY|\{src_sys_id;holder_type_cd;holder_id;address_type_cd\}|3|2|RFK$||{0|}}
{30001002|XXparameter|NK_FIELD_NAME_VEC|$[ re_split_no_empty(NATURAL_KEY, "[\{; \}]+") ]|3|9|REK||{0|}}
{30001002|XXparameter|NK_HASH_NK_KEY|\{nk_hash; $[ string_join(NK_FIELD_NAME_VEC, "; ") ]\}|3|9|REK||{0|}}
{30001002|XXparameter|NATURAL_KEY_OBJ|[record
  $[ string_join(
      for ( let k in NK_FIELD_NAME_VEC ) :
        k + "  in." + k,
      ",\\n  ") ]
]|3|9|REK||{0|}}
{30001002|XXparameter|LKP_NATURAL_KEY_OBJ|$[ string_replace(NATURAL_KEY_OBJ, "in.", "lkp.") ]|3|9|REK||{0|}}
{30001002|XXparameter|SOURCE_NK_HASH_DML|$[ add_fields("record\\n  void(16) nk_hash;\\nend",
    for ( let field in record_info(SOURCE_DML) ) :
      field)
]|3|9|RK||{0|}}
{30001002|XXparameter|_parameters_of_Write_Block_Compressed_Lookup|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Index_New_Generation|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Compressed_Lookup_New_Generation|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Compute_NK_Hash|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Replicate|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Partition_by_NK_Hash|@34|9|FHK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_NK_HASH_NK_DML|$[ add_fields("record\\n  void(16) nk_hash;\\nend",
    for ( let field in record_info(SOURCE_DML) ) :
      if ( field.name member NK_FIELD_NAME_VEC )
        field)
]|3|9|RK||{0|}}
{30001002|XXparameter|FILE_LIST_OR_PATTERN_LIST|file_list|15|2|RFK$||{2|file_list|pattern_list|}}
{30001002|XXparameter|PATTERN_LIST_FILTER|vector_sum(for (let pat in re_split($["'" + LOGICAL_FILENAMES + "'"], '(\\r\\n)\|(\\n)')):
             re_index(logical_filename, pat) > 0) > 0|3|9|RK||{0|}}
{30001002|XXparameter|FILE_LIST_FILTER|logical_filename member re_split($["'" + LOGICAL_FILENAMES + "'"], '(\\r\\n)\|(\\n)')|3|9|RK||{0|}}
{30001002|XXparameter|_parameters_of_Dedup_by_NK|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Read_ICFF_for_NK_Dedup_Eff_Date_by_First_Actv_Seq_No|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Trash|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_View_Lookup|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Spec|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_ICFF_Lookup|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Adjust_Inactive_Records|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Sort_within_NK_Hash_by_NK|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Sort_by_NK_Hash_Src_Sys_Id_Seq_No_Updt_Time|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Dedup_Src_Sys_Id_Seq_No_by_Newest_Update|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Consolidate_Source_Data|@34|9|FHK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.0.6.6|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|1234000|564000|0|get.ftp.write.whi_pbs_icff|bbrill|Created 4/30/2012 8:49:06 PM|1|10|0||9||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1234000|564000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.1.1|{2|1|1|}Job 'fixup.whi_pbs_icff' Execution Status Report

|||
|@|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@dev - abi||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Courier New|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Adapt PBS Type 2 Dailies to DIF & Add to ICFF|62641|15048|83000|35000|1057000|56000|6790|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|360|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@The End Script will move the 
Updated Source File to the
Source File, if the graph 
completes successfully.|268000|305000|288000|325000|168000|64000|6795|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{8|736000|499000|756000|499000|839000|499000|860000|499000|}6914|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.47777777910232544|.5|{12|617000|319000|637000|319000|637000|405000|9000|405000|9000|499000|30000|499000|}6859|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{12|994000|334000|1014000|334000|1062000|334000|1062000|409000|1110000|409000|1131000|409000|}6895|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{8|803000|169000|823000|169000|879000|169000|900000|169000|}6908|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{8|180000|499000|200000|499000|265000|499000|286000|499000|}6860|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.4390243887901306|.5|{6|113000|309000|133000|309000|154000|309000|}6922|2065|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{8|1004000|499000|1024000|499000|1110000|499000|1131000|499000|}6916|2065|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{8|402000|169000|402000|169000|429000|169000|436000|169000|}6899|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{8|515000|169000|535000|169000|604000|169000|625000|169000|}6862|20|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5517241358757019|.5|{12|1074000|169000|1094000|169000|1094000|248000|524000|248000|524000|314000|545000|314000|}6909|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.3195020854473114|.5|{8|617000|309000|647000|309000|808000|309000|829000|309000|}6877|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{8|208000|169000|228000|169000|244000|169000|265000|169000|}6924|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.6666666865348816|{8|994000|284000|1024000|284000|1110000|284000|1131000|284000|}6920|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{8|410000|499000|430000|499000|529000|499000|550000|499000|}6913|17|}}
{2010501005|XXGpvertex|23|0|45|0|{2) Only if the surviving record is Inactive:
2a) If there is a preceding Active record that overlaps the Effective Start Date of the Inactive record, it is dropped.
2b) Its Effective End Date is set to its Effective Start Date.  In other words, it only has a 1 day duration, so that it only deletes at most one record in the Type 2 load.
3) Since we are potentially altering source data for Inactive records, when we get an Inactive record we are going to store the original Effective End Date in the front of Create User ID field, pushing the existing data to the right, and truncating to fit.  This will allow us to see the original values in the clean files and the research schema.  This will not be done for Active records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$[ re_replace(NK_HASH_NK_KEY, "\{nk_hash; *", "\{") ]|3|9||@{0|}}
{30001002|XXparameter|transform|$AI_XFR/fixup.whi_pbs_icff.adjust_inactive.xfr|3|2|f$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@851000|447000|871000|448000|123000|106000|6907|Adjust Inactive Records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|24|0|47|0|{@{}@993000|494000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|25|0|50|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|26|0|52|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|27|0|54|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|28|0|56|0|{@{}@861000|494000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|29|0|59|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1331010336|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|30|0|61|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|31|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|67|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|35|0|76|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_PENDING/source.fixed.$SOURCE.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_PENDING/source.fixed.$SOURCE.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@1|@1119938|456393|1142000|476000|56000|50000|6917|Updated Source File|Ab Initio Software||1|10|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|36|0|78|0|{@{}@1132000|494000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|37|0|81|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|38|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|39|0|88|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|key|\{key\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_LOOKUP/icff.$SOURCE.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_LOOKUP/icff.$SOURCE.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1119656|239453|1142000|259000|56000|50000|6921|Compressed Lookup, New Generation|Ab Initio Software||1|10|0||6||33025|-1|-1|}}
{2010202004|XXGiport|40|0|90|0|{@{}@1132000|279000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|41|0|93|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFl||{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|42|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|43|0|98|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.nk_hash :: hash_MD5($NATURAL_KEY_OBJ);
  out.(*, name member [vector "rec_eff_dt", "rec_termination_dt"]) :1: (date("YYYY-MM-DD"))in.*; // Round to Date.
  out.* :2: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$[SOURCE_NK_HASH_DML]|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@255924|125848|276000|127000|116000|87000|6900|Compute NK Hash|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|44|0|100|0|{@{}@391000|164000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|45|0|103|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|46|0|105|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|107|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|48|0|109|0|{@{}@266000|164000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|49|0|112|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|50|0|114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|51|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|52|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|53|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|54|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|55|0|130|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_PENDING|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@281395|270099|291000|279000|51000|41000|6228|Replicate-1|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|56|0|132|0|{@{}@341000|289000|11000|21000|out|0.0|@@@2068|0|}}
{2010210004|XXGflow|57|0|134|0|{@{}@384|.5|.5|{8|352000|294000|382000|294000|454000|294000|475000|294000|}6229|17|}}
{2010210004|XXGflow|58|0|136|0|{@{}@384|.5|.17741934955120087|{12|352000|304000|372000|304000|389000|304000|389000|409000|469000|409000|490000|409000|}6235|19|}}
{2010202004|XXGiport|59|0|138|0|{@{}@281000|294000|11000|11000|in|0.0|@@@1812|0|}}
{2010210004|XXGflow|60|0|140|0|{@{}@384|.5|.5|{12|858000|129000|878000|129000|878000|214000|259000|214000|259000|299000|280000|299000|}6226|17|}}
{2010501005|XXGpvertex|61|0|142|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655971|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|62|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|63|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|64|0|150|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$[string_join(for (let inc in first_defined(record_info(read_type(SOURCE_DML_FILE))[0].includes, [vector])): 'include "' + string_replace(inc, AI_DML, '~$AI_DML') + '";', '\\n')]

filename :: get_filename(in) =
begin
  filename :: in.file_to_read;
end;

type input_type=$[add_fields('record\\nend', for(let f in record_info(read_type(SOURCE_DML_FILE)))f.includes = NULL;: f)];

out :: reformat(read, filename, in) =
begin
  out.ftp_path :: in.ftp_path;
  out.filename :: in.filename;
  out.file_size :: in.file_size;
  out.last_modified :: in.last_modified;
  out.logical_filename :: in.logical_filename;
  out.file_start_date :: in.file_start_date;
  out.file_end_date :: in.file_end_date;
  out.get_start_date :: in.get_start_date;
  out.get_end_date :: in.get_end_date;
  out.file_to_read :: in.file_to_read;
  out.data.* :: read.*;
end;|3|9||@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/get.ftp_file.$SOURCE.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$[add_field(read_type("$AI_DML/get.manifest.dml"), "data", add_fields("record\\nend", record_info(read_type(SOURCE_DML_FILE))))]|3|9||@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
}}@0|@406395|87000|426000|88000|114000|106000|6209|Read Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|152|0|{@{}@539000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|66|0|154|0|{@{}@384|.5|.5|{8|550000|129000|570000|129000|578000|129000|599000|129000|}6217|17|}}
{2010203004|XXGoport|67|0|156|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|68|0|158|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|69|0|160|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|70|0|162|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|71|0|164|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|166|0|{@{}@416000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|73|0|168|0|{@{}@384|.5|.5|{8|336000|129000|356000|129000|394000|129000|415000|129000|}6233|17|}}
{2010501005|XXGpvertex|74|0|170|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact read-blocks False version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact read_as_single_record False version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
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
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation4_analysis|NULL|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|75|0|172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|76|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|77|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|78|0|181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|79|0|184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|80|0|187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|81|0|190|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|82|0|193|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$WORKDIR/manifest.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$WORKDIR/manifest.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$AI_DML/get.manifest.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@18395|86000|40000|106000|56000|50000|6170|Manifest|Ab Initio Software||1|500|0||6||33025|-1|-1|}}
{2010203004|XXGoport|83|0|195|0|{@{}@95000|124000|11000|11000|read|0.0|@@@2160|0|}}
{2010210004|XXGflow|84|0|197|0|{@{}@384|.5|.5|{8|106000|129000|126000|129000|161000|129000|182000|129000|}6232|17|}}
{2010503005|XXGfvertex|85|0|199|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1332536911|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|86|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010501005|XXGpvertex|87|0|207|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$FLATTEN_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|out_metadata|$CLEAN_DML|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@466395|245000|486000|254000|100000|76000|6231|Flatten|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|209|0|{@{}@585000|289000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|89|0|211|0|{@{}@384|.5|.5|{8|596000|294000|616000|294000|659000|294000|680000|294000|}6230|17|}}
{2010203004|XXGoport|90|0|213|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|91|0|215|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|92|0|217|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|93|0|219|0|{@{}@476000|289000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|94|0|222|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|95|0|224|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|96|0|227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|97|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|98|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|99|0|236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|100|0|243|0|{Subgraph created from graph "get.write.whi_pbs_icff"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Replicate_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Filter_by_Expression|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Read_Multiple_Files|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Manifest|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Trash_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_View_Data|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Replicate_2|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Row_Counts_per_file|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Rollup|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Drop_Headers|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Flatten|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Partition_by_Round_robin|@34|9|FHK|@{0|}}
}}@0|@10000|87500|32000|106000|1124000|798000|6925|Consolidate Source Data|bbrill||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.14768683910369873|1124000|797000|3|}}
{2010210004|XXGflow|101|0|248|0|{@{}@384|.5|.5|{12|128000|244000|148000|244000|148000|244000|148000|249000|148000|249000|169000|249000|}6126|2065|}}
{2010210004|XXGflow|102|0|250|0|{@{}@384|.5|.5|{8|671000|129000|691000|129000|706000|129000|727000|129000|}6219|18|}}
{2010210004|XXGflow|103|0|253|0|{@{}@384|.5|.5|{8|611000|409000|631000|409000|663000|409000|684000|409000|}6236|17|}}
{2010501005|XXGpvertex|104|0|258|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$DROP_HEADER_EXPRESSION|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@718395|87000|738000|88000|110000|87000|6221|Drop Headers|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|105|0|260|0|{@{}@847000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|106|0|263|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|107|0|265|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|108|0|267|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|109|0|269|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|110|0|271|0|{@{}@728000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|111|0|274|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
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
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|112|0|276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|113|0|279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|114|0|282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|115|0|285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|116|0|288|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|117|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|118|0|299|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$[if (FILE_LIST_OR_PATTERN_LIST == 'file_list')
    FILE_LIST_FILTER 
  else PATTERN_LIST_FILTER]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@173395|85000|193000|86000|133000|87000|6234|Filter by Expression|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|119|0|301|0|{@{}@325000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|120|0|304|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|121|0|306|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|122|0|308|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|123|0|310|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|124|0|312|0|{@{}@183000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|125|0|315|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
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
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|126|0|317|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|127|0|320|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|128|0|323|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|129|0|326|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|130|0|329|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|131|0|332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|132|0|342|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@599999|98000|610000|107000|51000|41000|6218|Partition by Round-robin|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|133|0|344|0|{@{}@660000|124000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|134|0|347|0|{@{}@600000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|135|0|350|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655975|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|136|0|352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|137|0|355|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|138|0|363|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@681395|264000|691000|273000|51000|41000|6225|Replicate-2|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|139|0|365|0|{@{}@741000|289000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|140|0|367|0|{@{}@681000|289000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|141|0|370|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655971|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|142|0|372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|143|0|375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|144|0|381|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|sorted_input|False|3|9||@{0|}}
{30001002|XXparameter|key|\{file_to_read\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.* :: in.*;
  out.source :: $["'" + SOURCE + "'"];
  out.record_count :: count();
  out.run_date:: now1();
  out.ftp_file_size :: in.file_size;
  out.ftp_file_last_modified :: in.last_modified;
end;|3|9||@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@481395|361000|501000|370000|100000|76000|6237|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|145|0|383|0|{@{}@600000|404000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|146|0|386|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|147|0|388|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|148|0|390|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|149|0|392|0|{@{}@491000|404000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|150|0|395|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|operation1|optional int out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional int out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|int input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|int output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|151|0|397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|152|0|400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|153|0|403|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|154|0|406|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|155|0|409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|156|0|412|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$AI_SERIAL/audit.row_counts.$\{SOURCE\}.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/audit.row_counts.$\{SOURCE\}.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$AI_DML/get.audit.ftp_row_counts.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@673395|363000|695000|383000|56000|50000|6222|Row Counts per file|Ab Initio Software||1|500|0||6||33025|-1|-1|}}
{2010202004|XXGiport|157|0|414|0|{@{}@685000|404000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|158|0|417|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332536923|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|159|0|419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|160|0|426|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@142571|186363|180000|214000|56000|72000|6123|Trash-1|Ab Initio Software|Built-in|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|161|0|428|0|{@{}@170000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|162|0|431|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332537065|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|163|0|433|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|164|0|436|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$[ string_split(read_file(directory_listing(WORKDIR + "/" + directory_listing(WORKDIR, "get_*.*")[0], "manifest.dat")[0]), "\|")[9] ]|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$[ string_split(read_file(directory_listing(WORKDIR + \\"/\\" + directory_listing(WORKDIR, \\"get_*.*\\")[0], \\"manifest.dat\\")[0]), \\"\|\\")[9] ]", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$SOURCE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@40000|198385|62000|218000|56000|50000|6125|View Data|Ab Initio Software||1493500|-1|-1||6||164161|-1|-1|}}
{2010203004|XXGoport|165|0|438|0|{@{}@117000|239000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|166|0|441|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|167|0|443|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010203004|XXGoport|168|0|447|0|{@{}@197000|164000|11000|11000|out0|.5436893203883495|@@@14352|0|}}
{2010501005|XXGpvertex|169|0|451|0|{1) We will deduplicate the records based on Table Name, Natural Key, and Effective Start Date.  The surviving record for each Effective Start Date will be the record with:
1a) The lowest Inactive Flag (prefer "A" over "I")
1b) The lowest (most negative) Sequence Number (prefer newer records over older)|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{nk_hash; src_sys_id; seq_no\}|3|9||@{0|}}
{30001002|XXparameter|keep|last|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@891000|96000|911000|97000|153000|144000|6910|Dedup Src Sys Id,  Seq No by Newest Update|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|170|0|453|0|{@{}@1063000|164000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|171|0|456|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|172|0|458|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|173|0|460|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|174|0|462|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|175|0|464|0|{@{}@901000|164000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|176|0|467|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record utf8 string('') event_type; utf8 string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332701747|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|177|0|469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|178|0|472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|179|0|475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|180|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|181|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|182|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|183|0|492|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$NK_HASH_NK_KEY|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@277000|457000|297000|458000|103000|87000|6856|Dedup by NK|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|184|0|494|0|{@{}@399000|494000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|185|0|497|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|186|0|499|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|187|0|501|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|188|0|503|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|189|0|505|0|{@{}@287000|494000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|190|0|508|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|191|0|510|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|192|0|513|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|193|0|516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|194|0|519|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|195|0|522|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|196|0|525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|197|0|533|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RecordFormat|$[SOURCE_NK_HASH_DML]|3|9||@{0|}}
{30001002|XXparameter|key|\{nk_hash\}|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
}}@0|@733045|375104|755000|395000|56000|50000|6875|ICFF Lookup|Ab Initio Software||1|10|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|198|0|535|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|2|RF$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1314655955|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|199|0|537|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|key|\{key\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_LOOKUP/icff.$SOURCE.index|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_LOOKUP/icff.$SOURCE.index", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@1119656|364060|1142000|384000|56000|50000|6896|Index, New Generation|Ab Initio Software||1|10|0||6||33025|-1|-1|}}
{2010202004|XXGiport|200|0|539|0|{@{}@1132000|404000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|201|0|542|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|202|0|544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|203|0|547|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{nk_hash\}|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@819945|257033|840000|258000|144000|125000|6880|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|204|0|549|0|{@{}@983000|279000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|205|0|552|0|{@{}@983000|329000|11000|11000|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|206|0|555|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|207|0|557|0|{@{}@830000|304000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|208|0|560|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
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
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|209|0|562|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|210|0|565|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|211|0|568|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|212|0|571|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|213|0|577|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{nk_hash\}|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@441477|140817|447000|150000|58000|41000|6835|Partition by NK Hash|Ab Initio Software|Built-in|1|10|0||6||34817|1|{1|0|}}}
{2010203004|XXGoport|214|0|579|0|{@{}@504000|164000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|215|0|582|0|{@{}@437000|164000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|216|0|585|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655975|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|217|0|587|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|218|0|590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|219|0|596|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include $"CLEAN_DML";

let lookup_identifier_type icff_lookup = lookup_not_loaded();
let $\{SOURCE_TYPE\}_t[int] source_vec = [vector];


/* Read the ICFF and determine the "best" record for each Effective Date.  
Return a count of the "best" records. */
out :: length(in) =
begin
  let long source_count = 0;
  let $\{SOURCE_TYPE\}_t lkp = allocate();
  let nk = $NATURAL_KEY_OBJ;

  source_vec = [vector];

  if ( icff_lookup == lookup_not_loaded() )
    icff_lookup = lookup_load(
      this_partition_path($"AI_MFS_LOOKUP" + "/icff." + $"SOURCE" + ".dat.gz"),
      this_partition_path($"AI_MFS_LOOKUP" + "/icff." + $"SOURCE" + ".index"),
      "ICFF Lookup", -2);

  source_count = lookup_count(icff_lookup, "ICFF Lookup", in.nk_hash);

  for ( let long i, i < source_count ) begin
    lkp = lookup_next(icff_lookup, "ICFF Lookup");
    if ( $LKP_NATURAL_KEY_OBJ == nk ) // Make sure the hash-match is an exact-match.
      source_vec = vector_append(source_vec, lkp);
  end

  if ( length_of(source_vec) > 1 ) begin
    // Make sure we only have the latest version of each Sequence Number.
    source_vec = vector_sort(source_vec, \{seq_no; last_upd_timestamp\});  // If we load in the right order, we shouldn't really need this.
    source_vec = vector_sort_dedup_last(source_vec, \{seq_no\});
    // Sort the current records into Eff Date, Active/Inactive, and Sequence Number order.
    source_vec = vector_sort(source_vec, \{rec_eff_dt_comp descending; rec_inactive_flag; seq_no\});
    // Make sure we only have the "best" record for each Eff Date.
    source_vec = vector_sort_dedup_first(source_vec, \{rec_eff_dt_comp descending\});
  end

  out :: length_of(source_vec);
end;


/* Expand "best" ICFF entries into records. */
out :: normalize(in, index) =
begin
  out.* :: source_vec[index].*;
end;|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@1|@541000|438034|561000|439000|165000|125000|6915|Read ICFF for NK, Dedup Eff Date by First Actv, Seq No|Ab Initio Software|Built-in 2.0:|1|10|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|220|0|598|0|{@{}@725000|494000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|221|0|601|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|222|0|603|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|223|0|605|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|224|0|607|0|{@{}@551000|494000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|225|0|610|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|226|0|612|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|227|0|615|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|228|0|618|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|229|0|621|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|230|0|624|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|231|0|631|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@545928|286794|556000|296000|51000|41000|6843|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|232|0|633|0|{@{}@606000|304000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|233|0|637|0|{@{}@546000|309000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|234|0|640|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655971|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|235|0|642|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|236|0|645|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|237|0|651|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|\{nk_hash; src_sys_id; seq_no; last_upd_timestamp\}|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@616292|105833|636000|107000|157000|125000|6863|Sort by NK Hash, Src Sys Id, Seq No, Updt Time|Ab Initio Software|Built-in|1|10|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|238|0|653|0|{@{}@792000|164000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|239|0|656|0|{@{}@626000|164000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|240|0|659|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655975|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|241|0|661|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|242|0|664|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|243|0|670|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|\{nk_hash\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|$NATURAL_KEY|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@21000|438000|41000|439000|129000|125000|6861|Sort within NK Hash by NK|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|244|0|672|0|{@{}@169000|494000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|245|0|675|0|{@{}@31000|494000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|246|0|678|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|247|0|680|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|248|0|683|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|249|0|689|0|{Subgraph created from graph "setup.fixup.whi_pbs_icff"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Reanalyze|@34|9|FHK|@{0|}}
}}@0|@268000|216250|286000|237000|1054000|466000|6876|Spec|bbrill||1|10|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.14037111401557922|1054348|466304|3|}}
{2010240003|XXGlegend|250|0|691|0|{@{}@The ICFF will be used to store the latest status of the source data, based on the source Table Name, Natural Key (or perhaps Natural Key Hash), and Sequence Number.  
It will not contain the modifications mentioned below.

As far as the data that is sent to the mapping goes, it will be altered from the original source in the following ways:
1) We will deduplicate the records based on Table Name, Natural Key, and Effective Start Date.  The surviving record for each Effective Start Date will be the record with:
1a) The lowest Inactive Flag (prefer "A" over "I")
1b) The lowest (most negative) Sequence Number (prefer newer records over older)
2) Only if the surviving record is Inactive:
2a) If there is a preceding Active record that overlaps the Effective Start Date of the Inactive record, it is dropped.
2b) Its Effective End Date is set to its Effective Start Date.  In other words, it only has a 1 day duration, so that it only deletes at most one record in the Type 2 load.
3) Since we are potentially altering source data for Inactive records, when we get an Inactive record we are going to store the original Effective End Date in the front of 
    the Create User ID field, pushing the existing data to the right, and truncating to fit.  This will allow us to see the original values in the clean files and the research 
    schema.  This will not be done for Active records.
4) Daily feeds (but not History loads) will update the ICFF and then replay the entire current state of all the records in that Natural Key, using the same logic as above.

That's it as far as ICFF processing goes.  However, there are also updates to the Type 2 logic:
1) If a record arrives at the Type 2 loader that has a Source Record Inactive Flag of "I", it will be treated like it a request to Logically Delete that NK as of that 
    Effective Start Date and Effective End Date.  Also
2) All Logical Delete requests (both Source Record Inactive Flag == "I" and Drop Record == 1) that have an Effective End Date before the Effective Start Date will have their 
    Effective End Date set to their Effective Start Date.  In other words, Logical Deletes that are "backwards" will be fixed to be 1 day long.  This will allow them to logically 
    delete any existing record with the same Effective Start Date that may already exist.
3) Logical Deletes will have a lower priority in the Loader's Dedup logic than new/updated records.  (This won't affect PBS, but will mirror the "prefer A over I" logic of PBS.)

Finally, for now, we are not doing anything special with records whose Effective End Date is before its Effective Start Date.  In the future, we should consider whether these 
"backwards" records should be treated as Inactive, so that they become logical delete requests.|16000|26000|36000|46000|987000|400000|1962|}}
{2010242002|XXGface|251|0|693|0|{@{}@Arial|0|100|0|}}
{2010600005|XXGgraph|252|0|695|0|{Subgraph created from graph "fixup.whi_pbs_icff"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Get_matching_rows|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Rollup_to_natural_key_vector|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Adjust_dates|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Dedup_Sorted|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Doc|@34|9|FHK|@{0|}}
}}@0|@862071|123498|882000|142000|1148000|510000|1961|Reanalyze|bbrill||1|10|0||6||32833|{0|}0|0|{0|}{0|}{0|}{0|}.1272885799407959|1147000|509000|7|}}
{2010210004|XXGflow|253|0|697|0|{@{}@384|.5|.5|{12|844000|284000|864000|284000|885000|284000|885000|289000|906000|289000|927000|289000|}1704|17|}}
{2010210004|XXGflow|254|0|699|0|{@{}@384|.5|.5|{12|513000|289000|533000|289000|602000|289000|602000|284000|672000|284000|693000|284000|}1708|17|}}
{2010210004|XXGflow|255|0|701|0|{@{}@384|.5|.5|{8|209000|289000|229000|289000|354000|289000|375000|289000|}1707|17|}}
{2010501005|XXGpvertex|256|0|703|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|type mini_t =
record
  int start_date;
  int end_date;
  long seq_no;
  long idx;
end;

let mini_t[int] result_vec = allocate();

out :: length(in) =
begin
  let long i = 0;      // The main look index.
  let long next_idx;   // The index of the next record with a start date "beyond" the current record.
  let int start_date;  // Just a temp.
  let mini_t cur_elem; // The actual record that is being prepared for the result_vec.  Its start and end dates get assigned "critical dates".

  // Arrange the mini vector like the towers of Hanoi, by start date and then "worse" (greater) sequence numbers first.
  let mini_t[int] mini_vec = for ( let long i, i < length_of(in.source_lkup_v) ) :
    [record
      idx        i,
      start_date (date("YYYYMMDD"))in.source_lkup_v[i].rec_eff_dt,
      end_date   (date("YYYYMMDD"))in.source_lkup_v[i].rec_termination_dt,
      seq_no     in.source_lkup_v[i].seq_no,
    ];
  if (length_of(mini_vec)>1) mini_vec = vector_sort(mini_vec, \{start_date ascending; seq_no descending\});

  result_vec = [vector];

  // The outer loop walks forward, finding increasing start dates.
  // The inner loop walks backwards, finding increasing end dates.
  while ( i < length_of(mini_vec) ) begin block main_loop_body
    // Skip any records with the same start date (and hence worse sequence numbers).
    while ( i + 1 < length_of(mini_vec) and mini_vec[i].start_date == mini_vec[i + 1].start_date )
      i = i + 1;

    cur_elem = mini_vec[i]; // The end date is TBD.
    next_idx = i + 1;

    // As long as we have a gap between the current end and the next start, keep walking backwards and adding "tails".
    while ( next_idx >= length_of(mini_vec) or
            cur_elem.end_date + 1 < mini_vec[next_idx].start_date ) begin
      // Add the current record to the results, then keep looking back.
      result_vec = vector_append(result_vec, cur_elem); // The start date is whatever it was, and the end date is the original.
      while ( i > 0 and mini_vec[i - 1].end_date <= cur_elem.end_date )
        i = i - 1;  // Skip over earlier records that don't have a later end date.

      if ( i == 0 ) begin
        // We walked all the way back to the front of the list and didn't find anything.
        // So there's a gap.  Therefore, we jump back "out" to the next greater start date record.
        i = next_idx;
        exit main_loop_body; // Start the next iteration of the main loop.
      end

      // We found a "lesser" record that has a later end date, so use it.
      i = i - 1;
      start_date = cur_elem.end_date + 1;
      cur_elem = mini_vec[i];
      cur_elem.start_date = start_date;
    end
    // We abut or overlap the next record, so we are going on to it.
    if ( next_idx < length_of(mini_vec) )
      cur_elem.end_date = mini_vec[next_idx].start_date - 1;
    result_vec = vector_append(result_vec, cur_elem); // The start date is the original, the end date is one before the next start date (or unchanged if no next).
    i = next_idx;
  end block main_loop_body

  out :: length_of(result_vec);
end;

out :: normalize(in, index) =
begin
  let cur_elem = result_vec[index];

  out.rec_eff_dt :: (date("YYYYMMDD")) cur_elem.start_date;
  out.rec_termination_dt :: (date("YYYYMMDD")) cur_elem.end_date;
  out.* :: in.source_lkup_v[cur_elem.idx].*;
end;|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@1|@918000|247000|938000|248000|102000|87000|1705|Adjust dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|257|0|705|0|{@{}@1039000|284000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|258|0|707|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|259|0|709|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|260|0|711|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|261|0|713|0|{@{}@928000|284000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|262|0|716|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|263|0|718|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|264|0|721|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|265|0|724|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|266|0|727|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|267|0|730|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|268|0|733|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$NK_HASH_NK_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.source_lkup_v :: accumulation(in);
end;|3|9||@{0|}}
{30001002|XXparameter|out_metadata|include $"SOURCE_DML_FILE";

metadata type=record
$\{SOURCE_NAME\}_t[int] source_lkup_v;
end;|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@1|@684000|228000|704000|229000|130000|106000|1696|Rollup to natural key vector|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|269|0|735|0|{@{}@833000|279000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|270|0|738|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|271|0|740|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|272|0|742|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|273|0|744|0|{@{}@694000|279000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|274|0|747|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|operation1|optional int out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional int out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|int input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|int output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|275|0|749|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|276|0|752|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|277|0|755|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|278|0|758|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|279|0|761|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|280|0|764|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include $"SOURCE_DML_FILE";

let lookup_identifier_type icff_lookup = lookup_not_loaded();
let $\{SOURCE_NAME\}_t[int] source_lkup_v = [vector];


/*Number of records to output.  Either this function or finished() must be defined.*/
out::length(in)=
begin
  let $\{SOURCE_NAME\}_t test_lkup_processed_elt = allocate();
  let long k = 0;
  let long source_count = 0;
  let $\{SOURCE_NAME\}_t temp_elt = allocate();

  source_lkup_v = [vector];

  if ( icff_lookup == lookup_not_loaded() )
    icff_lookup = lookup_load(
      this_partition_path($"AI_MFS_LOOKUP" + "/icff." + $"SOURCE_SYSTEM" + "." + $"SOURCE_NAME" + ".dat"),
      this_partition_path($"AI_MFS_LOOKUP" + "/icff." + $"SOURCE_SYSTEM" + "." + $"SOURCE_NAME" + ".index"),
      "ICFF Lookup", -2);

  source_count = lookup_count(icff_lookup, "ICFF Lookup", in.nk_hash);

  for ( k, k < source_count ) begin
    temp_elt = lookup_next(icff_lookup, "ICFF Lookup");
    if ( $TEMP_ELT_NATURAL_KEY_OBJ == $NATURAL_KEY_OBJ ) // Make sure the hash-match is an exact-match.
      source_lkup_v = vector_append(source_lkup_v, temp_elt);
  end

  test_lkup_processed_elt = in;
  if ( in.rec_inactive_flag == "A" )
    source_lkup_v = vector_append(source_lkup_v, test_lkup_processed_elt);
  if ( in.rec_inactive_flag == "I" ) begin
    source_lkup_v = vector_difference(source_lkup_v, [vector test_lkup_processed_elt], \{seq_no\});
    test_lkup_processed_elt.rec_inactive_flag = "I";
    test_lkup_processed_elt.seq_no = test_lkup_processed_elt.seq_no + 9999999999;    
    source_lkup_v = vector_append(source_lkup_v, test_lkup_processed_elt);
  end

  out :: length_of(source_lkup_v);
end;


/* Expand ICFF elements into records, and add NK Hash. */
out :: normalize(in, index) =
begin
  out.* :: source_lkup_v[index].*;
  out.nk_hash :: in.nk_hash;
end;|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$[SOURCE_NK_HASH_DML]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
}}@1|@366000|237034|386000|238000|117000|106000|1709|Get matching rows|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|281|0|766|0|{@{}@502000|284000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|282|0|769|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|283|0|771|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|284|0|773|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|285|0|775|0|{@{}@376000|284000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|286|0|778|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|287|0|780|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|288|0|783|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|289|0|786|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|290|0|789|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|291|0|792|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|292|0|797|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$NK_HASH_NK_KEY|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@0|@74000|247000|94000|248000|105000|87000|1706|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|293|0|799|0|{@{}@198000|284000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|294|0|802|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|295|0|804|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|296|0|806|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|297|0|808|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|298|0|810|0|{@{}@84000|284000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|299|0|812|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|300|0|814|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|301|0|817|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|302|0|820|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|303|0|823|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|304|0|826|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|305|0|829|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|306|0|832|0|{Subgraph created from graph "fixup.whi_pbs_icff"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Test_Case_One_Inactive_with_higher_sequence_numbers_that_are_revealed|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Case_Two_Actives|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Test_Case_Two_Inactive_with_overlapping_higher_sequence_numbers_that_are_revealed|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Case_Three|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Test_Case_Six_Higher_sequence_number_with_an_overlap_on_two_ends|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Test_Case_Four_Higher_sequence_number_with_an_overlap_one_one_end|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Test_Case_Five_Higher_sequence_number_with_no_overlap|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Test_Case_Three_Lower_sequence_number_with_overlap_on_higher_numbers|@34|9|FHK|@{0|}}
}}@0|@86765|45415|109000|67000|1098000|544000|1710|Doc|bbrill||1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.12019865214824677|1098182|543636|7|}}
{2010600005|XXGgraph|307|0|834|0|{Subgraph created from graph "Doc"|{}@0|@704401|140550|724000|162000|1658000|334000|1205|Case Three|bbrill||1|10|0||6||32833|{0|}0|0|{0|}{0|}{0|}{0|}.19432710111141205|1657000|334000|7|}}
{2010240003|XXGlegend|308|0|836|0|{@{}@If a new active record comes through

Key1           0             20110101        20110430            A

This graph will rebuild the delta file to contain all of the actives 
and a more accurate set of new actives


Key1            0             20110101        20110131            A
Key1            0             20110228        20110430            A
Key1           -1             20110201        20110228            A
Key1           -2             20110501        20110531            A
Key1           -3             20110101        20111031            A
|40000|30104|60000|50000|552000|224000|1147|}}
{2010242002|XXGface|309|0|838|0|{@{}@Courier New|0|100|0|}}
{2010240003|XXGlegend|310|0|840|0|{@{}@Sequence Number  Active
           -1                  A               \|-----------\|                                       
           -2                  A                       \|-----------\|
           -3                  A      \|---------------------------------------------------------------\|

Adding a more positive new sequence number 

            0                  A      \|--------------------------------------\|

should return

            0                  A      (None. -3 overrides this.)
           -1                  A               \|-------\|
           -2                  A                       \|-----------\|
           -3                  A      \|--------\|                   \|----------------------------------\|
|712614|30000|733000|50000|824000|256000|1148|}}
{2010242002|XXGface|311|0|842|0|{@{}@Courier New|0|100|0|}}
{2010600005|XXGgraph|312|0|844|0|{Subgraph created from graph "Doc"|{}@0|@702794|48779|723000|71000|1670000|388000|1209|Case Two - Actives|bbrill|Created 1/12/2012 3:54:54 PM|1|10|0||6||32833|{0|}0|0|{0|}{0|}{0|}{0|}.17615339159965515|1669000|388235|3|}}
{2010240003|XXGlegend|313|0|846|0|{@{}@Sequence Number              Active
           -1                  A               \|-----------\|                                                        
           -2                  A                                            \|-----------\|
           -3                  A      \|---------------------------------------------------------------\| 

Adding a more positive new sequence number 

            0                  A      \|-------------------------------------\|

should return

            0                  A      (None. -3 overrides this.)
           -1                  A               \|-----------\|                                                        
           -2                  A                                            \|-----------\|
           -3                  A      \|--------\|           \|----------------\|           \|-------------\| 


|724853|52691|745000|73000|928000|288000|1150|}}
{2010242002|XXGface|314|0|848|0|{@{}@Courier New|0|100|0|}}
{2010240003|XXGlegend|315|0|850|0|{@{}@If a new active record comes through

Key1           0             20110101        20110430            A

This graph will rebuild the delta file to contain all of the actives 
and a more accurate set of new actives

Key1            0             20110228        20110430            A
Key1           -1             20110201        20110228            A
Key1           -2             20110501        20110531            A
Key1           -3             20110101        20111031            A
|40000|30000|60000|50000|552000|192000|1151|}}
{2010242002|XXGface|316|0|852|0|{@{}@Courier New|0|100|0|}}
{2010600005|XXGgraph|317|0|854|0|{Subgraph created from graph "Doc"|{}@0|@49400|376460|67000|397000|1058000|408000|1200|Test Case Five - Higher sequence number with no overlap|bbrill|Created 1/13/2012 11:08:38 AM|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.260869562625885|1058000|407353|3|}}
{2010240003|XXGlegend|318|0|856|0|{@{}@Sequence Number  Active

           -1                  A               \|-----------\|                                                        
           -2                  A                       \|-----------\|
           -3                  A      \|---------------------------------------------------------------\| 

Adding a more positive new sequence number 

            0                  A      \|--------------------------------------\|

should return

           -3                  A      \|---------------------------------------------------------------\| 
|74458|70218|94000|90000|928000|224000|1148|}}
{2010242002|XXGface|319|0|858|0|{@{}@Courier New|0|100|0|}}
{2010600005|XXGgraph|320|0|860|0|{Subgraph created from graph "Doc"|{}@0|@448946|230550|467000|252000|1058000|408000|1199|Test Case Four - Higher sequence number with an overlap one one end|bbrill|Created 1/13/2012 11:08:38 AM|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.260869562625885|1058000|407353|3|}}
{2010240003|XXGlegend|321|0|862|0|{@{}@Sequence Number  Active

           -1                  A                    \|-----------\|                                                        
           -2                  A                            \|-----------\|
           -3                  A           \|---------------------------------------------------------------\| 

Adding a more positive new sequence number 

            0                  A      \|--------------------------------------\|


should return

            0                  A      \|----\|
           -3                  A           \|---------------------------------------------------------------\| 
|74458|70218|94000|90000|968000|256000|1148|}}
{2010242002|XXGface|322|0|864|0|{@{}@Courier New|0|100|0|}}
{2010600005|XXGgraph|323|0|866|0|{Subgraph created from graph "Doc"|{}@0|@49506|48530|68000|67000|1698000|740000|1207|Test Case One - Inactive with higher sequence numbers that are revealed|bbrill|Created 1/12/2012 3:55:06 PM|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.14378315210342407|1697000|739394|3|}}
{2010240003|XXGlegend|324|0|868|0|{@{}@Sequence Number  Active
           -1                  A               \|-----------\|                                                        
           -2                  A                                            \|-----------\|
           -3                  A     \|---------------------------------------------------------------\| 
           -4                  A                                                                                   \|-------------------------------------------\|

Deactivating -3 needs to return

           -1                  A               \|-----------\|                                                        
           -2                  A                                            \|-----------\|
           -3                  I       \|-------\|           \|----------------\|           \|--------------\| 
           -4                  A                                                                                   \|-------------------------------------------\|
|14943|448760|35000|469000|1280000|208000|1143|}}
{2010242002|XXGface|325|0|870|0|{@{}@Courier New|0|100|0|}}
{2010240003|XXGlegend|326|0|872|0|{@{}@

If a lookup contains the following active records

Key Sequence Number Effective Date Termination Date  Status

Key1           -1             2011-02-01        2011-02-28            A
Key1           -2             2011-05-01        2011-05-31            A
Key1           -3             2011-01-01        2011-10-31            A

and a daily delta file comes through which makes sequence number -3 inactive

Key1           -3             2011-01-01        2011-10-31            I

This graph will rebuild the delta file to contain all of the actives 
and a more accurate set of inactives

Key1           -3             2011-01-01        2011-01-31            I
Key1           -1             2011-02-01        2011-02-28            A
Key1           -3             2011-03-01        2011-04-30            I
Key1           -2             2011-05-01        2011-05-31            A
Key1           -3             2011-06-01        2011-10-31            I
|40000|30000|60000|50000|608000|368000|1144|}}
{2010242002|XXGface|327|0|874|0|{@{}@Courier New|0|100|0|}}
{2010600005|XXGgraph|328|0|876|0|{Subgraph created from graph "Doc"|{}@0|@393946|375551|413000|397000|1370000|448000|1201|Test Case Six - Higher sequence number with an overlap on two ends|bbrill|Created 1/13/2012 11:08:38 AM|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.23649634420871735|1370000|448529|3|}}
{2010240003|XXGlegend|329|0|878|0|{@{}@Sequence Number  Active

           -1                  A                    \|-----------\|                                                        
           -2                  A                            \|-----------\|
           -3                  A           \|---------------------------------------------------------------\| 
           -4                  A                                                                                   \|-------------------------------------------\|

Adding a more positive new sequence number 

            0                  A      \|-------------------------------------------------------------------------\|


should return

            0                  A      \|----\|                                                               \|----\|
           -3                  A           \|---------------------------------------------------------------\| 
           -4                  A                                                                                   \|-------------------------------------------\|
|74458|70218|94000|90000|1280000|288000|1148|}}
{2010242002|XXGface|330|0|880|0|{@{}@Courier New|0|100|0|}}
{2010600005|XXGgraph|331|0|882|0|{Subgraph created from graph "Doc"|{}@0|@49854|231461|71000|252000|1414000|444000|1198|Test Case Three - Lower sequence number with overlap on higher numbers|bbrill|Created 1/13/2012 11:08:38 AM|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.23920735716819763|1413000|444000|3|}}
{2010240003|XXGlegend|332|0|884|0|{@{}@Sequence Number  Active

           -1                  A               \|-----------\|                                                        
           -2                  A                       \|-----------\|
           -3                  A      \|---------------------------------------------------------------\| 
           -4                  A                                                                                   \|-------------------------------------------\|

Adding a more negative new sequence number 

           -5                  A          \|--------------------------------------\|

should return

           -3                  A      \|---\|                                      \|---------------------\| 
           -4                  A                                                                                   \|-------------------------------------------\|
           -5                  A          \|--------------------------------------\|
|74458|80218|94000|100000|1280000|272000|1148|}}
{2010242002|XXGface|333|0|886|0|{@{}@Courier New|0|100|0|}}
{2010600005|XXGgraph|334|0|888|0|{Subgraph created from graph "Doc"|{}@0|@358493|48978|377000|67000|1672000|734000|1208|Test Case Two - Inactive with overlapping higher sequence numbers that are revealed|bbrill|Created 1/13/2012 11:15:47 AM|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.17105263471603394|1672000|734328|3|}}
{2010240003|XXGlegend|335|0|890|0|{@{}@Sequence Number  Active
           -1                  A               \|-----------\|
           -2                  A                       \|-----------\|
           -3                  A     \|---------------------------------------------------------------\|
           -4                  A                                                                                   \|-------------------------------------------\|

Deactivating -3 needs to return

           -1                  A               \|-------\|
           -2                  A                       \|-----------\|
           -3                  I     \|---------\|                   \|---------------------------------\|
           -4                  A                                                                                   \|-------------------------------------------\|
|14720|448029|35000|468000|1280000|208000|1155|}}
{2010242002|XXGface|336|0|892|0|{@{}@Courier New|0|100|0|}}
{2010240003|XXGlegend|337|0|894|0|{@{}@

If a lookup contains the following active records

Key Sequence Number Effective Date Termination Date  Status

Key1           -1             2011-02-01        2011-04-30            A
Key1           -2             2011-04-01        2011-05-31            A
Key1           -3             2011-01-01        2011-10-31            A

and a daily delta file comes through which makes sequence number -3 inactive

Key1           -3             2011-01-01        2011-10-31            I

This graph will rebuild the delta file to contain all of the actives 
and a more accurate set of inactives

Key1           -3             2011-01-01        2011-01-31            I
Key1           -1             2011-02-01        2011-03-31            A
Key1           -2             2011-04-01        2011-05-31            A
Key1           -3             2011-06-01        2011-10-31            I
|40000|30000|60000|50000|608000|352000|1156|}}
{2010242002|XXGface|338|0|896|0|{@{}@Courier New|0|100|0|}}
{2010203004|XXGoport|339|0|900|0|{@{}@1027000|169000|11000|11000|out1|.5127701375245579|@@@14736|0|}}
{2010202004|XXGiport|340|0|903|0|{@{}@872000|169000|11000|11000|in1|.5108055009823183|@@@14224|0|}}
{2010501005|XXGpvertex|341|0|906|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@128000|244000|165000|272000|56000|72000|6901|Trash|Ab Initio Software|Built-in|1|10|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|342|0|908|0|{@{}@155000|304000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|343|0|911|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332701740|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|344|0|913|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|345|0|916|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|key|\{key\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_LOOKUP/icff.$SOURCE.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_LOOKUP/icff.$SOURCE.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$[SOURCE_NK_HASH_DML]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@24871|262321|47000|282000|56000|50000|6923|View Lookup|Ab Initio Software||1|10|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|346|0|918|0|{@{}@102000|304000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|347|0|921|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFl||{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|348|0|923|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010110002|XXGconstant|349|0|929|0|{@{}@{1|9478870|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_10|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_11|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_12|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_13|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_15|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_2|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_3|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_4|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_5|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_6|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_7|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_8|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_9|}1|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{Adjust_Inactive_Records|}1|23|}
{2010212001|XXGvertex_oport_oport|23|0|46|0|{0|out|}23|24|}
{2010213001|XXGoport_dst_flow|24|0|48|0|{0|}24|15|}
{2010212001|XXGvertex_oport_oport|25|0|49|0|{1|reject|}23|25|}
{2010212001|XXGvertex_oport_oport|26|0|51|0|{2|error|}23|26|}
{2010212001|XXGvertex_oport_oport|27|0|53|0|{3|log|}23|27|}
{2010211001|XXGvertex_iport_iport|28|0|55|0|{0|in|}23|28|}
{2010214001|XXGiport_src_flow|29|0|57|0|{0|}28|9|}
{2010007001|XXGobject_proto_object|30|0|58|0|{}23|29|}
{2010212001|XXGvertex_oport_oport|31|0|60|0|{0|out|}29|30|}
{2010006001|XXGobject_psameas_object|32|0|62|0|{metadata|out_metadata|1|0|}30|29|}
{2010212001|XXGvertex_oport_oport|33|0|63|0|{1|reject|}29|31|}
{2010006001|XXGobject_psameas_object|34|0|65|0|{metadata|reject_metadata|1|0|}31|29|}
{2010212001|XXGvertex_oport_oport|35|0|66|0|{2|error|}29|32|}
{2010006001|XXGobject_psameas_object|36|0|68|0|{metadata|error_metadata|1|0|}32|29|}
{2010212001|XXGvertex_oport_oport|37|0|69|0|{3|log|}29|33|}
{2010006001|XXGobject_psameas_object|38|0|71|0|{metadata|log_metadata|1|0|}33|29|}
{2010211001|XXGvertex_iport_iport|39|0|72|0|{0|in|}29|34|}
{2010006001|XXGobject_psameas_object|40|0|74|0|{metadata|in_metadata|1|0|}34|29|}
{2010006001|XXGobject_psameas_object|41|0|75|0|{Layout|Layout|0|0|}23|35|}
{2010211001|XXGvertex_iport_iport|42|0|77|0|{0|write|}35|36|}
{2010214001|XXGiport_src_flow|43|0|79|0|{0|}36|15|}
{2010007001|XXGobject_proto_object|44|0|80|0|{}35|37|}
{2010211001|XXGvertex_iport_iport|45|0|82|0|{0|write|}37|38|}
{2010006001|XXGobject_psameas_object|46|0|84|0|{metadata|write_metadata|1|0|}38|37|}
{2010006001|XXGobject_psameas_object|47|0|85|0|{in_metadata|write_metadata|0|0|}23|35|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{out_metadata|write_metadata|0|0|}23|35|}
{2010601001|XXGgraph_vertex_vertex|49|0|87|0|{Compressed_Lookup_New_Generation|}1|39|}
{2010211001|XXGvertex_iport_iport|50|0|89|0|{0|write|}39|40|}
{2010214001|XXGiport_src_flow|51|0|91|0|{0|}40|21|}
{2010007001|XXGobject_proto_object|52|0|92|0|{}39|41|}
{2010211001|XXGvertex_iport_iport|53|0|94|0|{0|write|}41|42|}
{2010006001|XXGobject_psameas_object|54|0|96|0|{metadata|write_metadata|1|0|}42|41|}
{2010601001|XXGgraph_vertex_vertex|55|0|97|0|{Compute_NK_Hash|}1|43|}
{2010212001|XXGvertex_oport_oport|56|0|99|0|{0|out0|}43|44|}
{2010213001|XXGoport_dst_flow|57|0|101|0|{0|}44|16|}
{2010212001|XXGvertex_oport_oport|58|0|102|0|{1|reject0|}43|45|}
{2010212001|XXGvertex_oport_oport|59|0|104|0|{2|error0|}43|46|}
{2010212001|XXGvertex_oport_oport|60|0|106|0|{3|log|}43|47|}
{2010211001|XXGvertex_iport_iport|61|0|108|0|{0|in|}43|48|}
{2010214001|XXGiport_src_flow|62|0|110|0|{0|}48|20|}
{2010007001|XXGobject_proto_object|63|0|111|0|{}43|49|}
{2010212001|XXGvertex_oport_oport|64|0|113|0|{0|out0|}49|50|}
{2010006001|XXGobject_psameas_object|65|0|115|0|{metadata|out0_metadata|1|0|}50|49|}
{2010006001|XXGobject_psameas_object|66|0|116|0|{transform0|transform0|1|0|}50|49|}
{2010212001|XXGvertex_oport_oport|67|0|117|0|{1|reject0|}49|51|}
{2010006001|XXGobject_psameas_object|68|0|119|0|{metadata|reject0_metadata|1|0|}51|49|}
{2010212001|XXGvertex_oport_oport|69|0|120|0|{2|error0|}49|52|}
{2010006001|XXGobject_psameas_object|70|0|122|0|{metadata|error0_metadata|1|0|}52|49|}
{2010212001|XXGvertex_oport_oport|71|0|123|0|{3|log|}49|53|}
{2010006001|XXGobject_psameas_object|72|0|125|0|{metadata|log_metadata|1|0|}53|49|}
{2010211001|XXGvertex_iport_iport|73|0|126|0|{0|in|}49|54|}
{2010006001|XXGobject_psameas_object|74|0|128|0|{metadata|in_metadata|1|0|}54|49|}
{2010006001|XXGobject_psameas_object|75|0|129|0|{Layout|Layout|0|0|}43|55|}
{2010212001|XXGvertex_oport_oport|76|0|131|0|{0|out|}55|56|}
{2010213001|XXGoport_dst_flow|77|0|133|0|{0|}56|57|}
{2010213001|XXGoport_dst_flow|78|0|135|0|{1|}56|58|}
{2010211001|XXGvertex_iport_iport|79|0|137|0|{0|in|}55|59|}
{2010214001|XXGiport_src_flow|80|0|139|0|{0|}59|60|}
{2010007001|XXGobject_proto_object|81|0|141|0|{}55|61|}
{2010212001|XXGvertex_oport_oport|82|0|143|0|{0|out|}61|62|}
{2010006001|XXGobject_psameas_object|83|0|145|0|{metadata|out_metadata|1|0|}62|61|}
{2010211001|XXGvertex_iport_iport|84|0|146|0|{0|in|}61|63|}
{2010006001|XXGobject_psameas_object|85|0|148|0|{metadata|in_metadata|1|0|}63|61|}
{2010006001|XXGobject_psameas_object|86|0|149|0|{in_metadata|out_metadata|0|0|}55|64|}
{2010212001|XXGvertex_oport_oport|87|0|151|0|{0|out|}64|65|}
{2010213001|XXGoport_dst_flow|88|0|153|0|{0|}65|66|}
{2010212001|XXGvertex_oport_oport|89|0|155|0|{1|filereject|}64|67|}
{2010212001|XXGvertex_oport_oport|90|0|157|0|{2|fileerror|}64|68|}
{2010212001|XXGvertex_oport_oport|91|0|159|0|{3|reject|}64|69|}
{2010212001|XXGvertex_oport_oport|92|0|161|0|{4|error|}64|70|}
{2010212001|XXGvertex_oport_oport|93|0|163|0|{5|log|}64|71|}
{2010211001|XXGvertex_iport_iport|94|0|165|0|{0|in|}64|72|}
{2010214001|XXGiport_src_flow|95|0|167|0|{0|}72|73|}
{2010007001|XXGobject_proto_object|96|0|169|0|{}64|74|}
{2010212001|XXGvertex_oport_oport|97|0|171|0|{0|out|}74|75|}
{2010006001|XXGobject_psameas_object|98|0|173|0|{metadata|out_metadata|1|0|}75|74|}
{2010212001|XXGvertex_oport_oport|99|0|174|0|{1|filereject|}74|76|}
{2010006001|XXGobject_psameas_object|100|0|176|0|{metadata|filereject_metadata|1|0|}76|74|}
{2010212001|XXGvertex_oport_oport|101|0|177|0|{2|fileerror|}74|77|}
{2010006001|XXGobject_psameas_object|102|0|179|0|{metadata|fileerror_metadata|1|0|}77|74|}
{2010212001|XXGvertex_oport_oport|103|0|180|0|{3|reject|}74|78|}
{2010006001|XXGobject_psameas_object|104|0|182|0|{metadata|reject_metadata|1|0|}78|74|}
{2010212001|XXGvertex_oport_oport|105|0|183|0|{4|error|}74|79|}
{2010006001|XXGobject_psameas_object|106|0|185|0|{metadata|error_metadata|1|0|}79|74|}
{2010212001|XXGvertex_oport_oport|107|0|186|0|{5|log|}74|80|}
{2010006001|XXGobject_psameas_object|108|0|188|0|{metadata|log_metadata|1|0|}80|74|}
{2010211001|XXGvertex_iport_iport|109|0|189|0|{0|in|}74|81|}
{2010006001|XXGobject_psameas_object|110|0|191|0|{metadata|in_metadata|1|0|}81|74|}
{2010006001|XXGobject_psameas_object|111|0|192|0|{Layout|Layout|0|0|}64|82|}
{2010212001|XXGvertex_oport_oport|112|0|194|0|{0|read|}82|83|}
{2010213001|XXGoport_dst_flow|113|0|196|0|{0|}83|84|}
{2010007001|XXGobject_proto_object|114|0|198|0|{}82|85|}
{2010212001|XXGvertex_oport_oport|115|0|200|0|{0|read|}85|86|}
{2010006001|XXGobject_psameas_object|116|0|202|0|{metadata|read_metadata|1|0|}86|85|}
{2010006001|XXGobject_psameas_object|117|0|203|0|{filereject_metadata|read_metadata|0|0|}64|82|}
{2010006001|XXGobject_psameas_object|118|0|204|0|{in_metadata|read_metadata|0|0|}64|82|}
{2010006001|XXGobject_psameas_object|119|0|205|0|{out_metadata|out_metadata|0|0|}55|64|}
{2010006001|XXGobject_psameas_object|120|0|206|0|{in_metadata|out_metadata|0|0|}43|87|}
{2010212001|XXGvertex_oport_oport|121|0|208|0|{0|out|}87|88|}
{2010213001|XXGoport_dst_flow|122|0|210|0|{0|}88|89|}
{2010212001|XXGvertex_oport_oport|123|0|212|0|{1|reject|}87|90|}
{2010212001|XXGvertex_oport_oport|124|0|214|0|{2|error|}87|91|}
{2010212001|XXGvertex_oport_oport|125|0|216|0|{3|log|}87|92|}
{2010211001|XXGvertex_iport_iport|126|0|218|0|{0|in|}87|93|}
{2010214001|XXGiport_src_flow|127|0|220|0|{0|}93|57|}
{2010007001|XXGobject_proto_object|128|0|221|0|{}87|94|}
{2010212001|XXGvertex_oport_oport|129|0|223|0|{0|out|}94|95|}
{2010006001|XXGobject_psameas_object|130|0|225|0|{metadata|out_metadata|1|0|}95|94|}
{2010212001|XXGvertex_oport_oport|131|0|226|0|{1|reject|}94|96|}
{2010006001|XXGobject_psameas_object|132|0|228|0|{metadata|reject_metadata|1|0|}96|94|}
{2010212001|XXGvertex_oport_oport|133|0|229|0|{2|error|}94|97|}
{2010006001|XXGobject_psameas_object|134|0|231|0|{metadata|error_metadata|1|0|}97|94|}
{2010212001|XXGvertex_oport_oport|135|0|232|0|{3|log|}94|98|}
{2010006001|XXGobject_psameas_object|136|0|234|0|{metadata|log_metadata|1|0|}98|94|}
{2010211001|XXGvertex_iport_iport|137|0|235|0|{0|in|}94|99|}
{2010006001|XXGobject_psameas_object|138|0|237|0|{metadata|in_metadata|1|0|}99|94|}
{2010006001|XXGobject_psameas_object|139|0|238|0|{Layout|Layout|0|0|}87|55|}
{2010006001|XXGobject_psameas_object|140|0|239|0|{in_metadata|out_metadata|0|0|}87|64|}
{2010006001|XXGobject_psameas_object|141|0|240|0|{reject_metadata|out_metadata|0|0|}87|64|}
{2010006001|XXGobject_psameas_object|142|0|241|0|{reject0_metadata|out_metadata|0|0|}43|87|}
{2010601001|XXGgraph_vertex_vertex|143|0|242|0|{Consolidate_Source_Data|}1|100|}
{2010604001|XXGgraph_flow_flow|144|0|244|0|{Flow_1|}100|66|}
{2010604001|XXGgraph_flow_flow|145|0|245|0|{Flow_14|}100|73|}
{2010604001|XXGgraph_flow_flow|146|0|246|0|{Flow_17|}100|84|}
{2010604001|XXGgraph_flow_flow|147|0|247|0|{Flow_18|}100|101|}
{2010604001|XXGgraph_flow_flow|148|0|249|0|{Flow_2|}100|102|}
{2010604001|XXGgraph_flow_flow|149|0|251|0|{Flow_20|}100|58|}
{2010604001|XXGgraph_flow_flow|150|0|252|0|{Flow_21|}100|103|}
{2010604001|XXGgraph_flow_flow|151|0|254|0|{Flow_3|}100|89|}
{2010604001|XXGgraph_flow_flow|152|0|255|0|{Flow_4|}100|57|}
{2010604001|XXGgraph_flow_flow|153|0|256|0|{Flow_5|}100|60|}
{2010601001|XXGgraph_vertex_vertex|154|0|257|0|{Drop_Headers|}100|104|}
{2010212001|XXGvertex_oport_oport|155|0|259|0|{0|out|}104|105|}
{2010213001|XXGoport_dst_flow|156|0|261|0|{0|}105|60|}
{2010212001|XXGvertex_oport_oport|157|0|262|0|{1|deselect|}104|106|}
{2010212001|XXGvertex_oport_oport|158|0|264|0|{2|reject|}104|107|}
{2010212001|XXGvertex_oport_oport|159|0|266|0|{3|error|}104|108|}
{2010212001|XXGvertex_oport_oport|160|0|268|0|{4|log|}104|109|}
{2010211001|XXGvertex_iport_iport|161|0|270|0|{0|in|}104|110|}
{2010214001|XXGiport_src_flow|162|0|272|0|{0|}110|102|}
{2010007001|XXGobject_proto_object|163|0|273|0|{}104|111|}
{2010212001|XXGvertex_oport_oport|164|0|275|0|{0|out|}111|112|}
{2010006001|XXGobject_psameas_object|165|0|277|0|{metadata|out_metadata|1|0|}112|111|}
{2010212001|XXGvertex_oport_oport|166|0|278|0|{1|deselect|}111|113|}
{2010006001|XXGobject_psameas_object|167|0|280|0|{metadata|deselect_metadata|1|0|}113|111|}
{2010212001|XXGvertex_oport_oport|168|0|281|0|{2|reject|}111|114|}
{2010006001|XXGobject_psameas_object|169|0|283|0|{metadata|reject_metadata|1|0|}114|111|}
{2010212001|XXGvertex_oport_oport|170|0|284|0|{3|error|}111|115|}
{2010006001|XXGobject_psameas_object|171|0|286|0|{metadata|error_metadata|1|0|}115|111|}
{2010212001|XXGvertex_oport_oport|172|0|287|0|{4|log|}111|116|}
{2010006001|XXGobject_psameas_object|173|0|289|0|{metadata|log_metadata|1|0|}116|111|}
{2010211001|XXGvertex_iport_iport|174|0|290|0|{0|in|}111|117|}
{2010006001|XXGobject_psameas_object|175|0|292|0|{metadata|in_metadata|1|0|}117|111|}
{2010006001|XXGobject_psameas_object|176|0|293|0|{Layout|Layout|0|0|}104|55|}
{2010006001|XXGobject_psameas_object|177|0|294|0|{deselect_metadata|out_metadata|0|0|}104|64|}
{2010006001|XXGobject_psameas_object|178|0|295|0|{in_metadata|out_metadata|0|0|}104|64|}
{2010006001|XXGobject_psameas_object|179|0|296|0|{out_metadata|out_metadata|0|0|}104|64|}
{2010006001|XXGobject_psameas_object|180|0|297|0|{reject_metadata|out_metadata|0|0|}104|64|}
{2010601001|XXGgraph_vertex_vertex|181|0|298|0|{Filter_by_Expression|}100|118|}
{2010212001|XXGvertex_oport_oport|182|0|300|0|{0|out|}118|119|}
{2010213001|XXGoport_dst_flow|183|0|302|0|{0|}119|73|}
{2010212001|XXGvertex_oport_oport|184|0|303|0|{1|deselect|}118|120|}
{2010212001|XXGvertex_oport_oport|185|0|305|0|{2|reject|}118|121|}
{2010212001|XXGvertex_oport_oport|186|0|307|0|{3|error|}118|122|}
{2010212001|XXGvertex_oport_oport|187|0|309|0|{4|log|}118|123|}
{2010211001|XXGvertex_iport_iport|188|0|311|0|{0|in|}118|124|}
{2010214001|XXGiport_src_flow|189|0|313|0|{0|}124|84|}
{2010007001|XXGobject_proto_object|190|0|314|0|{}118|125|}
{2010212001|XXGvertex_oport_oport|191|0|316|0|{0|out|}125|126|}
{2010006001|XXGobject_psameas_object|192|0|318|0|{metadata|out_metadata|1|0|}126|125|}
{2010212001|XXGvertex_oport_oport|193|0|319|0|{1|deselect|}125|127|}
{2010006001|XXGobject_psameas_object|194|0|321|0|{metadata|deselect_metadata|1|0|}127|125|}
{2010212001|XXGvertex_oport_oport|195|0|322|0|{2|reject|}125|128|}
{2010006001|XXGobject_psameas_object|196|0|324|0|{metadata|reject_metadata|1|0|}128|125|}
{2010212001|XXGvertex_oport_oport|197|0|325|0|{3|error|}125|129|}
{2010006001|XXGobject_psameas_object|198|0|327|0|{metadata|error_metadata|1|0|}129|125|}
{2010212001|XXGvertex_oport_oport|199|0|328|0|{4|log|}125|130|}
{2010006001|XXGobject_psameas_object|200|0|330|0|{metadata|log_metadata|1|0|}130|125|}
{2010211001|XXGvertex_iport_iport|201|0|331|0|{0|in|}125|131|}
{2010006001|XXGobject_psameas_object|202|0|333|0|{metadata|in_metadata|1|0|}131|125|}
{2010006001|XXGobject_psameas_object|203|0|334|0|{Layout|Layout|0|0|}118|82|}
{2010006001|XXGobject_psameas_object|204|0|335|0|{deselect_metadata|read_metadata|0|0|}118|82|}
{2010006001|XXGobject_psameas_object|205|0|336|0|{in_metadata|read_metadata|0|0|}118|82|}
{2010006001|XXGobject_psameas_object|206|0|337|0|{out_metadata|read_metadata|0|0|}118|82|}
{2010006001|XXGobject_psameas_object|207|0|338|0|{reject_metadata|read_metadata|0|0|}118|82|}
{2010601001|XXGgraph_vertex_vertex|208|0|339|0|{Flatten|}100|87|}
{2010601001|XXGgraph_vertex_vertex|209|0|340|0|{Manifest|}100|82|}
{2010601001|XXGgraph_vertex_vertex|210|0|341|0|{Partition_by_Round_robin|}100|132|}
{2010212001|XXGvertex_oport_oport|211|0|343|0|{0|out|}132|133|}
{2010213001|XXGoport_dst_flow|212|0|345|0|{0|}133|102|}
{2010211001|XXGvertex_iport_iport|213|0|346|0|{0|in|}132|134|}
{2010214001|XXGiport_src_flow|214|0|348|0|{0|}134|66|}
{2010007001|XXGobject_proto_object|215|0|349|0|{}132|135|}
{2010212001|XXGvertex_oport_oport|216|0|351|0|{0|out|}135|136|}
{2010006001|XXGobject_psameas_object|217|0|353|0|{metadata|out_metadata|1|0|}136|135|}
{2010211001|XXGvertex_iport_iport|218|0|354|0|{0|in|}135|137|}
{2010006001|XXGobject_psameas_object|219|0|356|0|{metadata|in_metadata|1|0|}137|135|}
{2010006001|XXGobject_psameas_object|220|0|357|0|{Layout|Layout|0|0|}132|82|}
{2010006001|XXGobject_psameas_object|221|0|358|0|{in_metadata|out_metadata|0|0|}132|64|}
{2010006001|XXGobject_psameas_object|222|0|359|0|{out_metadata|out_metadata|0|0|}132|64|}
{2010601001|XXGgraph_vertex_vertex|223|0|360|0|{Read_Multiple_Files|}100|64|}
{2010601001|XXGgraph_vertex_vertex|224|0|361|0|{Replicate_1|}100|55|}
{2010601001|XXGgraph_vertex_vertex|225|0|362|0|{Replicate_2|}100|138|}
{2010212001|XXGvertex_oport_oport|226|0|364|0|{0|out|}138|139|}
{2010211001|XXGvertex_iport_iport|227|0|366|0|{0|in|}138|140|}
{2010214001|XXGiport_src_flow|228|0|368|0|{0|}140|89|}
{2010007001|XXGobject_proto_object|229|0|369|0|{}138|141|}
{2010212001|XXGvertex_oport_oport|230|0|371|0|{0|out|}141|142|}
{2010006001|XXGobject_psameas_object|231|0|373|0|{metadata|out_metadata|1|0|}142|141|}
{2010211001|XXGvertex_iport_iport|232|0|374|0|{0|in|}141|143|}
{2010006001|XXGobject_psameas_object|233|0|376|0|{metadata|in_metadata|1|0|}143|141|}
{2010006001|XXGobject_psameas_object|234|0|377|0|{Layout|Layout|0|0|}138|55|}
{2010006001|XXGobject_psameas_object|235|0|378|0|{in_metadata|out_metadata|0|0|}138|87|}
{2010006001|XXGobject_psameas_object|236|0|379|0|{out_metadata|out_metadata|0|0|}138|87|}
{2010601001|XXGgraph_vertex_vertex|237|0|380|0|{Rollup|}100|144|}
{2010212001|XXGvertex_oport_oport|238|0|382|0|{0|out|}144|145|}
{2010213001|XXGoport_dst_flow|239|0|384|0|{0|}145|103|}
{2010212001|XXGvertex_oport_oport|240|0|385|0|{1|reject|}144|146|}
{2010212001|XXGvertex_oport_oport|241|0|387|0|{2|error|}144|147|}
{2010212001|XXGvertex_oport_oport|242|0|389|0|{3|log|}144|148|}
{2010211001|XXGvertex_iport_iport|243|0|391|0|{0|in|}144|149|}
{2010214001|XXGiport_src_flow|244|0|393|0|{0|}149|58|}
{2010007001|XXGobject_proto_object|245|0|394|0|{}144|150|}
{2010212001|XXGvertex_oport_oport|246|0|396|0|{0|out|}150|151|}
{2010006001|XXGobject_psameas_object|247|0|398|0|{metadata|out_metadata|1|0|}151|150|}
{2010212001|XXGvertex_oport_oport|248|0|399|0|{1|reject|}150|152|}
{2010006001|XXGobject_psameas_object|249|0|401|0|{metadata|reject_metadata|1|0|}152|150|}
{2010212001|XXGvertex_oport_oport|250|0|402|0|{2|error|}150|153|}
{2010006001|XXGobject_psameas_object|251|0|404|0|{metadata|error_metadata|1|0|}153|150|}
{2010212001|XXGvertex_oport_oport|252|0|405|0|{3|log|}150|154|}
{2010006001|XXGobject_psameas_object|253|0|407|0|{metadata|log_metadata|1|0|}154|150|}
{2010211001|XXGvertex_iport_iport|254|0|408|0|{0|in|}150|155|}
{2010006001|XXGobject_psameas_object|255|0|410|0|{metadata|in_metadata|1|0|}155|150|}
{2010006001|XXGobject_psameas_object|256|0|411|0|{Layout|Layout|0|0|}144|156|}
{2010211001|XXGvertex_iport_iport|257|0|413|0|{0|write|}156|157|}
{2010214001|XXGiport_src_flow|258|0|415|0|{0|}157|103|}
{2010007001|XXGobject_proto_object|259|0|416|0|{}156|158|}
{2010211001|XXGvertex_iport_iport|260|0|418|0|{0|write|}158|159|}
{2010006001|XXGobject_psameas_object|261|0|420|0|{metadata|write_metadata|1|0|}159|158|}
{2010006001|XXGobject_psameas_object|262|0|421|0|{in_metadata|out_metadata|0|0|}144|64|}
{2010006001|XXGobject_psameas_object|263|0|422|0|{out_metadata|write_metadata|0|0|}144|156|}
{2010006001|XXGobject_psameas_object|264|0|423|0|{reject_metadata|out_metadata|0|0|}144|64|}
{2010601001|XXGgraph_vertex_vertex|265|0|424|0|{Row_Counts_per_file|}100|156|}
{2010601001|XXGgraph_vertex_vertex|266|0|425|0|{Trash_1|}100|160|}
{2010211001|XXGvertex_iport_iport|267|0|427|0|{0|in|}160|161|}
{2010214001|XXGiport_src_flow|268|0|429|0|{0|}161|101|}
{2010007001|XXGobject_proto_object|269|0|430|0|{}160|162|}
{2010211001|XXGvertex_iport_iport|270|0|432|0|{0|in|}162|163|}
{2010006001|XXGobject_psameas_object|271|0|434|0|{metadata|in_metadata|1|0|}163|162|}
{2010006001|XXGobject_psameas_object|272|0|435|0|{in_metadata|read_metadata|0|0|}160|164|}
{2010212001|XXGvertex_oport_oport|273|0|437|0|{0|read|}164|165|}
{2010213001|XXGoport_dst_flow|274|0|439|0|{0|}165|101|}
{2010007001|XXGobject_proto_object|275|0|440|0|{}164|166|}
{2010212001|XXGvertex_oport_oport|276|0|442|0|{0|read|}166|167|}
{2010006001|XXGobject_psameas_object|277|0|444|0|{metadata|read_metadata|1|0|}167|166|}
{2010601001|XXGgraph_vertex_vertex|278|0|445|0|{View_Data|}100|164|}
{2010212001|XXGvertex_oport_oport|279|0|446|0|{0|out0|}100|168|}
{2010216002|XXGoport_binding_oport|280|0|448|0|{.5|.8989899158477783|{12|751000|294000|771000|294000|1085000|294000|1085000|454000|1121000|454000|1141000|454000|}0|}168|139|}
{2010213001|XXGoport_dst_flow|281|0|449|0|{0|}168|20|}
{2010601001|XXGgraph_vertex_vertex|282|0|450|0|{Dedup_Src_Sys_Id_Seq_No_by_Newest_Update|}1|169|}
{2010212001|XXGvertex_oport_oport|283|0|452|0|{0|out|}169|170|}
{2010213001|XXGoport_dst_flow|284|0|454|0|{0|}170|18|}
{2010212001|XXGvertex_oport_oport|285|0|455|0|{1|dup|}169|171|}
{2010212001|XXGvertex_oport_oport|286|0|457|0|{2|reject|}169|172|}
{2010212001|XXGvertex_oport_oport|287|0|459|0|{3|error|}169|173|}
{2010212001|XXGvertex_oport_oport|288|0|461|0|{4|log|}169|174|}
{2010211001|XXGvertex_iport_iport|289|0|463|0|{0|in|}169|175|}
{2010214001|XXGiport_src_flow|290|0|465|0|{0|}175|12|}
{2010007001|XXGobject_proto_object|291|0|466|0|{}169|176|}
{2010212001|XXGvertex_oport_oport|292|0|468|0|{0|out|}176|177|}
{2010006001|XXGobject_psameas_object|293|0|470|0|{metadata|out_metadata|1|0|}177|176|}
{2010212001|XXGvertex_oport_oport|294|0|471|0|{1|dup|}176|178|}
{2010006001|XXGobject_psameas_object|295|0|473|0|{metadata|dup_metadata|1|0|}178|176|}
{2010212001|XXGvertex_oport_oport|296|0|474|0|{2|reject|}176|179|}
{2010006001|XXGobject_psameas_object|297|0|476|0|{metadata|reject_metadata|1|0|}179|176|}
{2010212001|XXGvertex_oport_oport|298|0|477|0|{3|error|}176|180|}
{2010006001|XXGobject_psameas_object|299|0|479|0|{metadata|error_metadata|1|0|}180|176|}
{2010212001|XXGvertex_oport_oport|300|0|480|0|{4|log|}176|181|}
{2010006001|XXGobject_psameas_object|301|0|482|0|{metadata|log_metadata|1|0|}181|176|}
{2010211001|XXGvertex_iport_iport|302|0|483|0|{0|in|}176|182|}
{2010006001|XXGobject_psameas_object|303|0|485|0|{metadata|in_metadata|1|0|}182|176|}
{2010006001|XXGobject_psameas_object|304|0|486|0|{Layout|Layout|0|0|}169|39|}
{2010006001|XXGobject_psameas_object|305|0|487|0|{dup_metadata|out0_metadata|0|0|}169|43|}
{2010006001|XXGobject_psameas_object|306|0|488|0|{in_metadata|out0_metadata|0|0|}169|43|}
{2010006001|XXGobject_psameas_object|307|0|489|0|{out_metadata|out0_metadata|0|0|}169|43|}
{2010006001|XXGobject_psameas_object|308|0|490|0|{reject_metadata|out0_metadata|0|0|}169|43|}
{2010601001|XXGgraph_vertex_vertex|309|0|491|0|{Dedup_by_NK|}1|183|}
{2010212001|XXGvertex_oport_oport|310|0|493|0|{0|out|}183|184|}
{2010213001|XXGoport_dst_flow|311|0|495|0|{0|}184|22|}
{2010212001|XXGvertex_oport_oport|312|0|496|0|{1|dup|}183|185|}
{2010212001|XXGvertex_oport_oport|313|0|498|0|{2|reject|}183|186|}
{2010212001|XXGvertex_oport_oport|314|0|500|0|{3|error|}183|187|}
{2010212001|XXGvertex_oport_oport|315|0|502|0|{4|log|}183|188|}
{2010211001|XXGvertex_iport_iport|316|0|504|0|{0|in|}183|189|}
{2010214001|XXGiport_src_flow|317|0|506|0|{0|}189|13|}
{2010007001|XXGobject_proto_object|318|0|507|0|{}183|190|}
{2010212001|XXGvertex_oport_oport|319|0|509|0|{0|out|}190|191|}
{2010006001|XXGobject_psameas_object|320|0|511|0|{metadata|out_metadata|1|0|}191|190|}
{2010212001|XXGvertex_oport_oport|321|0|512|0|{1|dup|}190|192|}
{2010006001|XXGobject_psameas_object|322|0|514|0|{metadata|dup_metadata|1|0|}192|190|}
{2010212001|XXGvertex_oport_oport|323|0|515|0|{2|reject|}190|193|}
{2010006001|XXGobject_psameas_object|324|0|517|0|{metadata|reject_metadata|1|0|}193|190|}
{2010212001|XXGvertex_oport_oport|325|0|518|0|{3|error|}190|194|}
{2010006001|XXGobject_psameas_object|326|0|520|0|{metadata|error_metadata|1|0|}194|190|}
{2010212001|XXGvertex_oport_oport|327|0|521|0|{4|log|}190|195|}
{2010006001|XXGobject_psameas_object|328|0|523|0|{metadata|log_metadata|1|0|}195|190|}
{2010211001|XXGvertex_iport_iport|329|0|524|0|{0|in|}190|196|}
{2010006001|XXGobject_psameas_object|330|0|526|0|{metadata|in_metadata|1|0|}196|190|}
{2010006001|XXGobject_psameas_object|331|0|527|0|{Layout|Layout|0|0|}183|35|}
{2010006001|XXGobject_psameas_object|332|0|528|0|{dup_metadata|out0_metadata|0|0|}183|43|}
{2010006001|XXGobject_psameas_object|333|0|529|0|{in_metadata|out0_metadata|0|0|}183|43|}
{2010006001|XXGobject_psameas_object|334|0|530|0|{out_metadata|out0_metadata|0|0|}183|43|}
{2010006001|XXGobject_psameas_object|335|0|531|0|{reject_metadata|out0_metadata|0|0|}183|43|}
{2010601001|XXGgraph_vertex_vertex|336|0|532|0|{ICFF_Lookup|}1|197|}
{2010007001|XXGobject_proto_object|337|0|534|0|{}197|198|}
{2010601001|XXGgraph_vertex_vertex|338|0|536|0|{Index_New_Generation|}1|199|}
{2010211001|XXGvertex_iport_iport|339|0|538|0|{0|write|}199|200|}
{2010214001|XXGiport_src_flow|340|0|540|0|{0|}200|11|}
{2010007001|XXGobject_proto_object|341|0|541|0|{}199|201|}
{2010211001|XXGvertex_iport_iport|342|0|543|0|{0|write|}201|202|}
{2010006001|XXGobject_psameas_object|343|0|545|0|{metadata|write_metadata|1|0|}202|201|}
{2010006001|XXGobject_psameas_object|344|0|546|0|{write_metadata|index_metadata|0|0|}199|203|}
{2010212001|XXGvertex_oport_oport|345|0|548|0|{0|out|}203|204|}
{2010213001|XXGoport_dst_flow|346|0|550|0|{0|}204|21|}
{2010212001|XXGvertex_oport_oport|347|0|551|0|{1|index|}203|205|}
{2010213001|XXGoport_dst_flow|348|0|553|0|{0|}205|11|}
{2010212001|XXGvertex_oport_oport|349|0|554|0|{2|address|}203|206|}
{2010211001|XXGvertex_iport_iport|350|0|556|0|{0|in|}203|207|}
{2010214001|XXGiport_src_flow|351|0|558|0|{0|}207|19|}
{2010007001|XXGobject_proto_object|352|0|559|0|{}203|208|}
{2010212001|XXGvertex_oport_oport|353|0|561|0|{0|out|}208|209|}
{2010006001|XXGobject_psameas_object|354|0|563|0|{metadata|out_metadata|1|0|}209|208|}
{2010212001|XXGvertex_oport_oport|355|0|564|0|{1|index|}208|210|}
{2010006001|XXGobject_psameas_object|356|0|566|0|{metadata|index_metadata|1|0|}210|208|}
{2010212001|XXGvertex_oport_oport|357|0|567|0|{2|address|}208|211|}
{2010006001|XXGobject_psameas_object|358|0|569|0|{metadata|address_metadata|1|0|}211|208|}
{2010211001|XXGvertex_iport_iport|359|0|570|0|{0|in|}208|212|}
{2010006001|XXGobject_psameas_object|360|0|572|0|{metadata|in_metadata|1|0|}212|208|}
{2010006001|XXGobject_psameas_object|361|0|573|0|{Layout|Layout|0|0|}203|39|}
{2010006001|XXGobject_psameas_object|362|0|574|0|{in_metadata|out0_metadata|0|0|}203|43|}
{2010006001|XXGobject_psameas_object|363|0|575|0|{out_metadata|write_metadata|0|0|}203|39|}
{2010601001|XXGgraph_vertex_vertex|364|0|576|0|{Partition_by_NK_Hash|}1|213|}
{2010212001|XXGvertex_oport_oport|365|0|578|0|{0|out|}213|214|}
{2010213001|XXGoport_dst_flow|366|0|580|0|{0|}214|17|}
{2010211001|XXGvertex_iport_iport|367|0|581|0|{0|in|}213|215|}
{2010214001|XXGiport_src_flow|368|0|583|0|{0|}215|16|}
{2010007001|XXGobject_proto_object|369|0|584|0|{}213|216|}
{2010212001|XXGvertex_oport_oport|370|0|586|0|{0|out|}216|217|}
{2010006001|XXGobject_psameas_object|371|0|588|0|{metadata|out_metadata|1|0|}217|216|}
{2010211001|XXGvertex_iport_iport|372|0|589|0|{0|in|}216|218|}
{2010006001|XXGobject_psameas_object|373|0|591|0|{metadata|in_metadata|1|0|}218|216|}
{2010006001|XXGobject_psameas_object|374|0|592|0|{Layout|Layout|0|0|}213|55|}
{2010006001|XXGobject_psameas_object|375|0|593|0|{in_metadata|out0_metadata|0|0|}213|43|}
{2010006001|XXGobject_psameas_object|376|0|594|0|{out_metadata|out0_metadata|0|0|}213|43|}
{2010601001|XXGgraph_vertex_vertex|377|0|595|0|{Read_ICFF_for_NK_Dedup_Eff_Date_by_First_Actv_Seq_No|}1|219|}
{2010212001|XXGvertex_oport_oport|378|0|597|0|{0|out|}219|220|}
{2010213001|XXGoport_dst_flow|379|0|599|0|{0|}220|9|}
{2010212001|XXGvertex_oport_oport|380|0|600|0|{1|reject|}219|221|}
{2010212001|XXGvertex_oport_oport|381|0|602|0|{2|error|}219|222|}
{2010212001|XXGvertex_oport_oport|382|0|604|0|{3|log|}219|223|}
{2010211001|XXGvertex_iport_iport|383|0|606|0|{0|in|}219|224|}
{2010214001|XXGiport_src_flow|384|0|608|0|{0|}224|22|}
{2010007001|XXGobject_proto_object|385|0|609|0|{}219|225|}
{2010212001|XXGvertex_oport_oport|386|0|611|0|{0|out|}225|226|}
{2010006001|XXGobject_psameas_object|387|0|613|0|{metadata|out_metadata|1|0|}226|225|}
{2010212001|XXGvertex_oport_oport|388|0|614|0|{1|reject|}225|227|}
{2010006001|XXGobject_psameas_object|389|0|616|0|{metadata|reject_metadata|1|0|}227|225|}
{2010212001|XXGvertex_oport_oport|390|0|617|0|{2|error|}225|228|}
{2010006001|XXGobject_psameas_object|391|0|619|0|{metadata|error_metadata|1|0|}228|225|}
{2010212001|XXGvertex_oport_oport|392|0|620|0|{3|log|}225|229|}
{2010006001|XXGobject_psameas_object|393|0|622|0|{metadata|log_metadata|1|0|}229|225|}
{2010211001|XXGvertex_iport_iport|394|0|623|0|{0|in|}225|230|}
{2010006001|XXGobject_psameas_object|395|0|625|0|{metadata|in_metadata|1|0|}230|225|}
{2010006001|XXGobject_psameas_object|396|0|626|0|{Layout|Layout|0|0|}219|35|}
{2010006001|XXGobject_psameas_object|397|0|627|0|{in_metadata|out0_metadata|0|0|}219|43|}
{2010006001|XXGobject_psameas_object|398|0|628|0|{out_metadata|write_metadata|0|0|}219|35|}
{2010006001|XXGobject_psameas_object|399|0|629|0|{reject_metadata|out0_metadata|0|0|}219|43|}
{2010601001|XXGgraph_vertex_vertex|400|0|630|0|{Replicate|}1|231|}
{2010212001|XXGvertex_oport_oport|401|0|632|0|{0|out|}231|232|}
{2010213001|XXGoport_dst_flow|402|0|634|0|{0|}232|19|}
{2010213001|XXGoport_dst_flow|403|0|635|0|{1|}232|10|}
{2010211001|XXGvertex_iport_iport|404|0|636|0|{0|in|}231|233|}
{2010214001|XXGiport_src_flow|405|0|638|0|{0|}233|18|}
{2010007001|XXGobject_proto_object|406|0|639|0|{}231|234|}
{2010212001|XXGvertex_oport_oport|407|0|641|0|{0|out|}234|235|}
{2010006001|XXGobject_psameas_object|408|0|643|0|{metadata|out_metadata|1|0|}235|234|}
{2010211001|XXGvertex_iport_iport|409|0|644|0|{0|in|}234|236|}
{2010006001|XXGobject_psameas_object|410|0|646|0|{metadata|in_metadata|1|0|}236|234|}
{2010006001|XXGobject_psameas_object|411|0|647|0|{Layout|Layout|0|0|}231|39|}
{2010006001|XXGobject_psameas_object|412|0|648|0|{in_metadata|out0_metadata|0|0|}231|43|}
{2010006001|XXGobject_psameas_object|413|0|649|0|{out_metadata|out0_metadata|0|0|}231|43|}
{2010601001|XXGgraph_vertex_vertex|414|0|650|0|{Sort_by_NK_Hash_Src_Sys_Id_Seq_No_Updt_Time|}1|237|}
{2010212001|XXGvertex_oport_oport|415|0|652|0|{0|out|}237|238|}
{2010213001|XXGoport_dst_flow|416|0|654|0|{0|}238|12|}
{2010211001|XXGvertex_iport_iport|417|0|655|0|{0|in|}237|239|}
{2010214001|XXGiport_src_flow|418|0|657|0|{0|}239|17|}
{2010007001|XXGobject_proto_object|419|0|658|0|{}237|240|}
{2010212001|XXGvertex_oport_oport|420|0|660|0|{0|out|}240|241|}
{2010006001|XXGobject_psameas_object|421|0|662|0|{metadata|out_metadata|1|0|}241|240|}
{2010211001|XXGvertex_iport_iport|422|0|663|0|{0|in|}240|242|}
{2010006001|XXGobject_psameas_object|423|0|665|0|{metadata|in_metadata|1|0|}242|240|}
{2010006001|XXGobject_psameas_object|424|0|666|0|{Layout|Layout|0|0|}237|39|}
{2010006001|XXGobject_psameas_object|425|0|667|0|{in_metadata|out0_metadata|0|0|}237|43|}
{2010006001|XXGobject_psameas_object|426|0|668|0|{out_metadata|out0_metadata|0|0|}237|43|}
{2010601001|XXGgraph_vertex_vertex|427|0|669|0|{Sort_within_NK_Hash_by_NK|}1|243|}
{2010212001|XXGvertex_oport_oport|428|0|671|0|{0|out|}243|244|}
{2010213001|XXGoport_dst_flow|429|0|673|0|{0|}244|13|}
{2010211001|XXGvertex_iport_iport|430|0|674|0|{0|in|}243|245|}
{2010214001|XXGiport_src_flow|431|0|676|0|{0|}245|10|}
{2010007001|XXGobject_proto_object|432|0|677|0|{}243|246|}
{2010212001|XXGvertex_oport_oport|433|0|679|0|{0|out|}246|247|}
{2010006001|XXGobject_psameas_object|434|0|681|0|{metadata|out_metadata|1|0|}247|246|}
{2010211001|XXGvertex_iport_iport|435|0|682|0|{0|in|}246|248|}
{2010006001|XXGobject_psameas_object|436|0|684|0|{metadata|in_metadata|1|0|}248|246|}
{2010006001|XXGobject_psameas_object|437|0|685|0|{Layout|Layout|0|0|}243|35|}
{2010006001|XXGobject_psameas_object|438|0|686|0|{in_metadata|out0_metadata|0|0|}243|43|}
{2010006001|XXGobject_psameas_object|439|0|687|0|{out_metadata|out0_metadata|0|0|}243|43|}
{2010601001|XXGgraph_vertex_vertex|440|0|688|0|{Spec|}1|249|}
{2010605001|XXGgraph_legend_legend|441|0|690|0|{0|}249|250|}
{2010241001|XXGlegend_face_face|442|0|692|0|{}250|251|}
{2010601001|XXGgraph_vertex_vertex|443|0|694|0|{Reanalyze|}249|252|}
{2010604001|XXGgraph_flow_flow|444|0|696|0|{Flow_1|}252|253|}
{2010604001|XXGgraph_flow_flow|445|0|698|0|{Flow_2|}252|254|}
{2010604001|XXGgraph_flow_flow|446|0|700|0|{Flow_3|}252|255|}
{2010601001|XXGgraph_vertex_vertex|447|0|702|0|{Adjust_dates|}252|256|}
{2010212001|XXGvertex_oport_oport|448|0|704|0|{0|out|}256|257|}
{2010212001|XXGvertex_oport_oport|449|0|706|0|{1|reject|}256|258|}
{2010212001|XXGvertex_oport_oport|450|0|708|0|{2|error|}256|259|}
{2010212001|XXGvertex_oport_oport|451|0|710|0|{3|log|}256|260|}
{2010211001|XXGvertex_iport_iport|452|0|712|0|{0|in|}256|261|}
{2010214001|XXGiport_src_flow|453|0|714|0|{0|}261|253|}
{2010007001|XXGobject_proto_object|454|0|715|0|{}256|262|}
{2010212001|XXGvertex_oport_oport|455|0|717|0|{0|out|}262|263|}
{2010006001|XXGobject_psameas_object|456|0|719|0|{metadata|out_metadata|1|0|}263|262|}
{2010212001|XXGvertex_oport_oport|457|0|720|0|{1|reject|}262|264|}
{2010006001|XXGobject_psameas_object|458|0|722|0|{metadata|reject_metadata|1|0|}264|262|}
{2010212001|XXGvertex_oport_oport|459|0|723|0|{2|error|}262|265|}
{2010006001|XXGobject_psameas_object|460|0|725|0|{metadata|error_metadata|1|0|}265|262|}
{2010212001|XXGvertex_oport_oport|461|0|726|0|{3|log|}262|266|}
{2010006001|XXGobject_psameas_object|462|0|728|0|{metadata|log_metadata|1|0|}266|262|}
{2010211001|XXGvertex_iport_iport|463|0|729|0|{0|in|}262|267|}
{2010006001|XXGobject_psameas_object|464|0|731|0|{metadata|in_metadata|1|0|}267|262|}
{2010006001|XXGobject_psameas_object|465|0|732|0|{in_metadata|out_metadata|0|0|}256|268|}
{2010212001|XXGvertex_oport_oport|466|0|734|0|{0|out|}268|269|}
{2010213001|XXGoport_dst_flow|467|0|736|0|{0|}269|253|}
{2010212001|XXGvertex_oport_oport|468|0|737|0|{1|reject|}268|270|}
{2010212001|XXGvertex_oport_oport|469|0|739|0|{2|error|}268|271|}
{2010212001|XXGvertex_oport_oport|470|0|741|0|{3|log|}268|272|}
{2010211001|XXGvertex_iport_iport|471|0|743|0|{0|in|}268|273|}
{2010214001|XXGiport_src_flow|472|0|745|0|{0|}273|254|}
{2010007001|XXGobject_proto_object|473|0|746|0|{}268|274|}
{2010212001|XXGvertex_oport_oport|474|0|748|0|{0|out|}274|275|}
{2010006001|XXGobject_psameas_object|475|0|750|0|{metadata|out_metadata|1|0|}275|274|}
{2010212001|XXGvertex_oport_oport|476|0|751|0|{1|reject|}274|276|}
{2010006001|XXGobject_psameas_object|477|0|753|0|{metadata|reject_metadata|1|0|}276|274|}
{2010212001|XXGvertex_oport_oport|478|0|754|0|{2|error|}274|277|}
{2010006001|XXGobject_psameas_object|479|0|756|0|{metadata|error_metadata|1|0|}277|274|}
{2010212001|XXGvertex_oport_oport|480|0|757|0|{3|log|}274|278|}
{2010006001|XXGobject_psameas_object|481|0|759|0|{metadata|log_metadata|1|0|}278|274|}
{2010211001|XXGvertex_iport_iport|482|0|760|0|{0|in|}274|279|}
{2010006001|XXGobject_psameas_object|483|0|762|0|{metadata|in_metadata|1|0|}279|274|}
{2010006001|XXGobject_psameas_object|484|0|763|0|{in_metadata|out_metadata|0|0|}268|280|}
{2010212001|XXGvertex_oport_oport|485|0|765|0|{0|out|}280|281|}
{2010213001|XXGoport_dst_flow|486|0|767|0|{0|}281|254|}
{2010212001|XXGvertex_oport_oport|487|0|768|0|{1|reject|}280|282|}
{2010212001|XXGvertex_oport_oport|488|0|770|0|{2|error|}280|283|}
{2010212001|XXGvertex_oport_oport|489|0|772|0|{3|log|}280|284|}
{2010211001|XXGvertex_iport_iport|490|0|774|0|{0|in|}280|285|}
{2010214001|XXGiport_src_flow|491|0|776|0|{0|}285|255|}
{2010007001|XXGobject_proto_object|492|0|777|0|{}280|286|}
{2010212001|XXGvertex_oport_oport|493|0|779|0|{0|out|}286|287|}
{2010006001|XXGobject_psameas_object|494|0|781|0|{metadata|out_metadata|1|0|}287|286|}
{2010212001|XXGvertex_oport_oport|495|0|782|0|{1|reject|}286|288|}
{2010006001|XXGobject_psameas_object|496|0|784|0|{metadata|reject_metadata|1|0|}288|286|}
{2010212001|XXGvertex_oport_oport|497|0|785|0|{2|error|}286|289|}
{2010006001|XXGobject_psameas_object|498|0|787|0|{metadata|error_metadata|1|0|}289|286|}
{2010212001|XXGvertex_oport_oport|499|0|788|0|{3|log|}286|290|}
{2010006001|XXGobject_psameas_object|500|0|790|0|{metadata|log_metadata|1|0|}290|286|}
{2010211001|XXGvertex_iport_iport|501|0|791|0|{0|in|}286|291|}
{2010006001|XXGobject_psameas_object|502|0|793|0|{metadata|in_metadata|1|0|}291|286|}
{2010006001|XXGobject_psameas_object|503|0|794|0|{reject_metadata|out_metadata|0|0|}268|280|}
{2010006001|XXGobject_psameas_object|504|0|795|0|{reject_metadata|out_metadata|0|0|}256|268|}
{2010601001|XXGgraph_vertex_vertex|505|0|796|0|{Dedup_Sorted|}252|292|}
{2010212001|XXGvertex_oport_oport|506|0|798|0|{0|out|}292|293|}
{2010213001|XXGoport_dst_flow|507|0|800|0|{0|}293|255|}
{2010212001|XXGvertex_oport_oport|508|0|801|0|{1|dup|}292|294|}
{2010212001|XXGvertex_oport_oport|509|0|803|0|{2|reject|}292|295|}
{2010212001|XXGvertex_oport_oport|510|0|805|0|{3|error|}292|296|}
{2010212001|XXGvertex_oport_oport|511|0|807|0|{4|log|}292|297|}
{2010211001|XXGvertex_iport_iport|512|0|809|0|{0|in|}292|298|}
{2010007001|XXGobject_proto_object|513|0|811|0|{}292|299|}
{2010212001|XXGvertex_oport_oport|514|0|813|0|{0|out|}299|300|}
{2010006001|XXGobject_psameas_object|515|0|815|0|{metadata|out_metadata|1|0|}300|299|}
{2010212001|XXGvertex_oport_oport|516|0|816|0|{1|dup|}299|301|}
{2010006001|XXGobject_psameas_object|517|0|818|0|{metadata|dup_metadata|1|0|}301|299|}
{2010212001|XXGvertex_oport_oport|518|0|819|0|{2|reject|}299|302|}
{2010006001|XXGobject_psameas_object|519|0|821|0|{metadata|reject_metadata|1|0|}302|299|}
{2010212001|XXGvertex_oport_oport|520|0|822|0|{3|error|}299|303|}
{2010006001|XXGobject_psameas_object|521|0|824|0|{metadata|error_metadata|1|0|}303|299|}
{2010212001|XXGvertex_oport_oport|522|0|825|0|{4|log|}299|304|}
{2010006001|XXGobject_psameas_object|523|0|827|0|{metadata|log_metadata|1|0|}304|299|}
{2010211001|XXGvertex_iport_iport|524|0|828|0|{0|in|}299|305|}
{2010006001|XXGobject_psameas_object|525|0|830|0|{metadata|in_metadata|1|0|}305|299|}
{2010601001|XXGgraph_vertex_vertex|526|0|831|0|{Doc|}252|306|}
{2010601001|XXGgraph_vertex_vertex|527|0|833|0|{Case_Three|}306|307|}
{2010605001|XXGgraph_legend_legend|528|0|835|0|{0|}307|308|}
{2010241001|XXGlegend_face_face|529|0|837|0|{}308|309|}
{2010605001|XXGgraph_legend_legend|530|0|839|0|{1|}307|310|}
{2010241001|XXGlegend_face_face|531|0|841|0|{}310|311|}
{2010601001|XXGgraph_vertex_vertex|532|0|843|0|{Case_Two_Actives|}306|312|}
{2010605001|XXGgraph_legend_legend|533|0|845|0|{0|}312|313|}
{2010241001|XXGlegend_face_face|534|0|847|0|{}313|314|}
{2010605001|XXGgraph_legend_legend|535|0|849|0|{1|}312|315|}
{2010241001|XXGlegend_face_face|536|0|851|0|{}315|316|}
{2010601001|XXGgraph_vertex_vertex|537|0|853|0|{Test_Case_Five_Higher_sequence_number_with_no_overlap|}306|317|}
{2010605001|XXGgraph_legend_legend|538|0|855|0|{0|}317|318|}
{2010241001|XXGlegend_face_face|539|0|857|0|{}318|319|}
{2010601001|XXGgraph_vertex_vertex|540|0|859|0|{Test_Case_Four_Higher_sequence_number_with_an_overlap_one_one_end|}306|320|}
{2010605001|XXGgraph_legend_legend|541|0|861|0|{0|}320|321|}
{2010241001|XXGlegend_face_face|542|0|863|0|{}321|322|}
{2010601001|XXGgraph_vertex_vertex|543|0|865|0|{Test_Case_One_Inactive_with_higher_sequence_numbers_that_are_revealed|}306|323|}
{2010605001|XXGgraph_legend_legend|544|0|867|0|{0|}323|324|}
{2010241001|XXGlegend_face_face|545|0|869|0|{}324|325|}
{2010605001|XXGgraph_legend_legend|546|0|871|0|{1|}323|326|}
{2010241001|XXGlegend_face_face|547|0|873|0|{}326|327|}
{2010601001|XXGgraph_vertex_vertex|548|0|875|0|{Test_Case_Six_Higher_sequence_number_with_an_overlap_on_two_ends|}306|328|}
{2010605001|XXGgraph_legend_legend|549|0|877|0|{0|}328|329|}
{2010241001|XXGlegend_face_face|550|0|879|0|{}329|330|}
{2010601001|XXGgraph_vertex_vertex|551|0|881|0|{Test_Case_Three_Lower_sequence_number_with_overlap_on_higher_numbers|}306|331|}
{2010605001|XXGgraph_legend_legend|552|0|883|0|{0|}331|332|}
{2010241001|XXGlegend_face_face|553|0|885|0|{}332|333|}
{2010601001|XXGgraph_vertex_vertex|554|0|887|0|{Test_Case_Two_Inactive_with_overlapping_higher_sequence_numbers_that_are_revealed|}306|334|}
{2010605001|XXGgraph_legend_legend|555|0|889|0|{0|}334|335|}
{2010241001|XXGlegend_face_face|556|0|891|0|{}335|336|}
{2010605001|XXGgraph_legend_legend|557|0|893|0|{1|}334|337|}
{2010241001|XXGlegend_face_face|558|0|895|0|{}337|338|}
{2010601001|XXGgraph_vertex_vertex|559|0|897|0|{Get_matching_rows|}252|280|}
{2010601001|XXGgraph_vertex_vertex|560|0|898|0|{Rollup_to_natural_key_vector|}252|268|}
{2010212001|XXGvertex_oport_oport|561|0|899|0|{0|out1|}252|339|}
{2010216002|XXGoport_binding_oport|562|0|901|0|{.5|.5|{12|1049000|289000|1069000|289000|1108000|289000|1108000|279000|1148000|279000|1168000|279000|}0|}339|257|}
{2010211001|XXGvertex_iport_iport|563|0|902|0|{0|in1|}252|340|}
{2010215002|XXGiport_binding_iport|564|0|904|0|{.5|.5|{12|84000|289000|64000|289000|53000|289000|53000|279000|41000|279000|21000|279000|}0|}340|298|}
{2010601001|XXGgraph_vertex_vertex|565|0|905|0|{Trash|}1|341|}
{2010211001|XXGvertex_iport_iport|566|0|907|0|{0|in|}341|342|}
{2010214001|XXGiport_src_flow|567|0|909|0|{0|}342|14|}
{2010007001|XXGobject_proto_object|568|0|910|0|{}341|343|}
{2010211001|XXGvertex_iport_iport|569|0|912|0|{0|in|}343|344|}
{2010006001|XXGobject_psameas_object|570|0|914|0|{metadata|in_metadata|1|0|}344|343|}
{2010006001|XXGobject_psameas_object|571|0|915|0|{in_metadata|read_metadata|0|0|}341|345|}
{2010212001|XXGvertex_oport_oport|572|0|917|0|{0|read|}345|346|}
{2010213001|XXGoport_dst_flow|573|0|919|0|{0|}346|14|}
{2010007001|XXGobject_proto_object|574|0|920|0|{}345|347|}
{2010212001|XXGvertex_oport_oport|575|0|922|0|{0|read|}347|348|}
{2010006001|XXGobject_psameas_object|576|0|924|0|{metadata|read_metadata|1|0|}348|347|}
{2010601001|XXGgraph_vertex_vertex|577|0|925|0|{Updated_Source_File|}1|35|}
{2010601001|XXGgraph_vertex_vertex|578|0|926|0|{View_Lookup|}1|345|}
{2010601001|XXGgraph_vertex_vertex|579|0|927|0|{Write_Block_Compressed_Lookup|}1|203|}
{2010109001|XXGobject_property_value|580|0|928|0|{0|TrackingThumbprint|72|}1|349|}
