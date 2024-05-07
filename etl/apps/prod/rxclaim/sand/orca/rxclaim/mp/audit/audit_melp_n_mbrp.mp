@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|272|rel_count|487|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|PASS|1|3|9|RFK|@{0|}}
{30001002|XXparameter|TO_EMAIL_LIST||3|9|RFK|@{0|}}
{30001002|XXparameter|FROM_EMAIL_ADDRESS|$(whoami )\@$( hostname -f )|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|audit_melp_n_mbrp_1|ndeotars|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|769000|501000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'audit_melp_n_mbrp' Execution Status Report


Job "audit_melp_n_mbrp" Execution started at Wednesday, March 07, 2018 05:56:50
Job completed successfully at Wednesday, March 07, 2018 05:56:55

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:05
Run performed by user sreeraj.menon
Total data moved through all flows: 8 records (1140 bytes)
Total CPU time (all processes): 1 seconds
Average CPU utilization across all nodes: 0.00 percent
|||
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|16711680|120|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Pass 1  to run after clean file generation|394000|26000|0|0|0|0|5955|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|16711680|120|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Pass 2  to run after audit process completion

|359000|291000|0|0|0|0|5956|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|16711680|120|0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}6030|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}6032|17|}}
{2010600005|XXGgraph|11|0|21|0|{Subgraph created from graph "melp_cag_rollup_gtp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ PASS == "2" ]|3|9|F||{0|}}
}}@0|@448000|347500|0|0|0|0|6031|Prepare report and send mail Pass2-1|ndeotars|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1462000|552000|7|}}
{2010240003|XXGlegend|12|0|23|0|{@{}@Read the file created in 2nd phase,
so as to have 1 email contents|717000|117000|0|0|0|0|2198|}}
{2010242002|XXGface|13|0|25|0|{@{}@Arial|16711680|120|0|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}5991|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}6071|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}6072|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}6053|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}6052|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}6066|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}5988|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}6037|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}6068|17|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}6070|17|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}5956|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}5992|17|}}
{2010501005|XXGpvertex|26|0|51|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Concatenate|575000|193000|0|0|0|0|1827|Concatenate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|27|0|53|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|28|0|56|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|29|0|60|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|30|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|31|0|65|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|32|0|68|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/final_report_rcmbrp_n_rcmelp_audit.html", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/final_report_rcmbrp_n_rcmelp_audit.html|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
string(int) body;
end|3|1|l|@{0|}}
}}@0|@1178000|388000|0|0|0|0|5989|Output File|Ab Initio Software|@1|100|-1||6||257|-1|-1|}}
{2010202004|XXGiport|33|0|70|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|34|0|73|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|35|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|36|0|78|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
        out.seq_no              :: "Sr. No"             ;
        out.table_name          :: "Table Name"         ;
        out.source              :: "Source"             ;
        out.ids_raw_count       :: "IDS Raw Count"      ;
        out.filtered_count      :: "Filter Count"     ;
        out.update_count        :: "Update Count"       ;
        out.insert_count        :: "Insert Count"       ;
        out.status              :: "Status"             ;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record

        string("~")   seq_no                   ;
        string("~")   table_name               ;
        string("~")   source                   ;
        decimal("~",grouping="3",grouping_sep = ",")  ids_raw_count   = "-" ;
        decimal("~",grouping="3",grouping_sep = ",")  filtered_count  = "-" ;      
        decimal("~",grouping="3",grouping_sep = ",")  update_count    = "-" ;
        decimal("~",grouping="3",grouping_sep = ",")  insert_count    = "-" ;
        string("\\n")  status             = "" ; 
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|398000|66000|0|0|0|0|5957|Create header|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|37|0|80|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|38|0|83|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|39|0|85|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|40|0|87|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|41|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|42|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|43|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|44|0|100|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let string(int) extract_details=first_without_error( reinterpret (read_file("$\{AI_SERIAL_TEMP\}/rcmelp_audit.html"),4) ,"");
let string(int) body="";

let int __no_aggregation_fields__ = allocate();

type temporary_type =
record
end;

record
  int __no_aggregation_fields__ = 0;
end temp :: initialize(in) =
begin
end;

out :: rollup(temp, in) =
begin
let decimal("") seq_no = next_in_sequence() - 1 ;
let string("") color  = if( seq_no == 0 ) "BGCOLOR=#85aee5" else "BGCOLOR=#f2f6fc";
let string("") success_bg_color = "BGCOLOR=#2bbf3d";
let string("") failure_bg_color = "BGCOLOR=#ef6353";

body=body + "<tr " + color + ">" 
        + "<td align=center >" + (if(seq_no!=0) seq_no else in.seq_no)+ "</td>"
        + "<td align=center >" + in.table_name                      + "</td>"
        + "<td align=center >" + in.source                          + "</td>"
        + "<td align=center >" + (string("")) in.ids_raw_count      + "</td>"
        + "<td align=center >" + (string("")) in.filtered_count     + "</td>"
        + "<td align=center >" + (string("")) in.update_count       + "</td>"
        + "<td align=center >" + (string("")) in.insert_count       + "</td>"
        
        
        + if ( in.status == "Success")  "<td align=center " + success_bg_color + ">" + in.status + "</td>"
     else if( in.status == "Failure")  "<td align=center " + failure_bg_color + ">" + in.status + "</td>"
     else  "<td align=center >" + in.status + "</td>"
+"</tr>";

end;

out :: finalize(temp, in) =
begin



out.body :: extract_details + "<br><br><br><br><br>" +  "<br><br><br><br>Below is IDS process details,<br><br>" +
" <table style='width:50%' align='left' border='1' cellspacing=0 cellpadding=0 > " 
 +  body + 
"</table>"  ;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|record
string(int) body;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|819000|165000|0|0|0|0|5993|Convert to HTML|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|45|0|102|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|46|0|105|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|47|0|107|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|48|0|109|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|111|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|50|0|114|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|51|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|52|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|53|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|54|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|55|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|56|0|135|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|table_name member [vector "RCMELP","RCMBRP"]|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|297000|283000|0|0|0|0|6067|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|57|0|137|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|58|0|140|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|59|0|142|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|60|0|144|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|61|0|146|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|62|0|148|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|63|0|151|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|64|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|65|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|66|0|159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|67|0|162|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|68|0|165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|69|0|168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|70|0|171|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/audit_mbr_2.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/audit_mbr_2.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@978000|352000|0|0|0|0|6017|Output File-1|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|71|0|173|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|72|0|176|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|73|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|74|0|181|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
string("\|") record_type;
if (record_type == "MBR_ELIG_RXCLAIM_TO_IDS")
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") RxClaim_Count;
string("\|") ids_raw_Count;
string("\|") ids_raw_Count_tomorrow;
string("\\n") status;
end MBR_ELIG_RXCLAIM_TO_IDS;
 
if (record_type == "MBR_ELIG_IDS_TO_CPP" )
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") ids_raw_Count;
string("\|") filter_count;
string("\|") update_count;
string("\|") insert_count;
string("\\n") status;
end MBR_ELIG_IDS_TO_CPP;
 
if (record_type == "CLAIM_RXCLAIM_TO_IDS")
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") submit_date;
string("\|") RxClaim_Count;
string("\|") ids_raw_Count;
string("\|") ids_unique_Count;
string("\|") ilm_raw_Count;
string("\\n") status;
end CLAIM_RXCLAIM_TO_IDS;
 
if (record_type == "CLAIM_IDS_TO_CPP" )
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") ids_raw_Count;
string("\|") map_filter_Count;
string("\|") ids_filter_count;
string("\|") update_count;
string("\|") insert_count;
string("\\n") status;
end CLAIM_IDS_TO_CPP;
 
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
  out.record_type :: "MBR_ELIG_IDS_TO_CPP";
  out.MBR_ELIG_IDS_TO_CPP.Extraction_Dt :: ( string(""))(date("YYYYMMDD")) (today()  );
  out.MBR_ELIG_IDS_TO_CPP.TableName :: in.table_name;
  out.MBR_ELIG_IDS_TO_CPP.Source :: in.source;
  out.MBR_ELIG_IDS_TO_CPP.ids_raw_Count :: in.ids_raw_count;
  out.MBR_ELIG_IDS_TO_CPP.filter_count :: in.filtered_count;
  out.MBR_ELIG_IDS_TO_CPP.update_count :: in.update_count;
  out.MBR_ELIG_IDS_TO_CPP.insert_count :: in.insert_count;
  out.MBR_ELIG_IDS_TO_CPP.status :: in.status;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|774000|335000|0|0|0|0|6054|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|75|0|183|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|76|0|186|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|77|0|188|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|78|0|190|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|79|0|192|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|80|0|195|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|81|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|82|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|83|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|84|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|85|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|214|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
let decimal("") ids_fltr_cnt = (in.supp_update_rec_count + in.duplicate_rec_count + in.same_rec_count );
out.seq_no::"-";
out.table_name::if(in.ids_nm=="ids_common.d_member_eligibility")"RCMELP" else if(in.ids_nm=="ids_common.d_member")"RCMBRP" else "-" ;
out.source::string_upcase(in.src_nm);
out.ids_raw_count::in.clean_file_count;
out.filtered_count::in.test_rec_count;
out.update_count::in.update_rec_count;
out.insert_count::in.insert_rec_count;
out.status:: if(in.clean_file_count == (in.insert_rec_count + in.update_rec_count + ids_fltr_cnt + in.test_rec_count)) "Success" else "Failure" ;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|record

        string("~")   seq_no                   ;
        string("~")   table_name               ;
        string("~")   source                   ;
        decimal("~",grouping="3",grouping_sep = ",")  ids_raw_count   = "-" ;
        decimal("~",grouping="3",grouping_sep = ",")  filtered_count  = "-" ;      
        decimal("~",grouping="3",grouping_sep = ",")  update_count    = "-" ;
        decimal("~",grouping="3",grouping_sep = ",")  insert_count    = "-" ;
        string("\\n")  status             = "" ; 
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|57000|277000|0|0|0|0|6069|RFMT: Audit|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|87|0|216|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|88|0|219|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|89|0|221|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|90|0|223|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|91|0|225|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|92|0|227|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|93|0|229|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|94|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|95|0|236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|96|0|239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|97|0|242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|98|0|246|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/final_importatnt_table.audit.report.dat|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
string("\|") program_nm="";
string("\|") application_nm="";
string("\|") src_nm="";
string("\|") ilm_nm="";
string("\|") ids_nm="";
decimal("\|") run_id=0;
decimal("\|") all_get_count=0;
decimal("\|") clean_file_count=0;
decimal("\|") split_file_count=0;
decimal("\|") test_rec_count=0;
decimal("\|") insert_rec_count=0;
decimal("\|") update_rec_count=0;
decimal("\|") supp_update_rec_count=0;
decimal("\|") same_rec_count=0;
decimal("\|") duplicate_rec_count=0;
string("\|") final_result="";
decimal("\\n") total_rec_count=0;
end|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@42000|230000|0|0|0|0|6029|audit.report.dat|Ab Initio Software|@1|100000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|99|0|248|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|100|0|252|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|101|0|254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|102|0|267|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|1041000|195000|0|0|0|0|2194|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|103|0|269|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|104|0|273|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|105|0|276|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|106|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|107|0|281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|108|0|287|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|565000|310000|0|0|0|0|6039|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|109|0|289|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|110|0|293|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|111|0|296|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|112|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|113|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|114|0|307|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/Mail/Send_Mail.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|include "~$AB_HOME/include/mail.dml";

message :: prepare_message(in) =
begin
  let envelope_t e;
  let disposition_t d;
  let header_t h;
  let content_t c;
 
  
 

  let text_message_t message = allocate();
  let to_list = string_split('$\{TO_EMAIL_LIST\}', ",");
  let string("") email_subject =  "Extraction Details ( rcmelp & rcmbrp ) : " + (string(""))(date("YYYY-MM-DD"))now();

  message.to = for ( let int i, i<length_of(to_list)) : [record e_mail_address to_list[i]];
  message.from.e_mail_address = '$\{FROM_EMAIL_ADDRESS\}';
  message.from.readable_name = '$\{FROM_EMAIL_ADDRESS\}';
  message.subject = email_subject;
  message.text =  "Hi All," + in.body + "<br><br><br><br><br><br><br><br> <i>This is system generated email.<br>*Not Available=Audit process not completed</i>"; 



  //message :: create_message_using_text_message(message);
  
   
  if (is_defined(message))
    begin
      e= create_envelope_using_text_message(message);
      d = create_disposition("", NULL);
      h = create_header("text", "html", NULL, "q", NULL, NULL, d, NULL, NULL);
      c = create_content_with_text(h, message.text);
    end;
 
  message :: create_message(e, c); 
 
end;|3|3|c|@{0|}}
{30001002|XXparameter|smtp_server_host|localhost|3|2|$|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Send Mail|1172000|172000|0|0|0|0|6073|Send Mail-1|Ab Initio Software|Built-in 2.15.0.r10:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|115|0|309|0|{@{}@0|0|0|0|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|116|0|311|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|117|0|314|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|118|0|317|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|119|0|319|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|120|0|322|0|{Send Mail component provides control over low-level details of sending an email message.  For most applications, the SEND MESSAGE and SEND MULTIPLE MESSAGES components provide all of the functionality that is required and they are much simpler to use.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|send-mail|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/send-mail|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16.0.r2:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16.0.r2:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_host||3|2|RFK$|Host name or IP address of the host running SMTP server.|{0|}}
{30001002|XXparameter|smtp_server_host.display_name|smtp-server-host|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_host.keyword|smtp-server-host|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_port|25|1|2|FK$|SMTP server port.|{0|}}
{30001002|XXparameter|smtp_server_port.display_name|smtp-server-port|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_port.keyword|smtp-server-port|3|9|P|@{0|}}
{30001002|XXparameter|tcp_connect_timeout|1|1|2|FK$|TCP connection timeout.|{0|}}
{30001002|XXparameter|tcp_connect_timeout.display_name|tcp-connect-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_connect_timeout.keyword|tcp-connect-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_read_timeout|0|1|2|FK$|Timeout for reading from TCP buffer.|{0|}}
{30001002|XXparameter|tcp_read_timeout.display_name|tcp-read-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_read_timeout.keyword|tcp-read-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_write_timeout|0|1|2|FK$|Timeout for writing to TCP buffer.|{0|}}
{30001002|XXparameter|tcp_write_timeout.display_name|tcp-write-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_write_timeout.keyword|tcp-write-timeout|3|9|P|@{0|}}
{30001002|XXparameter|validate_addresses|True|13|1|FKl|Instructs component to validate syntax of addresses.|{0|}}
{30001002|XXparameter|validate_addresses.display_name|validate-addresses|3|9|P|@{0|}}
{30001002|XXparameter|validate_addresses.keyword|validate-addresses|3|9|P|@{0|}}
{30001002|XXparameter|on_address_error|Reject|15|1|FKl|What to do with the input record on address error|{3|Reject|Log|Ignore|}}
{30001002|XXparameter|on_address_error.display_name|on-address-error|3|9|P|@{0|}}
{30001002|XXparameter|on_address_error.keyword|on-address-error|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit|10|1|2|FK$|Number of attempts to re-establish connection dropped by server, per record.|{0|}}
{30001002|XXparameter|reconnect_limit.display_name|reconnect-limit|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit.keyword|reconnect-limit|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|debug|False|13|1|Fl|Enable debug mode|{0|}}
{30001002|XXparameter|debug_file_name|debug|3|2|FK$|Name of the debug file|{0|}}
{30001002|XXparameter|debug_file_name.display_name|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.keyword|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.condition|param debug True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|This component can be used in continuous flows graphs|{0|}}
{30001002|XXparameter|continuous.condition|version 2.15.5.r32:|3|15|P?|@{0|}}
{30001002|XXparameter|num_includes|1|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|include1|~ab_home/include/mail.dml|3|2|H$|DML types for sending mail|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|_message_t message "record
  envelope_t envelope;
  content_t content=NULL;
end"|3|2|H$|Metadata for records containing message information|{0|}}
{30001002|XXparameter|variable2|_server_log_t server_log "string('\\0')"|3|2|H$|Metadata for records containing server_log information|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|message::prepare_message(in)|3|2|H$|Prepare message information|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, server_log)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? publisher : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|simulate|False|13|1|FKl|Enables simulator|{0|}}
{30001002|XXparameter|simulate.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|simulator_mode|Playing|15|1|FKl|Simulator mode|{2|Recording|Playing|}}
{30001002|XXparameter|simulator_mode.condition|version 3.2.2.r15: param simulate True|3|15|P?|@{0|}}
{30001002|XXparameter|simulator_location||3|2|FK$|Simulator url|{0|}}
{30001002|XXparameter|simulator_location.condition|version 3.2.2.r15: param simulate True|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation7|optional request::prepare_request_for_simul(request, do_recording)|3|2|H$|Called to prepare a request for simulator|{0|}}
{30001002|XXparameter|operation8|optional response::prepare_response_for_simul(request, response, do_recording)|3|2|H$|Called to prepare a response for simulator|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375653|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Send Mail|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|121|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|122|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|123|0|330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|124|0|333|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|125|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|126|0|342|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|1364000|246000|0|0|0|0|5666|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|127|0|344|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|128|0|347|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|129|0|349|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|130|0|354|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|1357000|292000|0|0|0|0|5664|Trash-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|131|0|356|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|132|0|359|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|133|0|361|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|134|0|366|0|{@{}@0|0|0|0|in1|.6646216768916156|@@@13840|0|}}
{2010600005|XXGgraph|135|0|370|0|{Subgraph created from graph "melp_cag_rollup_gtp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ PASS == "1" ]|3|9|F||{0|}}
}}@0|@427000|72500|0|0|0|0|6033|Prepare report and send mail Pass 1|ndeotars|Created 7/31/2017 9:28:05 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1319000|500000|3|}}
{2010240003|XXGlegend|136|0|372|0|{@{}@Get ctrx count details|16000|197000|0|0|0|0|5814|}}
{2010242002|XXGface|137|0|374|0|{@{}@Arial|16711680|120|0|}}
{2010210004|XXGflow|138|0|376|0|{@{}@384|.5|.5|{0|}6067|17|}}
{2010210004|XXGflow|139|0|378|0|{@{}@384|.5|.5|{0|}6068|17|}}
{2010210004|XXGflow|140|0|380|0|{@{}@384|.5|.5|{0|}6069|17|}}
{2010210004|XXGflow|141|0|382|0|{@{}@384|.5|.5|{0|}5831|17|}}
{2010210004|XXGflow|142|0|384|0|{@{}@384|.5|.5|{0|}5830|17|}}
{2010210004|XXGflow|143|0|386|0|{@{}@384|.5|.5|{0|}6064|17|}}
{2010243001|XXGwatcher|144|0|388|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|145|0|390|0|{@{}@384|.5|.5|{0|}6072|17|}}
{2010210004|XXGflow|146|0|392|0|{@{}@384|.5|.5|{0|}6073|17|}}
{2010210004|XXGflow|147|0|394|0|{@{}@384|.5|.5|{0|}5806|17|}}
{2010210004|XXGflow|148|0|396|0|{@{}@384|.5|.5|{0|}5821|17|}}
{2010210004|XXGflow|149|0|398|0|{@{}@384|.5|.5|{0|}6065|17|}}
{2010210004|XXGflow|150|0|400|0|{@{}@384|.5|.5|{0|}5781|17|}}
{2010210004|XXGflow|151|0|402|0|{@{}@384|.5|.5|{0|}5795|17|}}
{2010501005|XXGpvertex|152|0|404|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Concatenate|386000|208000|0|0|0|0|5785|Concatenate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|153|0|406|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|154|0|409|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|155|0|413|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|156|0|415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|157|0|418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|158|0|421|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/rcmelp_audit.html", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/rcmelp_audit.html|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@780000|323000|0|0|0|0|5796|Output File|Ab Initio Software|@1|100|-1||6||131329|-1|-1|}}
{2010202004|XXGiport|159|0|423|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|160|0|426|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|161|0|428|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|162|0|431|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let string(int) body="";



let int __no_aggregation_fields__ = allocate();

type temporary_type =
record
end;

record
  int __no_aggregation_fields__ = 0;
end temp :: initialize(in) =
begin
end;

out :: rollup(temp, in) =
begin
let decimal("") seq_no = next_in_sequence() - 1 ;
let string("") color  = if( seq_no == 0 ) "BGCOLOR=#85aee5" else "BGCOLOR=#f2f6fc";
let string("") success_bg_color = "BGCOLOR=#2bbf3d";
let string("") failure_bg_color = "BGCOLOR=#ef6353";

body=body + "<tr " + color + ">" 
        + "<td align=center >" + (if(seq_no!=0) seq_no else in.seq_no)+ "</td>"
        + "<td align=center >" + in.table_name                        + "</td>"
        + "<td align=center >" + in.source                            + "</td>"
        + "<td align=center >" + (string(""))  in.rxclaim_count       + "</td>"
        + "<td align=center >" + (string(""))  in.ids_raw_count_today       + "</td>"
        + "<td align=center >" + (string(""))  in.ids_raw_count_tomorrow  + "</td>"
        
        + if ( in.status == "Success")  "<td align=center " + success_bg_color + ">" + in.status + "</td>"
     else if( in.status == "Failure")   "<td align=center " + failure_bg_color + ">" + in.status + "</td>"
     else  "<td align=center >" + in.status + "</td>"
+"</tr>";

end;

out :: finalize(temp, in) =
begin

 


out.body :: "<br><br>Please find below extraction details,<br><br>" +
" <table style='width:50%' align='left' border='1' cellspacing=0 cellpadding=0 > " 
+  body 
+ "</table>" +"<br><br>" ;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|record
string(int) body;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|642000|180000|0|0|0|0|6066|Convert to HTML|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|163|0|433|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|164|0|436|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|165|0|438|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|166|0|440|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|167|0|442|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|168|0|445|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|169|0|447|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|170|0|450|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|171|0|453|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|172|0|456|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|173|0|459|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|174|0|463|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = 
begin
  out.seq_no                    :: "Sr. No"             ;
  out.table_name                :: "Table Name"         ;       
  out.source                    :: "Source"             ;
  out.rxclaim_count             :: "RxClaim Count"      ;
  out.ids_raw_count_today       :: "IDS Raw Count"      ;
  out.ids_raw_count_tomorrow    :: "IDS Raw Count Tomorrow";
  out.status                    :: "Status"             ;
  
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
        string("~")   seq_no                                            ;
        string("~")   table_name                                        ;
        string("~")   source                                            ;
        decimal("~",grouping="3",grouping_sep = ",") rxclaim_count    = "-"    ;
        decimal("~",grouping="3",grouping_sep = ",") ids_raw_count_today    = "-"    ;
        decimal("~",grouping="3",grouping_sep = ",") ids_raw_count_tomorrow  =  "-";
        string("\\n")  status   =""              ;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|72000|66000|0|0|0|0|5769|Create Header|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|175|0|465|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|176|0|468|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|177|0|470|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|178|0|472|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|179|0|474|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|180|0|477|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|181|0|480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|182|0|489|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|table_name member [vector "RCMELP","RCMBRP"]|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|112000|338000|0|0|0|0|6074|FBE: Select RCMELP & RCMBRP|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|183|0|491|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|184|0|494|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|185|0|496|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|186|0|498|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|187|0|500|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|188|0|502|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|189|0|505|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|190|0|507|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|191|0|510|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|192|0|513|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|193|0|516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|194|0|519|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|195|0|522|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|196|0|530|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|next_in_sequence() > 1;|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|327000|365000|0|0|0|0|5822|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|197|0|532|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|198|0|535|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|199|0|537|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|200|0|539|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|201|0|541|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|202|0|543|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|203|0|546|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|204|0|548|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|205|0|551|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|206|0|554|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|207|0|557|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|208|0|560|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|209|0|563|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|210|0|566|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/audit_mbr_1.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/audit_mbr_1.dat|3|2|$|@{0|}}
}}@0|@671000|386000|0|0|0|0|5829|audit report file|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|211|0|568|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|212|0|571|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|213|0|573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|214|0|576|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|/*record
string("\|") record_type;
if (record_type == "MBR_ELIG_RXCLAIM_TO_IDS")
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") RxClaim_Count;
string("\|") ids_raw_Count;
string("\|") ids_raw_Count_tomorrow;
string("\\n") status;
end MBR_ELIG_RXCLAIM_TO_IDS;
end*/

record
string("\|") record_type;
if (record_type == "MBR_ELIG_RXCLAIM_TO_IDS")
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") RxClaim_Count;
string("\|") ids_raw_Count;
string("\|") ids_raw_Count_tomorrow;
string("\\n") status;
end MBR_ELIG_RXCLAIM_TO_IDS;
 
if (record_type == "MBR_ELIG_IDS_TO_CPP" )
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") ids_raw_Count;
string("\|") filter_count;
string("\|") update_count;
string("\|") insert_count;
string("\\n") status;
end MBR_ELIG_IDS_TO_CPP;
 
if (record_type == "CLAIM_RXCLAIM_TO_IDS")
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") submit_date;
string("\|") RxClaim_Count;
string("\|") ids_raw_Count;
string("\|") ids_unique_Count;
string("\|") ilm_raw_Count;
string("\\n") status;
end CLAIM_RXCLAIM_TO_IDS;
 
if (record_type == "CLAIM_IDS_TO_CPP" )
record
string("\|") Extraction_Dt;
string("\|") TableName;
string("\|") Source;
string("\|") ids_raw_Count;
string("\|") map_filter_Count;
string("\|") ids_filter_count;
string("\|") update_count;
string("\|") insert_count;
string("\\n") status;
end CLAIM_IDS_TO_CPP;
 
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =

begin

  out.record_type::"MBR_ELIG_RXCLAIM_TO_IDS";
  out.MBR_ELIG_RXCLAIM_TO_IDS.Extraction_Dt :: ( string(""))(date("YYYYMMDD")) (today() );
  out.MBR_ELIG_RXCLAIM_TO_IDS.TableName :: in.table_name;
  out.MBR_ELIG_RXCLAIM_TO_IDS.Source :: in.source;
  out.MBR_ELIG_RXCLAIM_TO_IDS.RxClaim_Count :: in.rxclaim_count;
  out.MBR_ELIG_RXCLAIM_TO_IDS.ids_raw_Count :1: in.ids_raw_count_today;
  out.MBR_ELIG_RXCLAIM_TO_IDS.ids_raw_Count_tomorrow :: in.ids_raw_count_tomorrow;
  out.MBR_ELIG_RXCLAIM_TO_IDS.status :: in.status;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|510000|360000|0|0|0|0|5832|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|215|0|578|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|216|0|581|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|217|0|583|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|218|0|585|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|219|0|587|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|220|0|590|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|221|0|592|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|222|0|596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|223|0|599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|224|0|602|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|225|0|605|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|226|0|616|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin

        out.seq_no :: "";
        out.table_name          :: if(in.ids_nm=="ids_common.d_member_eligibility")"RCMELP" else if(in.ids_nm=="ids_common.d_member")"RCMBRP" else "-" ;/*string_upcase(string_split(in.table,"_")[1]);*/
        out.source              :: string_upcase(in.src_nm);
        out.rxclaim_count        :: in.all_get_count; 
        out.ids_raw_count_today  :: in.all_get_count;
        out.ids_raw_count_tomorrow  :: 0 ; 
        out.status               ::  "Success"; 


end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|46000|221000|0|0|0|0|6071|RFMT: Audit|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|227|0|618|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|228|0|621|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|229|0|623|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|230|0|625|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|231|0|627|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|232|0|629|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|233|0|631|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|234|0|635|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|235|0|638|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|236|0|641|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|237|0|644|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|238|0|652|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|824000|210000|0|0|0|0|2090|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|239|0|654|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|240|0|658|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|241|0|661|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|242|0|663|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|243|0|666|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|244|0|672|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|529000|210000|0|0|0|0|5747|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|245|0|674|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|246|0|678|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|247|0|681|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|248|0|683|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|249|0|686|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|250|0|692|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/Mail/Send_Mail.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|include "~$AB_HOME/include/mail.dml";

message :: prepare_message(in) =
begin


  let envelope_t e;
  let disposition_t d;
  let header_t h;
  let content_t c;
 
  

  let text_message_t message = allocate();
  let to_list = string_split('$\{TO_EMAIL_LIST\}', ",");
  let string("") email_subject =  "Extraction Details ( rcmelp & rcmbrp ) : " + (string(""))(date("YYYY-MM-DD"))now();
  message.to = for ( let int i, i<length_of(to_list)) : [record e_mail_address to_list[i]];
  message.from.e_mail_address = '$\{FROM_EMAIL_ADDRESS\}';
  message.from.readable_name = '$\{FROM_EMAIL_ADDRESS\}';
  message.subject = email_subject;
  message.text =  "Hi All," + in.body + "<br><br><br><br><br><br><br><br> <i>This is system generated email.</i>"; 


   
  if (is_defined(message))
    begin
      e= create_envelope_using_text_message(message);
      d = create_disposition("", NULL);
      h = create_header("text", "html", NULL, "q", NULL, NULL, d, NULL, NULL);
      c = create_content_with_text(h, message.text);
    end;
 
  message :: create_message(e, c); 
end;|3|3|c|@{0|}}
{30001002|XXparameter|smtp_server_host|localhost|3|2|$|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Send Mail|1075000|187000|0|0|0|0|6070|Send Mail|Ab Initio Software|Built-in 2.15.0.r10:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|251|0|694|0|{@{}@0|0|0|0|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|252|0|696|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|253|0|699|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|254|0|702|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|255|0|704|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|256|0|707|0|{Send Mail component provides control over low-level details of sending an email message.  For most applications, the SEND MESSAGE and SEND MULTIPLE MESSAGES components provide all of the functionality that is required and they are much simpler to use.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|send-mail|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/send-mail|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16.0.r2:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16.0.r2:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_host||3|2|RFK$|Host name or IP address of the host running SMTP server.|{0|}}
{30001002|XXparameter|smtp_server_host.display_name|smtp-server-host|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_host.keyword|smtp-server-host|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_port|25|1|2|FK$|SMTP server port.|{0|}}
{30001002|XXparameter|smtp_server_port.display_name|smtp-server-port|3|9|P|@{0|}}
{30001002|XXparameter|smtp_server_port.keyword|smtp-server-port|3|9|P|@{0|}}
{30001002|XXparameter|tcp_connect_timeout|1|1|2|FK$|TCP connection timeout.|{0|}}
{30001002|XXparameter|tcp_connect_timeout.display_name|tcp-connect-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_connect_timeout.keyword|tcp-connect-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_read_timeout|0|1|2|FK$|Timeout for reading from TCP buffer.|{0|}}
{30001002|XXparameter|tcp_read_timeout.display_name|tcp-read-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_read_timeout.keyword|tcp-read-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_write_timeout|0|1|2|FK$|Timeout for writing to TCP buffer.|{0|}}
{30001002|XXparameter|tcp_write_timeout.display_name|tcp-write-timeout|3|9|P|@{0|}}
{30001002|XXparameter|tcp_write_timeout.keyword|tcp-write-timeout|3|9|P|@{0|}}
{30001002|XXparameter|validate_addresses|True|13|1|FKl|Instructs component to validate syntax of addresses.|{0|}}
{30001002|XXparameter|validate_addresses.display_name|validate-addresses|3|9|P|@{0|}}
{30001002|XXparameter|validate_addresses.keyword|validate-addresses|3|9|P|@{0|}}
{30001002|XXparameter|on_address_error|Reject|15|1|FKl|What to do with the input record on address error|{3|Reject|Log|Ignore|}}
{30001002|XXparameter|on_address_error.display_name|on-address-error|3|9|P|@{0|}}
{30001002|XXparameter|on_address_error.keyword|on-address-error|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit|10|1|2|FK$|Number of attempts to re-establish connection dropped by server, per record.|{0|}}
{30001002|XXparameter|reconnect_limit.display_name|reconnect-limit|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit.keyword|reconnect-limit|3|9|P|@{0|}}
{30001002|XXparameter|reconnect_limit.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|debug|False|13|1|Fl|Enable debug mode|{0|}}
{30001002|XXparameter|debug_file_name|debug|3|2|FK$|Name of the debug file|{0|}}
{30001002|XXparameter|debug_file_name.display_name|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.keyword|debug-file-name|3|9|P|@{0|}}
{30001002|XXparameter|debug_file_name.condition|param debug True|3|15|P?|@{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|This component can be used in continuous flows graphs|{0|}}
{30001002|XXparameter|continuous.condition|version 2.15.5.r32:|3|15|P?|@{0|}}
{30001002|XXparameter|num_includes|1|1|2|H$|Number of includes in package|{0|}}
{30001002|XXparameter|include1|~ab_home/include/mail.dml|3|2|H$|DML types for sending mail|{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|_message_t message "record
  envelope_t envelope;
  content_t content=NULL;
end"|3|2|H$|Metadata for records containing message information|{0|}}
{30001002|XXparameter|variable2|_server_log_t server_log "string('\\0')"|3|2|H$|Metadata for records containing server_log information|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|message::prepare_message(in)|3|2|H$|Prepare message information|{0|}}
{30001002|XXparameter|operation2|out::create_output(in, server_log)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? publisher : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|simulate|False|13|1|FKl|Enables simulator|{0|}}
{30001002|XXparameter|simulate.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|simulator_mode|Playing|15|1|FKl|Simulator mode|{2|Recording|Playing|}}
{30001002|XXparameter|simulator_mode.condition|version 3.2.2.r15: param simulate True|3|15|P?|@{0|}}
{30001002|XXparameter|simulator_location||3|2|FK$|Simulator url|{0|}}
{30001002|XXparameter|simulator_location.condition|version 3.2.2.r15: param simulate True|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation7|optional request::prepare_request_for_simul(request, do_recording)|3|2|H$|Called to prepare a request for simulator|{0|}}
{30001002|XXparameter|operation8|optional response::prepare_response_for_simul(request, response, do_recording)|3|2|H$|Called to prepare a response for simulator|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375653|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Send Mail|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|257|0|709|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2064|0|}}
{2010203004|XXGoport|258|0|712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|259|0|715|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|260|0|718|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|261|0|721|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|262|0|727|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|992000|327000|0|0|0|0|5652|Trash-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|263|0|729|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|264|0|732|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|265|0|734|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|266|0|739|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|1221000|286000|0|0|0|0|5659|Trash-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|267|0|741|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|268|0|744|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|269|0|746|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|270|0|752|0|{@{}@0|0|0|0|in0|.608|@@@13840|0|}}
{2010110002|XXGconstant|271|0|757|0|{@{}@{1|2739162|}}}
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
{2010601001|XXGgraph_vertex_vertex|10|0|20|0|{Prepare_report_and_send_mail_Pass2_1|}1|11|}
{2010605001|XXGgraph_legend_legend|11|0|22|0|{0|}11|12|}
{2010241001|XXGlegend_face_face|12|0|24|0|{}12|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_11|}11|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_12|}11|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_13|}11|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_14|}11|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_15|}11|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_16|}11|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_2|}11|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_3|}11|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_5|}11|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_6|}11|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_8|}11|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_9|}11|25|}
{2010601001|XXGgraph_vertex_vertex|25|0|50|0|{Concatenate_1|}11|26|}
{2010212001|XXGvertex_oport_oport|26|0|52|0|{0|out|}26|27|}
{2010213001|XXGoport_dst_flow|27|0|54|0|{0|}27|14|}
{2010211001|XXGvertex_iport_iport|28|0|55|0|{0|in|}26|28|}
{2010214001|XXGiport_src_flow|29|0|57|0|{0|}28|24|}
{2010214001|XXGiport_src_flow|30|0|58|0|{1|}28|21|}
{2010007001|XXGobject_proto_object|31|0|59|0|{}26|29|}
{2010212001|XXGvertex_oport_oport|32|0|61|0|{0|out|}29|30|}
{2010006001|XXGobject_psameas_object|33|0|63|0|{metadata|out_metadata|1|0|}30|29|}
{2010211001|XXGvertex_iport_iport|34|0|64|0|{0|in|}29|31|}
{2010006001|XXGobject_psameas_object|35|0|66|0|{metadata|in_metadata|1|0|}31|29|}
{2010006001|XXGobject_psameas_object|36|0|67|0|{Layout|Layout|0|0|}26|32|}
{2010211001|XXGvertex_iport_iport|37|0|69|0|{0|write|}32|33|}
{2010214001|XXGiport_src_flow|38|0|71|0|{0|}33|20|}
{2010007001|XXGobject_proto_object|39|0|72|0|{}32|34|}
{2010211001|XXGvertex_iport_iport|40|0|74|0|{0|write|}34|35|}
{2010006001|XXGobject_psameas_object|41|0|76|0|{metadata|write_metadata|1|0|}35|34|}
{2010006001|XXGobject_psameas_object|42|0|77|0|{in_metadata|out_metadata|0|0|}26|36|}
{2010212001|XXGvertex_oport_oport|43|0|79|0|{0|out|}36|37|}
{2010213001|XXGoport_dst_flow|44|0|81|0|{0|}37|24|}
{2010212001|XXGvertex_oport_oport|45|0|82|0|{1|error|}36|38|}
{2010212001|XXGvertex_oport_oport|46|0|84|0|{2|log|}36|39|}
{2010007001|XXGobject_proto_object|47|0|86|0|{}36|40|}
{2010212001|XXGvertex_oport_oport|48|0|88|0|{0|out|}40|41|}
{2010006001|XXGobject_psameas_object|49|0|90|0|{metadata|out_metadata|1|0|}41|40|}
{2010212001|XXGvertex_oport_oport|50|0|91|0|{1|error|}40|42|}
{2010006001|XXGobject_psameas_object|51|0|93|0|{metadata|error_metadata|1|0|}42|40|}
{2010212001|XXGvertex_oport_oport|52|0|94|0|{2|log|}40|43|}
{2010006001|XXGobject_psameas_object|53|0|96|0|{metadata|log_metadata|1|0|}43|40|}
{2010006001|XXGobject_psameas_object|54|0|97|0|{Layout|Layout|0|0|}36|32|}
{2010006001|XXGobject_psameas_object|55|0|98|0|{out_metadata|out_metadata|0|0|}26|36|}
{2010601001|XXGgraph_vertex_vertex|56|0|99|0|{Convert_to_HTML|}11|44|}
{2010212001|XXGvertex_oport_oport|57|0|101|0|{0|out|}44|45|}
{2010213001|XXGoport_dst_flow|58|0|103|0|{0|}45|25|}
{2010212001|XXGvertex_oport_oport|59|0|104|0|{1|reject|}44|46|}
{2010212001|XXGvertex_oport_oport|60|0|106|0|{2|error|}44|47|}
{2010212001|XXGvertex_oport_oport|61|0|108|0|{3|log|}44|48|}
{2010211001|XXGvertex_iport_iport|62|0|110|0|{0|in|}44|49|}
{2010214001|XXGiport_src_flow|63|0|112|0|{0|}49|14|}
{2010007001|XXGobject_proto_object|64|0|113|0|{}44|50|}
{2010212001|XXGvertex_oport_oport|65|0|115|0|{0|out|}50|51|}
{2010006001|XXGobject_psameas_object|66|0|117|0|{metadata|out_metadata|1|0|}51|50|}
{2010212001|XXGvertex_oport_oport|67|0|118|0|{1|reject|}50|52|}
{2010006001|XXGobject_psameas_object|68|0|120|0|{metadata|reject_metadata|1|0|}52|50|}
{2010212001|XXGvertex_oport_oport|69|0|121|0|{2|error|}50|53|}
{2010006001|XXGobject_psameas_object|70|0|123|0|{metadata|error_metadata|1|0|}53|50|}
{2010212001|XXGvertex_oport_oport|71|0|124|0|{3|log|}50|54|}
{2010006001|XXGobject_psameas_object|72|0|126|0|{metadata|log_metadata|1|0|}54|50|}
{2010211001|XXGvertex_iport_iport|73|0|127|0|{0|in|}50|55|}
{2010006001|XXGobject_psameas_object|74|0|129|0|{metadata|in_metadata|1|0|}55|50|}
{2010006001|XXGobject_psameas_object|75|0|130|0|{Layout|Layout|0|0|}44|32|}
{2010006001|XXGobject_psameas_object|76|0|131|0|{in_metadata|out_metadata|0|0|}44|36|}
{2010006001|XXGobject_psameas_object|77|0|132|0|{reject_metadata|out_metadata|0|0|}44|36|}
{2010601001|XXGgraph_vertex_vertex|78|0|133|0|{Create_header|}11|36|}
{2010601001|XXGgraph_vertex_vertex|79|0|134|0|{Filter_by_Expression|}11|56|}
{2010212001|XXGvertex_oport_oport|80|0|136|0|{0|out|}56|57|}
{2010213001|XXGoport_dst_flow|81|0|138|0|{0|}57|19|}
{2010212001|XXGvertex_oport_oport|82|0|139|0|{1|deselect|}56|58|}
{2010212001|XXGvertex_oport_oport|83|0|141|0|{2|reject|}56|59|}
{2010212001|XXGvertex_oport_oport|84|0|143|0|{3|error|}56|60|}
{2010212001|XXGvertex_oport_oport|85|0|145|0|{4|log|}56|61|}
{2010211001|XXGvertex_iport_iport|86|0|147|0|{0|in|}56|62|}
{2010214001|XXGiport_src_flow|87|0|149|0|{0|}62|22|}
{2010007001|XXGobject_proto_object|88|0|150|0|{}56|63|}
{2010212001|XXGvertex_oport_oport|89|0|152|0|{0|out|}63|64|}
{2010006001|XXGobject_psameas_object|90|0|154|0|{metadata|out_metadata|1|0|}64|63|}
{2010212001|XXGvertex_oport_oport|91|0|155|0|{1|deselect|}63|65|}
{2010006001|XXGobject_psameas_object|92|0|157|0|{metadata|deselect_metadata|1|0|}65|63|}
{2010212001|XXGvertex_oport_oport|93|0|158|0|{2|reject|}63|66|}
{2010006001|XXGobject_psameas_object|94|0|160|0|{metadata|reject_metadata|1|0|}66|63|}
{2010212001|XXGvertex_oport_oport|95|0|161|0|{3|error|}63|67|}
{2010006001|XXGobject_psameas_object|96|0|163|0|{metadata|error_metadata|1|0|}67|63|}
{2010212001|XXGvertex_oport_oport|97|0|164|0|{4|log|}63|68|}
{2010006001|XXGobject_psameas_object|98|0|166|0|{metadata|log_metadata|1|0|}68|63|}
{2010211001|XXGvertex_iport_iport|99|0|167|0|{0|in|}63|69|}
{2010006001|XXGobject_psameas_object|100|0|169|0|{metadata|in_metadata|1|0|}69|63|}
{2010006001|XXGobject_psameas_object|101|0|170|0|{Layout|Layout|0|0|}56|70|}
{2010211001|XXGvertex_iport_iport|102|0|172|0|{0|write|}70|71|}
{2010214001|XXGiport_src_flow|103|0|174|0|{0|}71|17|}
{2010007001|XXGobject_proto_object|104|0|175|0|{}70|72|}
{2010211001|XXGvertex_iport_iport|105|0|177|0|{0|write|}72|73|}
{2010006001|XXGobject_psameas_object|106|0|179|0|{metadata|write_metadata|1|0|}73|72|}
{2010006001|XXGobject_psameas_object|107|0|180|0|{write_metadata|out0_metadata|0|0|}70|74|}
{2010212001|XXGvertex_oport_oport|108|0|182|0|{0|out0|}74|75|}
{2010213001|XXGoport_dst_flow|109|0|184|0|{0|}75|17|}
{2010212001|XXGvertex_oport_oport|110|0|185|0|{1|reject0|}74|76|}
{2010212001|XXGvertex_oport_oport|111|0|187|0|{2|error0|}74|77|}
{2010212001|XXGvertex_oport_oport|112|0|189|0|{3|log|}74|78|}
{2010211001|XXGvertex_iport_iport|113|0|191|0|{0|in|}74|79|}
{2010214001|XXGiport_src_flow|114|0|193|0|{0|}79|18|}
{2010007001|XXGobject_proto_object|115|0|194|0|{}74|80|}
{2010212001|XXGvertex_oport_oport|116|0|196|0|{0|out0|}80|81|}
{2010006001|XXGobject_psameas_object|117|0|198|0|{metadata|out0_metadata|1|0|}81|80|}
{2010006001|XXGobject_psameas_object|118|0|199|0|{transform0|transform0|1|0|}81|80|}
{2010212001|XXGvertex_oport_oport|119|0|200|0|{1|reject0|}80|82|}
{2010006001|XXGobject_psameas_object|120|0|202|0|{metadata|reject0_metadata|1|0|}82|80|}
{2010212001|XXGvertex_oport_oport|121|0|203|0|{2|error0|}80|83|}
{2010006001|XXGobject_psameas_object|122|0|205|0|{metadata|error0_metadata|1|0|}83|80|}
{2010212001|XXGvertex_oport_oport|123|0|206|0|{3|log|}80|84|}
{2010006001|XXGobject_psameas_object|124|0|208|0|{metadata|log_metadata|1|0|}84|80|}
{2010211001|XXGvertex_iport_iport|125|0|209|0|{0|in|}80|85|}
{2010006001|XXGobject_psameas_object|126|0|211|0|{metadata|in_metadata|1|0|}85|80|}
{2010006001|XXGobject_psameas_object|127|0|212|0|{Layout|Layout|0|0|}74|70|}
{2010006001|XXGobject_psameas_object|128|0|213|0|{in_metadata|out0_metadata|0|0|}74|86|}
{2010212001|XXGvertex_oport_oport|129|0|215|0|{0|out0|}86|87|}
{2010213001|XXGoport_dst_flow|130|0|217|0|{0|}87|22|}
{2010212001|XXGvertex_oport_oport|131|0|218|0|{1|reject0|}86|88|}
{2010212001|XXGvertex_oport_oport|132|0|220|0|{2|error0|}86|89|}
{2010212001|XXGvertex_oport_oport|133|0|222|0|{3|log|}86|90|}
{2010211001|XXGvertex_iport_iport|134|0|224|0|{0|in|}86|91|}
{2010007001|XXGobject_proto_object|135|0|226|0|{}86|92|}
{2010212001|XXGvertex_oport_oport|136|0|228|0|{0|out0|}92|93|}
{2010006001|XXGobject_psameas_object|137|0|230|0|{metadata|out0_metadata|1|0|}93|92|}
{2010006001|XXGobject_psameas_object|138|0|231|0|{transform0|transform0|1|0|}93|92|}
{2010212001|XXGvertex_oport_oport|139|0|232|0|{1|reject0|}92|94|}
{2010006001|XXGobject_psameas_object|140|0|234|0|{metadata|reject0_metadata|1|0|}94|92|}
{2010212001|XXGvertex_oport_oport|141|0|235|0|{2|error0|}92|95|}
{2010006001|XXGobject_psameas_object|142|0|237|0|{metadata|error0_metadata|1|0|}95|92|}
{2010212001|XXGvertex_oport_oport|143|0|238|0|{3|log|}92|96|}
{2010006001|XXGobject_psameas_object|144|0|240|0|{metadata|log_metadata|1|0|}96|92|}
{2010211001|XXGvertex_iport_iport|145|0|241|0|{0|in|}92|97|}
{2010006001|XXGobject_psameas_object|146|0|243|0|{metadata|in_metadata|1|0|}97|92|}
{2010006001|XXGobject_psameas_object|147|0|244|0|{Layout|Layout|0|0|}86|70|}
{2010006001|XXGobject_psameas_object|148|0|245|0|{in_metadata|read_metadata|0|0|}86|98|}
{2010212001|XXGvertex_oport_oport|149|0|247|0|{0|read|}98|99|}
{2010213001|XXGoport_dst_flow|150|0|249|0|{0|}99|10|}
{2010213001|XXGoport_dst_flow|151|0|250|0|{1|}99|9|}
{2010007001|XXGobject_proto_object|152|0|251|0|{}98|100|}
{2010212001|XXGvertex_oport_oport|153|0|253|0|{0|read|}100|101|}
{2010006001|XXGobject_psameas_object|154|0|255|0|{metadata|read_metadata|1|0|}101|100|}
{2010006001|XXGobject_psameas_object|155|0|256|0|{reject0_metadata|read_metadata|0|0|}86|98|}
{2010006001|XXGobject_psameas_object|156|0|257|0|{reject0_metadata|out0_metadata|0|0|}74|86|}
{2010006001|XXGobject_psameas_object|157|0|258|0|{deselect_metadata|out0_metadata|0|0|}56|86|}
{2010006001|XXGobject_psameas_object|158|0|259|0|{in_metadata|out0_metadata|0|0|}56|86|}
{2010006001|XXGobject_psameas_object|159|0|260|0|{out_metadata|out0_metadata|0|0|}56|86|}
{2010006001|XXGobject_psameas_object|160|0|261|0|{reject_metadata|out0_metadata|0|0|}56|86|}
{2010601001|XXGgraph_vertex_vertex|161|0|262|0|{Output_File|}11|32|}
{2010601001|XXGgraph_vertex_vertex|162|0|263|0|{Output_File_1|}11|70|}
{2010601001|XXGgraph_vertex_vertex|163|0|264|0|{RFMT_Audit|}11|86|}
{2010601001|XXGgraph_vertex_vertex|164|0|265|0|{Reformat_1|}11|74|}
{2010601001|XXGgraph_vertex_vertex|165|0|266|0|{Replicate|}11|102|}
{2010212001|XXGvertex_oport_oport|166|0|268|0|{0|out|}102|103|}
{2010213001|XXGoport_dst_flow|167|0|270|0|{0|}103|23|}
{2010213001|XXGoport_dst_flow|168|0|271|0|{1|}103|20|}
{2010211001|XXGvertex_iport_iport|169|0|272|0|{0|in|}102|104|}
{2010214001|XXGiport_src_flow|170|0|274|0|{0|}104|25|}
{2010007001|XXGobject_proto_object|171|0|275|0|{}102|105|}
{2010212001|XXGvertex_oport_oport|172|0|277|0|{0|out|}105|106|}
{2010006001|XXGobject_psameas_object|173|0|279|0|{metadata|out_metadata|1|0|}106|105|}
{2010211001|XXGvertex_iport_iport|174|0|280|0|{0|in|}105|107|}
{2010006001|XXGobject_psameas_object|175|0|282|0|{metadata|in_metadata|1|0|}107|105|}
{2010006001|XXGobject_psameas_object|176|0|283|0|{Layout|Layout|0|0|}102|32|}
{2010006001|XXGobject_psameas_object|177|0|284|0|{in_metadata|out_metadata|0|0|}102|44|}
{2010006001|XXGobject_psameas_object|178|0|285|0|{out_metadata|out_metadata|0|0|}102|44|}
{2010601001|XXGgraph_vertex_vertex|179|0|286|0|{Replicate_1|}11|108|}
{2010212001|XXGvertex_oport_oport|180|0|288|0|{0|out|}108|109|}
{2010213001|XXGoport_dst_flow|181|0|290|0|{0|}109|21|}
{2010213001|XXGoport_dst_flow|182|0|291|0|{1|}109|18|}
{2010211001|XXGvertex_iport_iport|183|0|292|0|{0|in|}108|110|}
{2010214001|XXGiport_src_flow|184|0|294|0|{0|}110|19|}
{2010007001|XXGobject_proto_object|185|0|295|0|{}108|111|}
{2010212001|XXGvertex_oport_oport|186|0|297|0|{0|out|}111|112|}
{2010006001|XXGobject_psameas_object|187|0|299|0|{metadata|out_metadata|1|0|}112|111|}
{2010211001|XXGvertex_iport_iport|188|0|300|0|{0|in|}111|113|}
{2010006001|XXGobject_psameas_object|189|0|302|0|{metadata|in_metadata|1|0|}113|111|}
{2010006001|XXGobject_psameas_object|190|0|303|0|{Layout|Layout|0|0|}108|70|}
{2010006001|XXGobject_psameas_object|191|0|304|0|{in_metadata|out0_metadata|0|0|}108|86|}
{2010006001|XXGobject_psameas_object|192|0|305|0|{out_metadata|out0_metadata|0|0|}108|86|}
{2010601001|XXGgraph_vertex_vertex|193|0|306|0|{Send_Mail_1|}11|114|}
{2010212001|XXGvertex_oport_oport|194|0|308|0|{0|out|}114|115|}
{2010212001|XXGvertex_oport_oport|195|0|310|0|{1|reject|}114|116|}
{2010213001|XXGoport_dst_flow|196|0|312|0|{0|}116|15|}
{2010212001|XXGvertex_oport_oport|197|0|313|0|{2|error|}114|117|}
{2010213001|XXGoport_dst_flow|198|0|315|0|{0|}117|16|}
{2010212001|XXGvertex_oport_oport|199|0|316|0|{3|log|}114|118|}
{2010211001|XXGvertex_iport_iport|200|0|318|0|{0|in|}114|119|}
{2010214001|XXGiport_src_flow|201|0|320|0|{0|}119|23|}
{2010007001|XXGobject_proto_object|202|0|321|0|{}114|120|}
{2010212001|XXGvertex_oport_oport|203|0|323|0|{0|out|}120|121|}
{2010006001|XXGobject_psameas_object|204|0|325|0|{metadata|out_metadata|1|0|}121|120|}
{2010212001|XXGvertex_oport_oport|205|0|326|0|{1|reject|}120|122|}
{2010006001|XXGobject_psameas_object|206|0|328|0|{metadata|reject_metadata|1|0|}122|120|}
{2010212001|XXGvertex_oport_oport|207|0|329|0|{2|error|}120|123|}
{2010006001|XXGobject_psameas_object|208|0|331|0|{metadata|error_metadata|1|0|}123|120|}
{2010212001|XXGvertex_oport_oport|209|0|332|0|{3|log|}120|124|}
{2010006001|XXGobject_psameas_object|210|0|334|0|{metadata|log_metadata|1|0|}124|120|}
{2010211001|XXGvertex_iport_iport|211|0|335|0|{0|in|}120|125|}
{2010006001|XXGobject_psameas_object|212|0|337|0|{metadata|in_metadata|1|0|}125|120|}
{2010006001|XXGobject_psameas_object|213|0|338|0|{Layout|Layout|0|0|}114|32|}
{2010006001|XXGobject_psameas_object|214|0|339|0|{in_metadata|out_metadata|0|0|}114|44|}
{2010006001|XXGobject_psameas_object|215|0|340|0|{reject_metadata|out_metadata|0|0|}114|44|}
{2010601001|XXGgraph_vertex_vertex|216|0|341|0|{Trash|}11|126|}
{2010211001|XXGvertex_iport_iport|217|0|343|0|{0|in|}126|127|}
{2010214001|XXGiport_src_flow|218|0|345|0|{0|}127|16|}
{2010007001|XXGobject_proto_object|219|0|346|0|{}126|128|}
{2010211001|XXGvertex_iport_iport|220|0|348|0|{0|in|}128|129|}
{2010006001|XXGobject_psameas_object|221|0|350|0|{metadata|in_metadata|1|0|}129|128|}
{2010006001|XXGobject_psameas_object|222|0|351|0|{Layout|Layout|0|0|}126|32|}
{2010006001|XXGobject_psameas_object|223|0|352|0|{in_metadata|error_metadata|0|0|}126|114|}
{2010601001|XXGgraph_vertex_vertex|224|0|353|0|{Trash_1|}11|130|}
{2010211001|XXGvertex_iport_iport|225|0|355|0|{0|in|}130|131|}
{2010214001|XXGiport_src_flow|226|0|357|0|{0|}131|15|}
{2010007001|XXGobject_proto_object|227|0|358|0|{}130|132|}
{2010211001|XXGvertex_iport_iport|228|0|360|0|{0|in|}132|133|}
{2010006001|XXGobject_psameas_object|229|0|362|0|{metadata|in_metadata|1|0|}133|132|}
{2010006001|XXGobject_psameas_object|230|0|363|0|{Layout|Layout|0|0|}130|32|}
{2010006001|XXGobject_psameas_object|231|0|364|0|{in_metadata|out_metadata|0|0|}130|44|}
{2010211001|XXGvertex_iport_iport|232|0|365|0|{0|in1|}11|134|}
{2010215002|XXGiport_binding_iport|233|0|367|0|{.5|.5|{0|}6006|}134|91|}
{2010214001|XXGiport_src_flow|234|0|368|0|{0|}134|9|}
{2010601001|XXGgraph_vertex_vertex|235|0|369|0|{Prepare_report_and_send_mail_Pass_1|}1|135|}
{2010605001|XXGgraph_legend_legend|236|0|371|0|{0|}135|136|}
{2010241001|XXGlegend_face_face|237|0|373|0|{}136|137|}
{2010604001|XXGgraph_flow_flow|238|0|375|0|{Flow_1|}135|138|}
{2010604001|XXGgraph_flow_flow|239|0|377|0|{Flow_10|}135|139|}
{2010604001|XXGgraph_flow_flow|240|0|379|0|{Flow_11|}135|140|}
{2010604001|XXGgraph_flow_flow|241|0|381|0|{Flow_12|}135|141|}
{2010604001|XXGgraph_flow_flow|242|0|383|0|{Flow_13|}135|142|}
{2010604001|XXGgraph_flow_flow|243|0|385|0|{Flow_2|}135|143|}
{2010244001|XXGflow_watcher_watcher|244|0|387|0|{}143|144|}
{2010604001|XXGgraph_flow_flow|245|0|389|0|{Flow_3|}135|145|}
{2010604001|XXGgraph_flow_flow|246|0|391|0|{Flow_4|}135|146|}
{2010604001|XXGgraph_flow_flow|247|0|393|0|{Flow_5|}135|147|}
{2010604001|XXGgraph_flow_flow|248|0|395|0|{Flow_6|}135|148|}
{2010604001|XXGgraph_flow_flow|249|0|397|0|{Flow_7|}135|149|}
{2010604001|XXGgraph_flow_flow|250|0|399|0|{Flow_8|}135|150|}
{2010604001|XXGgraph_flow_flow|251|0|401|0|{Flow_9|}135|151|}
{2010601001|XXGgraph_vertex_vertex|252|0|403|0|{Concatenate_1|}135|152|}
{2010212001|XXGvertex_oport_oport|253|0|405|0|{0|out|}152|153|}
{2010213001|XXGoport_dst_flow|254|0|407|0|{0|}153|147|}
{2010211001|XXGvertex_iport_iport|255|0|408|0|{0|in|}152|154|}
{2010214001|XXGiport_src_flow|256|0|410|0|{0|}154|150|}
{2010214001|XXGiport_src_flow|257|0|411|0|{1|}154|146|}
{2010007001|XXGobject_proto_object|258|0|412|0|{}152|155|}
{2010212001|XXGvertex_oport_oport|259|0|414|0|{0|out|}155|156|}
{2010006001|XXGobject_psameas_object|260|0|416|0|{metadata|out_metadata|1|0|}156|155|}
{2010211001|XXGvertex_iport_iport|261|0|417|0|{0|in|}155|157|}
{2010006001|XXGobject_psameas_object|262|0|419|0|{metadata|in_metadata|1|0|}157|155|}
{2010006001|XXGobject_psameas_object|263|0|420|0|{Layout|Layout|0|0|}152|158|}
{2010211001|XXGvertex_iport_iport|264|0|422|0|{0|write|}158|159|}
{2010214001|XXGiport_src_flow|265|0|424|0|{0|}159|151|}
{2010007001|XXGobject_proto_object|266|0|425|0|{}158|160|}
{2010211001|XXGvertex_iport_iport|267|0|427|0|{0|write|}160|161|}
{2010006001|XXGobject_psameas_object|268|0|429|0|{metadata|write_metadata|1|0|}161|160|}
{2010006001|XXGobject_psameas_object|269|0|430|0|{write_metadata|out_metadata|0|0|}158|162|}
{2010212001|XXGvertex_oport_oport|270|0|432|0|{0|out|}162|163|}
{2010213001|XXGoport_dst_flow|271|0|434|0|{0|}163|149|}
{2010212001|XXGvertex_oport_oport|272|0|435|0|{1|reject|}162|164|}
{2010212001|XXGvertex_oport_oport|273|0|437|0|{2|error|}162|165|}
{2010212001|XXGvertex_oport_oport|274|0|439|0|{3|log|}162|166|}
{2010211001|XXGvertex_iport_iport|275|0|441|0|{0|in|}162|167|}
{2010214001|XXGiport_src_flow|276|0|443|0|{0|}167|143|}
{2010007001|XXGobject_proto_object|277|0|444|0|{}162|168|}
{2010212001|XXGvertex_oport_oport|278|0|446|0|{0|out|}168|169|}
{2010006001|XXGobject_psameas_object|279|0|448|0|{metadata|out_metadata|1|0|}169|168|}
{2010212001|XXGvertex_oport_oport|280|0|449|0|{1|reject|}168|170|}
{2010006001|XXGobject_psameas_object|281|0|451|0|{metadata|reject_metadata|1|0|}170|168|}
{2010212001|XXGvertex_oport_oport|282|0|452|0|{2|error|}168|171|}
{2010006001|XXGobject_psameas_object|283|0|454|0|{metadata|error_metadata|1|0|}171|168|}
{2010212001|XXGvertex_oport_oport|284|0|455|0|{3|log|}168|172|}
{2010006001|XXGobject_psameas_object|285|0|457|0|{metadata|log_metadata|1|0|}172|168|}
{2010211001|XXGvertex_iport_iport|286|0|458|0|{0|in|}168|173|}
{2010006001|XXGobject_psameas_object|287|0|460|0|{metadata|in_metadata|1|0|}173|168|}
{2010006001|XXGobject_psameas_object|288|0|461|0|{Layout|Layout|0|0|}162|158|}
{2010006001|XXGobject_psameas_object|289|0|462|0|{in_metadata|out_metadata|0|0|}162|174|}
{2010212001|XXGvertex_oport_oport|290|0|464|0|{0|out|}174|175|}
{2010213001|XXGoport_dst_flow|291|0|466|0|{0|}175|150|}
{2010212001|XXGvertex_oport_oport|292|0|467|0|{1|error|}174|176|}
{2010212001|XXGvertex_oport_oport|293|0|469|0|{2|log|}174|177|}
{2010007001|XXGobject_proto_object|294|0|471|0|{}174|178|}
{2010212001|XXGvertex_oport_oport|295|0|473|0|{0|out|}178|179|}
{2010006001|XXGobject_psameas_object|296|0|475|0|{metadata|out_metadata|1|0|}179|178|}
{2010212001|XXGvertex_oport_oport|297|0|476|0|{1|error|}178|180|}
{2010006001|XXGobject_psameas_object|298|0|478|0|{metadata|error_metadata|1|0|}180|178|}
{2010212001|XXGvertex_oport_oport|299|0|479|0|{2|log|}178|181|}
{2010006001|XXGobject_psameas_object|300|0|481|0|{metadata|log_metadata|1|0|}181|178|}
{2010006001|XXGobject_psameas_object|301|0|482|0|{Layout|Layout|0|0|}174|158|}
{2010006001|XXGobject_psameas_object|302|0|483|0|{reject_metadata|out_metadata|0|0|}162|174|}
{2010006001|XXGobject_psameas_object|303|0|484|0|{in_metadata|out_metadata|0|0|}152|174|}
{2010006001|XXGobject_psameas_object|304|0|485|0|{out_metadata|out_metadata|0|0|}152|174|}
{2010601001|XXGgraph_vertex_vertex|305|0|486|0|{Convert_to_HTML|}135|162|}
{2010601001|XXGgraph_vertex_vertex|306|0|487|0|{Create_Header|}135|174|}
{2010601001|XXGgraph_vertex_vertex|307|0|488|0|{FBE_Select_RCMELP_RCMBRP|}135|182|}
{2010212001|XXGvertex_oport_oport|308|0|490|0|{0|out|}182|183|}
{2010213001|XXGoport_dst_flow|309|0|492|0|{0|}183|146|}
{2010212001|XXGvertex_oport_oport|310|0|493|0|{1|deselect|}182|184|}
{2010212001|XXGvertex_oport_oport|311|0|495|0|{2|reject|}182|185|}
{2010212001|XXGvertex_oport_oport|312|0|497|0|{3|error|}182|186|}
{2010212001|XXGvertex_oport_oport|313|0|499|0|{4|log|}182|187|}
{2010211001|XXGvertex_iport_iport|314|0|501|0|{0|in|}182|188|}
{2010214001|XXGiport_src_flow|315|0|503|0|{0|}188|145|}
{2010007001|XXGobject_proto_object|316|0|504|0|{}182|189|}
{2010212001|XXGvertex_oport_oport|317|0|506|0|{0|out|}189|190|}
{2010006001|XXGobject_psameas_object|318|0|508|0|{metadata|out_metadata|1|0|}190|189|}
{2010212001|XXGvertex_oport_oport|319|0|509|0|{1|deselect|}189|191|}
{2010006001|XXGobject_psameas_object|320|0|511|0|{metadata|deselect_metadata|1|0|}191|189|}
{2010212001|XXGvertex_oport_oport|321|0|512|0|{2|reject|}189|192|}
{2010006001|XXGobject_psameas_object|322|0|514|0|{metadata|reject_metadata|1|0|}192|189|}
{2010212001|XXGvertex_oport_oport|323|0|515|0|{3|error|}189|193|}
{2010006001|XXGobject_psameas_object|324|0|517|0|{metadata|error_metadata|1|0|}193|189|}
{2010212001|XXGvertex_oport_oport|325|0|518|0|{4|log|}189|194|}
{2010006001|XXGobject_psameas_object|326|0|520|0|{metadata|log_metadata|1|0|}194|189|}
{2010211001|XXGvertex_iport_iport|327|0|521|0|{0|in|}189|195|}
{2010006001|XXGobject_psameas_object|328|0|523|0|{metadata|in_metadata|1|0|}195|189|}
{2010006001|XXGobject_psameas_object|329|0|524|0|{Layout|Layout|0|0|}182|158|}
{2010006001|XXGobject_psameas_object|330|0|525|0|{deselect_metadata|out_metadata|0|0|}182|174|}
{2010006001|XXGobject_psameas_object|331|0|526|0|{in_metadata|out_metadata|0|0|}182|174|}
{2010006001|XXGobject_psameas_object|332|0|527|0|{out_metadata|out_metadata|0|0|}182|174|}
{2010006001|XXGobject_psameas_object|333|0|528|0|{reject_metadata|out_metadata|0|0|}182|174|}
{2010601001|XXGgraph_vertex_vertex|334|0|529|0|{Filter_by_Expression|}135|196|}
{2010212001|XXGvertex_oport_oport|335|0|531|0|{0|out|}196|197|}
{2010213001|XXGoport_dst_flow|336|0|533|0|{0|}197|142|}
{2010212001|XXGvertex_oport_oport|337|0|534|0|{1|deselect|}196|198|}
{2010212001|XXGvertex_oport_oport|338|0|536|0|{2|reject|}196|199|}
{2010212001|XXGvertex_oport_oport|339|0|538|0|{3|error|}196|200|}
{2010212001|XXGvertex_oport_oport|340|0|540|0|{4|log|}196|201|}
{2010211001|XXGvertex_iport_iport|341|0|542|0|{0|in|}196|202|}
{2010214001|XXGiport_src_flow|342|0|544|0|{0|}202|148|}
{2010007001|XXGobject_proto_object|343|0|545|0|{}196|203|}
{2010212001|XXGvertex_oport_oport|344|0|547|0|{0|out|}203|204|}
{2010006001|XXGobject_psameas_object|345|0|549|0|{metadata|out_metadata|1|0|}204|203|}
{2010212001|XXGvertex_oport_oport|346|0|550|0|{1|deselect|}203|205|}
{2010006001|XXGobject_psameas_object|347|0|552|0|{metadata|deselect_metadata|1|0|}205|203|}
{2010212001|XXGvertex_oport_oport|348|0|553|0|{2|reject|}203|206|}
{2010006001|XXGobject_psameas_object|349|0|555|0|{metadata|reject_metadata|1|0|}206|203|}
{2010212001|XXGvertex_oport_oport|350|0|556|0|{3|error|}203|207|}
{2010006001|XXGobject_psameas_object|351|0|558|0|{metadata|error_metadata|1|0|}207|203|}
{2010212001|XXGvertex_oport_oport|352|0|559|0|{4|log|}203|208|}
{2010006001|XXGobject_psameas_object|353|0|561|0|{metadata|log_metadata|1|0|}208|203|}
{2010211001|XXGvertex_iport_iport|354|0|562|0|{0|in|}203|209|}
{2010006001|XXGobject_psameas_object|355|0|564|0|{metadata|in_metadata|1|0|}209|203|}
{2010006001|XXGobject_psameas_object|356|0|565|0|{Layout|Layout|0|0|}196|210|}
{2010211001|XXGvertex_iport_iport|357|0|567|0|{0|write|}210|211|}
{2010214001|XXGiport_src_flow|358|0|569|0|{0|}211|141|}
{2010007001|XXGobject_proto_object|359|0|570|0|{}210|212|}
{2010211001|XXGvertex_iport_iport|360|0|572|0|{0|write|}212|213|}
{2010006001|XXGobject_psameas_object|361|0|574|0|{metadata|write_metadata|1|0|}213|212|}
{2010006001|XXGobject_psameas_object|362|0|575|0|{write_metadata|out0_metadata|0|0|}210|214|}
{2010212001|XXGvertex_oport_oport|363|0|577|0|{0|out0|}214|215|}
{2010213001|XXGoport_dst_flow|364|0|579|0|{0|}215|141|}
{2010212001|XXGvertex_oport_oport|365|0|580|0|{1|reject0|}214|216|}
{2010212001|XXGvertex_oport_oport|366|0|582|0|{2|error0|}214|217|}
{2010212001|XXGvertex_oport_oport|367|0|584|0|{3|log|}214|218|}
{2010211001|XXGvertex_iport_iport|368|0|586|0|{0|in|}214|219|}
{2010214001|XXGiport_src_flow|369|0|588|0|{0|}219|142|}
{2010007001|XXGobject_proto_object|370|0|589|0|{}214|220|}
{2010212001|XXGvertex_oport_oport|371|0|591|0|{0|out0|}220|221|}
{2010006001|XXGobject_psameas_object|372|0|593|0|{metadata|out0_metadata|1|0|}221|220|}
{2010006001|XXGobject_psameas_object|373|0|594|0|{transform0|transform0|1|0|}221|220|}
{2010212001|XXGvertex_oport_oport|374|0|595|0|{1|reject0|}220|222|}
{2010006001|XXGobject_psameas_object|375|0|597|0|{metadata|reject0_metadata|1|0|}222|220|}
{2010212001|XXGvertex_oport_oport|376|0|598|0|{2|error0|}220|223|}
{2010006001|XXGobject_psameas_object|377|0|600|0|{metadata|error0_metadata|1|0|}223|220|}
{2010212001|XXGvertex_oport_oport|378|0|601|0|{3|log|}220|224|}
{2010006001|XXGobject_psameas_object|379|0|603|0|{metadata|log_metadata|1|0|}224|220|}
{2010211001|XXGvertex_iport_iport|380|0|604|0|{0|in|}220|225|}
{2010006001|XXGobject_psameas_object|381|0|606|0|{metadata|in_metadata|1|0|}225|220|}
{2010006001|XXGobject_psameas_object|382|0|607|0|{Layout|Layout|0|0|}214|210|}
{2010006001|XXGobject_psameas_object|383|0|608|0|{in_metadata|out_metadata|0|0|}214|174|}
{2010006001|XXGobject_psameas_object|384|0|609|0|{reject0_metadata|out_metadata|0|0|}214|174|}
{2010006001|XXGobject_psameas_object|385|0|610|0|{deselect_metadata|out_metadata|0|0|}196|174|}
{2010006001|XXGobject_psameas_object|386|0|611|0|{in_metadata|out_metadata|0|0|}196|174|}
{2010006001|XXGobject_psameas_object|387|0|612|0|{out_metadata|out_metadata|0|0|}196|174|}
{2010006001|XXGobject_psameas_object|388|0|613|0|{reject_metadata|out_metadata|0|0|}196|174|}
{2010601001|XXGgraph_vertex_vertex|389|0|614|0|{Output_File|}135|158|}
{2010601001|XXGgraph_vertex_vertex|390|0|615|0|{RFMT_Audit|}135|226|}
{2010212001|XXGvertex_oport_oport|391|0|617|0|{0|out0|}226|227|}
{2010213001|XXGoport_dst_flow|392|0|619|0|{0|}227|145|}
{2010212001|XXGvertex_oport_oport|393|0|620|0|{1|reject0|}226|228|}
{2010212001|XXGvertex_oport_oport|394|0|622|0|{2|error0|}226|229|}
{2010212001|XXGvertex_oport_oport|395|0|624|0|{3|log|}226|230|}
{2010211001|XXGvertex_iport_iport|396|0|626|0|{0|in|}226|231|}
{2010007001|XXGobject_proto_object|397|0|628|0|{}226|232|}
{2010212001|XXGvertex_oport_oport|398|0|630|0|{0|out0|}232|233|}
{2010006001|XXGobject_psameas_object|399|0|632|0|{metadata|out0_metadata|1|0|}233|232|}
{2010006001|XXGobject_psameas_object|400|0|633|0|{transform0|transform0|1|0|}233|232|}
{2010212001|XXGvertex_oport_oport|401|0|634|0|{1|reject0|}232|234|}
{2010006001|XXGobject_psameas_object|402|0|636|0|{metadata|reject0_metadata|1|0|}234|232|}
{2010212001|XXGvertex_oport_oport|403|0|637|0|{2|error0|}232|235|}
{2010006001|XXGobject_psameas_object|404|0|639|0|{metadata|error0_metadata|1|0|}235|232|}
{2010212001|XXGvertex_oport_oport|405|0|640|0|{3|log|}232|236|}
{2010006001|XXGobject_psameas_object|406|0|642|0|{metadata|log_metadata|1|0|}236|232|}
{2010211001|XXGvertex_iport_iport|407|0|643|0|{0|in|}232|237|}
{2010006001|XXGobject_psameas_object|408|0|645|0|{metadata|in_metadata|1|0|}237|232|}
{2010006001|XXGobject_psameas_object|409|0|646|0|{Layout|Layout|0|0|}226|158|}
{2010006001|XXGobject_psameas_object|410|0|647|0|{in_metadata|read_metadata|0|0|}226|98|}
{2010006001|XXGobject_psameas_object|411|0|648|0|{out0_metadata|out_metadata|0|0|}226|174|}
{2010006001|XXGobject_psameas_object|412|0|649|0|{reject0_metadata|read_metadata|0|0|}226|98|}
{2010601001|XXGgraph_vertex_vertex|413|0|650|0|{Reformat|}135|214|}
{2010601001|XXGgraph_vertex_vertex|414|0|651|0|{Replicate|}135|238|}
{2010212001|XXGvertex_oport_oport|415|0|653|0|{0|out|}238|239|}
{2010213001|XXGoport_dst_flow|416|0|655|0|{0|}239|138|}
{2010213001|XXGoport_dst_flow|417|0|656|0|{1|}239|151|}
{2010211001|XXGvertex_iport_iport|418|0|657|0|{0|in|}238|240|}
{2010214001|XXGiport_src_flow|419|0|659|0|{0|}240|149|}
{2010007001|XXGobject_proto_object|420|0|660|0|{}238|241|}
{2010212001|XXGvertex_oport_oport|421|0|662|0|{0|out|}241|242|}
{2010006001|XXGobject_psameas_object|422|0|664|0|{metadata|out_metadata|1|0|}242|241|}
{2010211001|XXGvertex_iport_iport|423|0|665|0|{0|in|}241|243|}
{2010006001|XXGobject_psameas_object|424|0|667|0|{metadata|in_metadata|1|0|}243|241|}
{2010006001|XXGobject_psameas_object|425|0|668|0|{Layout|Layout|0|0|}238|158|}
{2010006001|XXGobject_psameas_object|426|0|669|0|{in_metadata|out_metadata|0|0|}238|162|}
{2010006001|XXGobject_psameas_object|427|0|670|0|{out_metadata|out_metadata|0|0|}238|162|}
{2010601001|XXGgraph_vertex_vertex|428|0|671|0|{Replicate_1|}135|244|}
{2010212001|XXGvertex_oport_oport|429|0|673|0|{0|out|}244|245|}
{2010213001|XXGoport_dst_flow|430|0|675|0|{0|}245|148|}
{2010213001|XXGoport_dst_flow|431|0|676|0|{1|}245|143|}
{2010211001|XXGvertex_iport_iport|432|0|677|0|{0|in|}244|246|}
{2010214001|XXGiport_src_flow|433|0|679|0|{0|}246|147|}
{2010007001|XXGobject_proto_object|434|0|680|0|{}244|247|}
{2010212001|XXGvertex_oport_oport|435|0|682|0|{0|out|}247|248|}
{2010006001|XXGobject_psameas_object|436|0|684|0|{metadata|out_metadata|1|0|}248|247|}
{2010211001|XXGvertex_iport_iport|437|0|685|0|{0|in|}247|249|}
{2010006001|XXGobject_psameas_object|438|0|687|0|{metadata|in_metadata|1|0|}249|247|}
{2010006001|XXGobject_psameas_object|439|0|688|0|{Layout|Layout|0|0|}244|158|}
{2010006001|XXGobject_psameas_object|440|0|689|0|{in_metadata|out_metadata|0|0|}244|174|}
{2010006001|XXGobject_psameas_object|441|0|690|0|{out_metadata|out_metadata|0|0|}244|174|}
{2010601001|XXGgraph_vertex_vertex|442|0|691|0|{Send_Mail|}135|250|}
{2010212001|XXGvertex_oport_oport|443|0|693|0|{0|out|}250|251|}
{2010212001|XXGvertex_oport_oport|444|0|695|0|{1|reject|}250|252|}
{2010213001|XXGoport_dst_flow|445|0|697|0|{0|}252|139|}
{2010212001|XXGvertex_oport_oport|446|0|698|0|{2|error|}250|253|}
{2010213001|XXGoport_dst_flow|447|0|700|0|{0|}253|140|}
{2010212001|XXGvertex_oport_oport|448|0|701|0|{3|log|}250|254|}
{2010211001|XXGvertex_iport_iport|449|0|703|0|{0|in|}250|255|}
{2010214001|XXGiport_src_flow|450|0|705|0|{0|}255|138|}
{2010007001|XXGobject_proto_object|451|0|706|0|{}250|256|}
{2010212001|XXGvertex_oport_oport|452|0|708|0|{0|out|}256|257|}
{2010006001|XXGobject_psameas_object|453|0|710|0|{metadata|out_metadata|1|0|}257|256|}
{2010212001|XXGvertex_oport_oport|454|0|711|0|{1|reject|}256|258|}
{2010006001|XXGobject_psameas_object|455|0|713|0|{metadata|reject_metadata|1|0|}258|256|}
{2010212001|XXGvertex_oport_oport|456|0|714|0|{2|error|}256|259|}
{2010006001|XXGobject_psameas_object|457|0|716|0|{metadata|error_metadata|1|0|}259|256|}
{2010212001|XXGvertex_oport_oport|458|0|717|0|{3|log|}256|260|}
{2010006001|XXGobject_psameas_object|459|0|719|0|{metadata|log_metadata|1|0|}260|256|}
{2010211001|XXGvertex_iport_iport|460|0|720|0|{0|in|}256|261|}
{2010006001|XXGobject_psameas_object|461|0|722|0|{metadata|in_metadata|1|0|}261|256|}
{2010006001|XXGobject_psameas_object|462|0|723|0|{Layout|Layout|0|0|}250|158|}
{2010006001|XXGobject_psameas_object|463|0|724|0|{in_metadata|out_metadata|0|0|}250|162|}
{2010006001|XXGobject_psameas_object|464|0|725|0|{reject_metadata|out_metadata|0|0|}250|162|}
{2010601001|XXGgraph_vertex_vertex|465|0|726|0|{Trash_2|}135|262|}
{2010211001|XXGvertex_iport_iport|466|0|728|0|{0|in|}262|263|}
{2010214001|XXGiport_src_flow|467|0|730|0|{0|}263|139|}
{2010007001|XXGobject_proto_object|468|0|731|0|{}262|264|}
{2010211001|XXGvertex_iport_iport|469|0|733|0|{0|in|}264|265|}
{2010006001|XXGobject_psameas_object|470|0|735|0|{metadata|in_metadata|1|0|}265|264|}
{2010006001|XXGobject_psameas_object|471|0|736|0|{Layout|Layout|0|0|}262|158|}
{2010006001|XXGobject_psameas_object|472|0|737|0|{in_metadata|out_metadata|0|0|}262|162|}
{2010601001|XXGgraph_vertex_vertex|473|0|738|0|{Trash_3|}135|266|}
{2010211001|XXGvertex_iport_iport|474|0|740|0|{0|in|}266|267|}
{2010214001|XXGiport_src_flow|475|0|742|0|{0|}267|140|}
{2010007001|XXGobject_proto_object|476|0|743|0|{}266|268|}
{2010211001|XXGvertex_iport_iport|477|0|745|0|{0|in|}268|269|}
{2010006001|XXGobject_psameas_object|478|0|747|0|{metadata|in_metadata|1|0|}269|268|}
{2010006001|XXGobject_psameas_object|479|0|748|0|{Layout|Layout|0|0|}266|158|}
{2010006001|XXGobject_psameas_object|480|0|749|0|{in_metadata|error_metadata|0|0|}266|250|}
{2010601001|XXGgraph_vertex_vertex|481|0|750|0|{audit_report_file|}135|210|}
{2010211001|XXGvertex_iport_iport|482|0|751|0|{0|in0|}135|270|}
{2010215002|XXGiport_binding_iport|483|0|753|0|{.5|.5|{0|}5815|}270|231|}
{2010214001|XXGiport_src_flow|484|0|754|0|{0|}270|10|}
{2010601001|XXGgraph_vertex_vertex|485|0|755|0|{audit_report_dat|}1|98|}
{2010109001|XXGobject_property_value|486|0|756|0|{0|TrackingThumbprint|72|}1|271|}
